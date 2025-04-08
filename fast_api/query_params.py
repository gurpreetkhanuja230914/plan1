from fastapi import FastAPI
app=FastAPI()
@app.get("/")
def read_root():
    return {"messege":"hello api"}
@app.get("/item/{item_id}")
def new_query_read(item_id):
    return {"item_id is ":item_id}
@app.get("/items/{item_id}")
def new_query_book(item_id:int,item_name:str="book",item_price :float=0.0):
    return {"item_id is ": item_id ,"item_name is ": item_name,"item_price is ":item_price}
