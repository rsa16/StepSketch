from typing import List, Optional, Literal
from pydantic import BaseModel, Field
from config import SYSTEM_INSTRUCTION

import os
from google import genai
from google.genai import types

API_KEY = os.getenv("GEMINI_API_KEY", None)

if not API_KEY:
    print("ERROR: please provide api key in environment variable GEMINI_API_KEY")

client = genai.Client(api_key=API_KEY)

NodeType = Literal["task", "milestone", "decision", "action"]
NodeStatus = Literal["pending", "optional", "blocked"]

class Timeline(BaseModel):
    estimated_duration: str
    earliest_start: str = ""
    latest_finish: str = ""
    can_run_parallel: bool = False

class TaskNode(BaseModel):
    id: str
    title: str
    description: str
    type: NodeType
    status: NodeStatus = "pending"
    depends_on: List[str] = Field(default_factory=list)
    timeline: Optional[Timeline] = None
    inputs: List[str] = Field(default_factory=list)
    outputs: List[str] = Field(default_factory=list)
    child_ids: List[str] = Field(default_factory=list)

class TaskPlan(BaseModel):
    task_id: str
    task_name: str
    task_description: str
    assumptions: List[str] = Field(default_factory=list)
    constraints: List[str] = Field(default_factory=list)
    nodes: List[TaskNode]

def generate_task_plan(large_task: str) -> TaskPlan:
    response = client.models.generate_content(
        model="gemini-2.5-flash",
        contents=large_task,
        config=types.GenerateContentConfig(
            system_instruction=SYSTEM_INSTRUCTION,
            response_schema=TaskPlan
        ),
    )

    return response

if __name__ == "__main__":
    task = "Teach me how to build a PC"
    plan = generate_task_plan(task)
    print(plan.parsed)
    print(plan.text)
