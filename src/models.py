from typing import List, Optional, Literal
from pydantic import BaseModel, Field

NodeType = Literal["task", "milestone", "decision", "action"]
NodeStatus = Literal["NOT_STARTED", "IN_PROGRESS", "COMPLETED", "PENDING", "OPTIONAL", "BLOCKED"]

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
    status: NodeStatus = "NOT_STARTED"
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
