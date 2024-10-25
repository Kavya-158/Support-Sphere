import pymysql 
import pymongo 
import mysql.connector 
# Connect to MySQL 
connection = mysql.connector.connect(host='localhost',database='supportsphere',user='root',password='Kavya@158') 
mysql_cursor = connection.cursor() 
# Connect to MongoDB 
client = pymongo.MongoClient("mongodb://localhost:27017") 
mongo_db = client["SupportSphere"] 
mongo_collection = mongo_db["User"] 
# Query data from MySQL and insert into MongoDB 
mysql_cursor.execute("SELECT UserID,Name,AppliedUniversity FROM user") 
rows = mysql_cursor.fetchall() 
# Insert data into MongoDB 
for row in rows: 
    doc = {"UserID": row[0], "Name": row[1],"AppliedUniversity":row[2]}   
# Create a document from MySQL row 
mongo_collection.insert_one(doc) 
# Close connections 
connection.close() 
client.close()