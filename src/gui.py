from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from PySide6.QtCore import QObject, Signal, Property, QUrl, QAbstractListModel, QModelIndex, Qt, Slot, QByteArray, QThread, QTimer

import sys
import os
import json
import time

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
    
    # Handle response - try parsed first, then text fallback
    if hasattr(response, 'parsed') and response.parsed:
        return response.parsed
    elif hasattr(response, 'text') and response.text:
        try:
            data = json.loads(response.text)
            return TaskPlan(**data)
        except json.JSONDecodeError as e:
            raise ValueError(f"Failed to parse response JSON: {e}")
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
    isGeneratingChanged = Signal(bool)
    progressChanged = Signal(float)

    def __init__(self, parent=None):
        super().__init__(parent)
        self._task_list_model = TaskListModel(self)
        self._is_generating = False
        self._progress = 0.0
        self._progress_timer = None
        self._worker_thread = None
        self.taskPlanGenerated.connect(self._task_list_model.setTasks)

    @Property(QObject, constant=True)
    def taskListModel(self):
        return self._task_list_model

    @Property(bool, notify=isGeneratingChanged)
    def isGenerating(self):
        return self._is_generating

    @Property(float, notify=progressChanged)
    def progress(self):
        return self._progress

    def _set_progress(self, value):
        """Set progress value and emit signal if changed"""
        if self._progress != value:
            self._progress = value
            self.progressChanged.emit(value)

    def _simulate_progress(self):
        """Gradually increment progress value"""
        if self._progress < 90:
            # Add random increments that decrease as we get closer to 100
            increment = (90 - self._progress) * 0.15
            self._set_progress(self._progress + increment)

    @Slot(str)
    def generatePlan(self, large_task: str):
        print(f"Generating plan for: {large_task}")
        if not large_task.strip():
            print("Error: Task description is empty")
            return
        
        # Reset progress and set generating state
        self._set_progress(0.0)
        self._is_generating = True
        self.isGeneratingChanged.emit(True)
        
        # Start progress simulation timer
        self._progress_timer = QTimer()
        self._progress_timer.timeout.connect(self._simulate_progress)
        self._progress_timer.start(200)  # Update every 200ms
        
        # Create and start worker thread
        self._worker_thread = PlanGenerationWorker(large_task)
        self._worker_thread.finished.connect(self._on_plan_generated)
        self._worker_thread.error.connect(self._on_generation_error)
        self._worker_thread.start()

    def _on_plan_generated(self, plan):
        """Called when plan generation completes"""
        # Stop progress timer and complete progress bar
        if self._progress_timer:
            self._progress_timer.stop()
            self._progress_timer = None
        self._set_progress(100.0)
        
        self.taskPlanGenerated.emit(plan)
        print("Task plan generated and emitted.")
        
        # Keep progress bar at 100 for a moment before resetting
        QTimer.singleShot(500, self._reset_generation_state)
        
        # Clean up worker thread
        if self._worker_thread:
            self._worker_thread.quit()
            self._worker_thread.wait()
            self._worker_thread = None

    def _on_generation_error(self, error_msg):
        """Called when plan generation fails"""
        print(f"Error generating task plan: {error_msg}")
        self._reset_generation_state()
        
        # Clean up worker thread
        if self._worker_thread:
            self._worker_thread.quit()
            self._worker_thread.wait()
            self._worker_thread = None

    def _reset_generation_state(self):
        """Reset the generating state and progress"""
        self._is_generating = False
        self.isGeneratingChanged.emit(False)
        self._set_progress(0.0)


class PlanGenerationWorker(QThread):
    """Worker thread for generating task plans"""
    finished = Signal(TaskPlan)
    error = Signal(str)

    def __init__(self, large_task: str, parent=None):
        super().__init__(parent)
        self.large_task = large_task

    def run(self):
        """Run the plan generation in a background thread"""
        try:
            plan = generate_task_plan(self.large_task)
            self.finished.emit(plan)
        except ValueError as e:
            self.error.emit(f"Validation error: {e}")
        except Exception as e:
            self.error.emit(f"{type(e).__name__}: {e}")

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
