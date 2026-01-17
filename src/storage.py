import json
import os
from pathlib import Path
from typing import Optional
from .models import TaskPlan, TaskNode, Timeline


class RoadmapStorageManager:
    """Handles saving and loading task plan roadmaps to JSON files."""
    
    def __init__(self, storage_dir: Optional[str] = None):
        """
        Initialize the storage manager.
        
        Args:
            storage_dir: Directory to store roadmap files. 
                        Defaults to ~/.stepsketch/roadmaps/
        """
        if storage_dir is None:
            home_dir = Path.home()
            storage_dir = home_dir / ".stepsketch" / "roadmaps"
        else:
            storage_dir = Path(storage_dir)
        
        self.storage_dir = Path(storage_dir)
        self.storage_dir.mkdir(parents=True, exist_ok=True)
    
    def _get_roadmap_path(self, task_id: str) -> Path:
        """Get the file path for a specific roadmap."""
        # Sanitize task_id to be filename-safe
        safe_id = "".join(c if c.isalnum() or c in "-_" else "_" for c in task_id)
        return self.storage_dir / f"{safe_id}.json"
    
    def save_data(self, task_plan: TaskPlan) -> bool:
        """
        Save a task plan to JSON file.
        
        Args:
            task_plan: TaskPlan object to save
            
        Returns:
            True if successful, False otherwise
        """
        try:
            file_path = self._get_roadmap_path(task_plan.task_id)
            
            plan_data = task_plan.model_dump(mode='json')
            
            with open(file_path, 'w') as f:
                json.dump(plan_data, f, indent=2)
            
            print(f"Roadmap saved successfully to: {file_path}")
            return True
        except Exception as e:
            print(f"Error saving roadmap: {type(e).__name__}: {e}")
            return False
    
    def load_data(self, task_id: str) -> Optional[TaskPlan]:
        """
        Load a task plan from JSON file.
        
        Args:
            task_id: The task ID to load
            
        Returns:
            TaskPlan object if found and valid, None otherwise
        """
        try:
            file_path = self._get_roadmap_path(task_id)
            
            if not file_path.exists():
                print(f"Roadmap file not found: {file_path}")
                return None
            
            with open(file_path, 'r') as f:
                plan_data = json.load(f)
            
            task_plan = TaskPlan(**plan_data)
            print(f"Roadmap loaded successfully from: {file_path}")
            return task_plan
        except json.JSONDecodeError as e:
            print(f"Error decoding JSON: {e}")
            return None
        except Exception as e:
            print(f"Error loading roadmap: {type(e).__name__}: {e}")
            return None
    
    def list_saved_roadmaps(self) -> list:
        """
        List all saved roadmap files.
        
        Returns:
            List of file paths for saved roadmaps
        """
        try:
            roadmaps = list(self.storage_dir.glob("*.json"))
            print(f"Found {len(roadmaps)} saved roadmaps")
            return roadmaps
        except Exception as e:
            print(f"Error listing roadmaps: {type(e).__name__}: {e}")
            return []
    
    def get_most_recent_roadmap(self) -> Optional[TaskPlan]:
        """
        Load the most recently modified roadmap.
        
        Returns:
            TaskPlan object if any roadmap exists, None otherwise
        """
        try:
            roadmaps = self.list_saved_roadmaps()
            if not roadmaps:
                return None
            
            most_recent = max(roadmaps, key=lambda p: p.stat().st_mtime)
            
            with open(most_recent, 'r') as f:
                plan_data = json.load(f)
            
            task_plan = TaskPlan(**plan_data)
            print(f"Loaded most recent roadmap: {most_recent}")
            return task_plan
        except Exception as e:
            print(f"Error loading most recent roadmap: {type(e).__name__}: {e}")
            return None
    
    def delete_roadmap(self, task_id: str) -> bool:
        """
        Delete a saved roadmap.
        
        Args:
            task_id: The task ID to delete
            
        Returns:
            True if successful, False otherwise
        """
        try:
            file_path = self._get_roadmap_path(task_id)
            
            if file_path.exists():
                file_path.unlink()
                print(f"Roadmap deleted: {file_path}")
                return True
            else:
                print(f"Roadmap file not found: {file_path}")
                return False
        except Exception as e:
            print(f"Error deleting roadmap: {type(e).__name__}: {e}")
            return False
