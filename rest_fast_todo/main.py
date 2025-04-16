from fastapi import FastAPI,Request
from fastapi.responses import  RedirectResponse
from fastapi.templating import Jinja2Templates
import json 
from io import StringIO
app= FastAPI()
templates= Jinja2Templates(directory="templates")
@app.get("/view")
async def root(request: Request):
    with open('database.json') as f :
        print("dbhdbh")
        data=json.load(f)
        print("dbhdbh")
        
    return templates.TemplateResponse("index.html",{"request":request,"tododict":data})
@app.get("/delete/{id}")
async def delete_todo(request:Request,id:str):
    with open('/home/my/plan_1/plan1/rest_fast_todo/database.json') as f :
        print("ioio")
        data=json.load(f)
    del data[id]
    with open('database.json','w', encoding='utf-8') as f:
        json.dump(data,f)
    return RedirectResponse("/",303)
@app.post("/add")
async def add_todo(request:Request):
    with open('database.json') as f :
        print("00000")
        data=json.load(f)
    formdata=await request.form()
    print("00000")
    newdata={}

    i=1
    for id in data:
        newdata[str(i)]=data[id]
        i+=1
    newdata[str(i)]=formdata["newtodo"]
    print(newdata)
    with open('database.json','w') as f:
        json.dump(newdata,f)
    return RedirectResponse("/",303)