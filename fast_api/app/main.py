from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
import app.models as models
import app.crud as crud
import app.schemas as schemas
from app.database import SessionLocal, engine, Base
from typing import List  # at the top of your file

Base.metadata.create_all(bind=engine)

app = FastAPI()

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/items/", response_model=schemas.Item)
def create(item: schemas.ItemCreate, db: Session = Depends(get_db)):
    return crud.create_item(db=db, item=item)

@app.get("/items/", response_model=List[schemas.Item])
def read_items(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return crud.get_items(db, skip=skip, limit=limit)

@app.get("/items/{item_id}", response_model=schemas.Item)
def read_item(item_id: int, db: Session = Depends(get_db)):
    db_item = crud.get_item(db, item_id)
    if db_item is None:
        raise HTTPException(status_code=404, detail="Item not found")
    return db_item

@app.delete("/items/delete/{item_id}", response_model=schemas.Item)
def delete(item_id: int, db: Session = Depends(get_db)):
    item = crud.delete_item(db, item_id)
    if item is None:
        raise HTTPException(status_code=404, detail="Item not found")
    return item

@app.put("/items/update/{item_id}", response_model=schemas.Item)
def update_item(item_id: int, item: schemas.ItemPut, db: Session = Depends(get_db)):
    updated_item = crud.update_item(db, item_id, item)
    if updated_item is None:
        raise HTTPException(status_code=404, detail="Item not found")
    return updated_item
@app.put("/items/patch/{item_id}", response_model=schemas.Item)
def update_item(item_id: int, item: schemas.ItemPatch, db: Session = Depends(get_db)):
    updated_item = crud.update_item(db, item_id, item)
    if updated_item is None:
        raise HTTPException(status_code=404, detail="Item not found")
    return updated_item