import psycopg2
conn= psycopg2.connect(dbname="school_db",host="localhost",user="root",password="Gurpreet@2309")
cursor=conn.cursor()
cursor.execute("select * from students;")
record=cursor.fetchall()
print("data from database ",record)