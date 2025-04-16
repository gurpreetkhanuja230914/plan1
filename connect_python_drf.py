import requests
r=requests.get('http://127.0.0.1:8000/catalog/')
data=r.json()
print("nonu hai ",data['nonu'])
