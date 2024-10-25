import mysql.connector 
from mysql.connector import Error 
try: 
    connection = mysql.connector.connect(host='localhost', database='supportsphere', user='root', password='Kavya@158') 
    if connection.is_connected(): 
        db_Info = connection.get_server_info() 
        print("Connected to MySQL Server version ", db_Info) 
    cursor = connection.cursor() 
    cursor.execute("select database();") 
    record = cursor.fetchone() 
    print("Your connected to database: ", record) 
#QUERY 1 
    sql_select_Query = "select name from expert where University = 'CMU'" 
    cursor = connection.cursor() 
    cursor.execute(sql_select_Query) 
    records = cursor.fetchall() 
    print("Experts from CMU:\n") 
    for row in records: 
        print('Expert =',row[0],"\n") 
#QUERY2 
    sql_select_Query = "Select SSN, Companyname From Employment_support Where WorkExperiance> 3;" 
    cursor = connection.cursor() 
    cursor.execute(sql_select_Query) 
    records = cursor.fetchall() 
    print("Employees with more than 3 years experiance:\n") 
    for row in records: 
        print('Employees =',row[0],"\n") 
#QUERY 3 
    sql_select_Query = "Select I.ID,I.name From immigration_expert I Where 1 < (select count(IG.userID) from immigration_guidance IG Where I.ID = IG.ID);" 
    cursor = connection.cursor() 
    cursor.execute(sql_select_Query) 
    records = cursor.fetchall() 
    print("Immigration experts who guide more than one user:\n") 
    for row in records: 
        print('Experts =',row[0],"\n") 
#EXCEPT BLOCK 
except Error as e: 
    print("Error while connecting to MySQL", e) 
finally: 
    if (connection.is_connected()): 
        cursor.close() 
        connection.close() 
