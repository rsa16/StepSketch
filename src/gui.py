from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from PySide6.QtCore import QObject, Signal, Property, QUrl, QAbstractListModel, QModelIndex, Qt, Slot, QByteArray

import sys
import os
import json

from .models import TaskPlan, TaskNode, NodeType, NodeStatus
from google.genai import types
from google import genai

from .models import TaskPlan
from .config import SYSTEM_INSTRUCTION
from dotenv import load_dotenv

import os

basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, '.env'))

QML_IMPORT_NAME = "io.stepsketch.backend"
QML_IMPORT_MAJOR_VERSION = 1
API_KEY = os.getenv("GEMINI_API_KEY", None)

if not API_KEY:
    print("ERROR: please provide api key in environment variable GEMINI_API_KEY")

client = genai.Client(api_key=API_KEY) if API_KEY else None

def generate_task_plan(large_task: str) -> TaskPlan:
    if not client:
        raise ValueError("Gemini API client not initialized. Please set GEMINI_API_KEY environment variable.")
    
    response = client.models.generate_content(
        model="gemini-2.5-flash-lite",
        contents=large_task,
        config=types.GenerateContentConfig(
            system_instruction=SYSTEM_INSTRUCTION,
            response_schema=TaskPlan,
            response_mime_type="application/json"
        ),
    )
    
    if hasattr(response, 'parsed') and response.parsed:
        return response.parsed
    else:
        raise ValueError(f"Invalid response from API: {response}")

class TaskNodeData(QObject):
    def __init__(self, task_node: TaskNode, parent=None):
        super().__init__(parent)
        self._id = task_node.id
        self._title = task_node.title
        self._description = task_node.description
        self._type = task_node.type if isinstance(task_node.type, str) else str(task_node.type)
        self._status = task_node.status if isinstance(task_node.status, str) else str(task_node.status)
        self._depends_on = ", ".join(task_node.depends_on)
        self._timeline_duration = task_node.timeline.estimated_duration if task_node.timeline else "N/A"

    @Property(str, constant=True)
    def id(self):
        return self._id

    @Property(str, constant=True)
    def title(self):
        return self._title

    @Property(str, constant=True)
    def description(self):
        return self._description

    @Property(str, constant=True)
    def type(self):
        return self._type

    @Property(str, constant=True)
    def status(self):
        return self._status

    @Property(str, constant=True)
    def depends_on(self):
        return self._depends_on

    @Property(str, constant=True)
    def timeline_duration(self):
        return self._timeline_duration


class TaskListModel(QAbstractListModel):
    IdRole = Qt.UserRole + 1
    TitleRole = Qt.UserRole + 2
    DescriptionRole = Qt.UserRole + 3
    TypeRole = Qt.UserRole + 4
    StatusRole = Qt.UserRole + 5
    DependsOnRole = Qt.UserRole + 6
    TimelineDurationRole = Qt.UserRole + 7

    _roles = {
        IdRole: QByteArray(b"id"),
        TitleRole: QByteArray(b"title"),
        DescriptionRole: QByteArray(b"description"),
        TypeRole: QByteArray(b"type"),
        StatusRole: QByteArray(b"status"),
        DependsOnRole: QByteArray(b"dependsOn"),
        TimelineDurationRole: QByteArray(b"timelineDuration"),
    }

    def __init__(self, parent=None):
        super().__init__(parent)
        self._tasks = []

    def rowCount(self, parent=QModelIndex()):
        return len(self._tasks)

    def data(self, index, role=Qt.DisplayRole):
        if not index.isValid() or not (0 <= index.row() < self.rowCount()):
            return None

        task = self._tasks[index.row()]

        if role == TaskListModel.IdRole:
            return task.id
        elif role == TaskListModel.TitleRole:
            return task.title
        elif role == TaskListModel.DescriptionRole:
            return task.description
        elif role == TaskListModel.TypeRole:
            return task.type
        elif role == TaskListModel.StatusRole:
            return task.status
        elif role == TaskListModel.DependsOnRole:
            return task.depends_on
        elif role == TaskListModel.TimelineDurationRole:
            return task.timeline_duration
        return None

    def roleNames(self):
        return self._roles

    @Slot(object)
    def setTasks(self, task_plan):
        if not isinstance(task_plan, TaskPlan):
            print(f"Warning: Expected TaskPlan, got {type(task_plan)}")
            return
        self.beginResetModel()
        self._tasks = [TaskNodeData(node) for node in task_plan.nodes]
        self.endResetModel()

@QmlElement
class Backend(QObject):
    taskPlanGenerated = Signal(TaskPlan)

    def __init__(self, parent=None):
        super().__init__(parent)
        self._task_list_model = TaskListModel(self)
        self.taskPlanGenerated.connect(self._task_list_model.setTasks)

    @Property(QObject, constant=True)
    def taskListModel(self):
        return self._task_list_model

    @Slot(str)
    def generatePlan(self, large_task: str):
        print(f"Generating plan for: {large_task}")
        if not large_task.strip():
            print("Error: Task description is empty")
            return
        
        try:
            plan = generate_task_plan(large_task)
            self.taskPlanGenerated.emit(plan)
            print("Task plan generated and emitted.")
        except ValueError as e:
            print(f"Validation error generating task plan: {e}")
        except Exception as e:
            print(f"Error generating task plan: {type(e).__name__}: {e}")
            import traceback
            traceback.print_exc()

def main():
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    
    qml_file = QUrl.fromLocalFile(f"{os.path.dirname(__file__)}/qml/main.qml")
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())

if __name__ == "__main__":
    main()
