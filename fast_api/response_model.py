from fastapi import FastAPI
from pydantic import BaseModel 

app=FastAPI()

class IN(BaseModel):
    name :str
    age:int
    address:str
    email:str
    password:str
class Out(BaseModel):
    name:str
    age:int
    address:str
    email:str
@app.post("/items/",response_model=Out)
def get_item(item:IN):
    return item

