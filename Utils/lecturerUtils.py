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

    # View subject list that lecturer in charge
    def viewInchrSubject(self, lecID):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT Subject_Code, Name FROM LEC_INCHARGE_SUB JOIN SUBJECT ON Subject_Code = Inchr_Subject_Code WHERE Inchr_Lecturer_ID = '%s'" % lecID)
            inchrSub = cursor.fetchall()
            cursor.close()
            return inchrSub

    # View subject list that lecturer manage
    def viewMgrSubject(self, lecID):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT Subject_Code, Name FROM SUBJECT WHERE Mgr_Lecturer_ID = '%s'" % lecID)
            mgrSub = cursor.fetchall()
            cursor.close()
            return mgrSub

    """ change for exam BEGIN """
    def getExamList(self, subCode):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT * FROM (EXAM_TIME NATURAL JOIN EXAM) LEFT JOIN \
                (SELECT Lecturer_ID, Last_Name, First_Name FROM LECTURER) l ON Lecturer_ID = BC_Lecturer_ID \
                    WHERE Subject_Code = '%s' ORDER BY Exam_Date DESC" % subCode)
            examList = cursor.fetchall()
            cursor.close()
            return examList

    def getLecturerRole(self, lecID, subCode):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT * FROM LEC_INCHARGE_SUB WHERE Inchr_Lecturer_ID = %s AND Inchr_Subject_Code = %s", (lecID, subCode))
            data = cursor.fetchone()
            cursor.close()
            return data[2]
    """ change for exam END """


if __name__ == "__main__":
    newUtils = lecturerUtils()




