import mysql.connector, sys
from mysql.connector import Error

sys.path.append('./Models/')
from Models import *

"""
Install: pip install mysql-connector-python
Run this SQL command fist:
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'very_strong_password'; 
FLUSH PRIVILEGES;
This is example, let's create a function as API
"""


class lecturerUtils:
    def __init__(self):
        try:
            self.connection = mysql.connector.connect(
                host='localhost', database='MCQS_EXAMS_BANK', user='root', password='very_strong_password', auth_plugin='mysql_native_password', autocommit=True)
        except Error as e:
            print("Error while connection to Mysql", e)

    # Data req. 6
    # return list MarkInExam object
    def viewAllStudentsMarks(self, subCode, examDate):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('view_all_students_mark', [subCode, examDate])
            markList = [MarkInExam(*item) for result in cursor.stored_results() for item in result]
            cursor.close()
            return markList

    # Data req. 7
    # return NumQuestion object
    def viewRightWrongStudentsNum(self, subCode, examDate, questionID):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('view_doing_right_wrong_students', [subCode, examDate, questionID])
            RWnum = [NumQuestion(*item) for result in cursor.stored_results() for item in result]
            cursor.close()
            return RWnum

    # Data req. 8
    # return OutcomeResult object
    def viewRatioOfEachOutcome(self, subCode, examDate):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('view_ratio_doing_right_studs', [subCode, examDate])
            ratio = [OutcomeResult(*item) for result in cursor.stored_results() for item in result]
            cursor.close()
            return ratio

    # Data req. 9
    # return list NumQuestion object
    def view5QuesMaxNumWrong(self, subCode, examDate):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('view_5_ques_max_studs_doing_wrong', [subCode, examDate])
            W5num = [NumQuestion(*item) for result in cursor.stored_results() for item in result]
            cursor.close()
            return W5num

    # Data req. 10
    # return list NumQuestion object
    def viewAllQuesMaxNumWrong(self, subCode):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('view_all_quess_max_studs_doing_wrong', [subCode])
            ques = [NumQuestion(*item) for result in cursor.stored_results() for item in result]
            cursor.close()
            return ques

    # Data req. 11
    # return OutcomeResult object
    def viewOutcomeLowestGrade(self, subCode, examDate):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('view_lowest_grade_outcome_on', [subCode, examDate])
            lowestout = [OutcomeResult(*item) for result in cursor.stored_results() for item in result]
            cursor.close()
            return lowestout

    # Data req. 12
    # return list OutcomeResult object
    def viewOutcomeLowestGrade3(self, subCode):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('view_lowest_grade_outcome_on_lastest_3_exam', [subCode])
            lowest3out = [OutcomeResult(*item) for result in cursor.stored_results() for item in result]
            cursor.close()
            return lowest3out

    def __del__(self):
        self.connection.close()

if __name__ == "__main__":
    newUtils = lecturerUtils()




