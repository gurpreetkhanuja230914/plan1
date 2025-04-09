from pydantic import BaseModel
from typing import Optional
class ItemCreate(BaseModel):
    name: str
    description: str

class Item(BaseModel):
    id: int
    name: str
    description: str

    class Config:
        orm_mode = True
class ItemPatch(BaseModel):  # Not from Item!
    name: Optional[str] = None
    description: Optional[str] = None
class ItemPut(BaseModel):  # Not from Item!
    name: str 
    description: str
