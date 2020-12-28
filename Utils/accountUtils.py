from dataclasses import dataclass
import mysql.connector, sys
from mysql.connector import Error
import hashlib

"""
Using MD5 hashing
"""

@dataclass
class accountState():
    username: str
    ID: str

@dataclass
class accountStudent(accountState):
    pass

@dataclass
class accountLecturer(accountState):
    pass

class accountUtils:
    def __init__(self):
        try:
            self.connection = mysql.connector.connect(
                host='localhost', database='MCQS_EXAMS_BANK', user='root', password='very_strong_password', auth_plugin='mysql_native_password', autocommit=True)
        except Error as e:
            print("Error while connection to Mysql", e)

    def checkStudentLogin(self, username, password):
        """ Return true if student's username and password are correct """
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            passwordHasing = hashlib.md5(password.encode()).hexdigest()
            cursor.execute("SELECT * FROM studentAccount WHERE username = %s AND password = %s", (username, passwordHasing))
            data = cursor.fetchone()
            cursor.close()
            return None if data is None else accountStudent(username, data[2])

    def checkLecturerLogin(self, username, password):
        """ Return true if lecturer's username and password are correct """
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            passwordHasing = hashlib.md5(password.encode()).hexdigest()
            cursor.execute("SELECT * FROM lecturerAccount WHERE username = %s AND password = %s", (username, passwordHasing))
            data = cursor.fetchone()
            cursor.close()
            return None if data is None else accountLecturer(username, data[2])

    def changePassword(self, username, currentPassword, newPassword):
        """ Change password. Return false if current password is incorrect """
        if self.connection.is_connected():
            if self.checkStudentLogin(username, currentPassword):
                cursor = self.connection.cursor()
                passwordHasing = hashlib.md5(newPassword.encode()).hexdigest()
                cursor.execute("UPDATE studentAccount SET password = %s WHERE username = %s", (passwordHasing, username))
                cursor.close()
                return True
            if self.checkLecturerLogin(username, currentPassword):
                cursor = self.connection.cursor()
                passwordHasing = hashlib.md5(newPassword.encode()).hexdigest()
                cursor.execute("UPDATE lecturerAccount SET password = %s WHERE username = %s", (passwordHasing, username))
                cursor.close()
                return True
            return False

    def createAccount(self, username, password, ID):
        """ Create account. If this is studentID/lecturerID => studentAccount/lecturerAccount """
        if self.connection.is_connected():
            passwordHasing = hashlib.md5(password.encode()).hexdigest()
            cursor = self.connection.cursor()

            cursor.execute("SELECT * FROM LECTURER WHERE Lecturer_ID = %s;", (ID,))
            if cursor.fetchone():
                cursor.execute("INSERT IGNORE INTO lecturerAccount VALUES (%s, %s, %s);", (username, passwordHasing, ID))
                cursor.close()
                return True
                
            cursor.execute("SELECT * FROM STUDENT WHERE Student_ID = %s;", (ID, ))
            if cursor.fetchone():
                cursor.execute("INSERT IGNORE INTO lecturerAccount VALUES (%s, %s, %s);", (username, passwordHasing, ID))
                cursor.close()
                return True
            return False

if __name__ == "__main__":
    login = accountUtils()
    # print(login.checkStudentLogin('student1','abc'))
    print(login.checkLecturerLogin('lecturer1', 'abc'))
    # print(login.changePassword('student1','abc','abc'))
    # print(login.createAccount('lecturer6','abc','GV444444'))
