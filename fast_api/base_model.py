from fastapi import FastAPI
from pydantic import BaseModel

app=FastAPI()

class APIS(BaseModel):
    name:str
    description:str=None
    price:float
    in_stock:bool=True

@app.post("/items/")
def create_item(item:APIS):
    return {"messege":"item received ","item":item}

