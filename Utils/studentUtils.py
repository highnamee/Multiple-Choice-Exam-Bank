import mysql.connector
from mysql.connector import Error
from Utils.Models import *
"""
Install: pip install mysql-connector-python

Run this SQL command fist:
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'very_strong_password'; 
FLUSH PRIVILEGES;

This is example, let's create a function as API
"""

try:
    connection = mysql.connector.connect(host='localhost',database='MCQS_EXAMS_BANK',user='root',password='very_strong_password',auth_plugin = 'mysql_native_password')
    if connection.is_connected():
        SQL = "select * from student;"
        cursor = connection.cursor()
        cursor.execute(SQL)
        result_list = cursor.fetchall()      #return sql result
        #print("fetch result-->",result_list)  #is s list type, need to be a dict
        fields_list = cursor.description   # sql key name
        #print("fields result -->",fields_list)

        # Convert to Object
        student_list = [Student(item[0], item[1], item[2], item[3], item[4], item[5], item[6]) for item in result_list]
        for item in student_list:
            print(item)

        cursor.close()
        connection.close()
except Error as e:
    print("Error while connection to Mysql", e)
finally:
    connection.close()
    print("==== mysql closed===")