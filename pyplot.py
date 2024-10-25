import matplotlib.pyplot as plt 
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
# Fetch data from the database 
    sql_select_Query = "Select E.SSN,(select count(S.ID) from seeking_employment_support S where E.SSN = S.SSN ) as SupportNumber From employment_support E;" 
    cursor = connection.cursor() 
    cursor.execute(sql_select_Query) 
    records = cursor.fetchall() 
    SSN = [row[0] for row in records] 
    Count = [row[1] for row in records] 
# Plot the data 
    plt.plot(SSN, Count) 
    plt.xlabel('SSN') 
    plt.ylabel('Count') 
    plt.title('Employees over experts seeking support') 
    plt.xticks(rotation=45) 
    plt.tight_layout() 
# Show the plot 
    plt.show() 
# Close the connection 
except Error as e: 
    print("Error while connecting to MySQL", e) 
finally: 
    if (connection.is_connected()): 
        cursor.close() 
        connection.close() 
        print("MySQL connection is closed") 