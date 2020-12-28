import mysql.connector, sys
from mysql.connector import Error
from mysql.connector.fabric.connection import FabricSet

sys.path.append('./Models/')
from Models import *

"""
Install: pip install mysql-connector-python

Run this SQL command fist:
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'very_strong_password'; 
FLUSH PRIVILEGES;

This is example, let's create a function as API
"""

class studentUtils:
    def __init__(self):
        try:
            self.connection = mysql.connector.connect(
                host='localhost', database='MCQS_EXAMS_BANK', user='root', password='very_strong_password', auth_plugin='mysql_native_password', autocommit=True)
        except Error as e:
            print("Error while connection to Mysql", e)

    # Data req. 17
    # Add student task
    def addStudentTask(self, studentID, SubjectCode, ExamDate, ExamCode, AnsNum):
        AnsNum = 1
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('add_student_task', [studentID, SubjectCode, ExamDate, ExamCode, AnsNum])
            cursor.close()
    # Add one answer
    def addOneAnswer(self, studentID, SubjectCode, ExamDate, ExamCode, AnsNum, AnsNo, AnsChoose):
        AnsNum = 1
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('add_one_answer', [studentID, SubjectCode, ExamDate, ExamCode, AnsNum, AnsNo, AnsChoose])
            cursor.close()

    # Data req. 18
    # Return ExamView object
    def viewPerformedExam(self, subCode, examDate, examCode):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('view_performed_exam', [subCode, examDate, examCode])
            examItem = [Models.ExamViewItem(*item) for result in cursor.stored_results() for item in result]
            exam = Models.ExamView(examItem)
            cursor.close()
            return exam

    # Data req. 19
    # Return ExamSolutionView object
    def viewExamWithSolutution(self, subCode, examDate, examCode):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('view_exam_with_solution', [subCode, examDate, examCode])
            examItem = [ExamSolutionViewItem(*item) for result in cursor.stored_results() for item in result]
            exam = ExamSolutionView(examItem)
            cursor.close()
            return exam

    # Data req. 20
    # Return StudentAnswer object
    def viewStudentAnswer(self, studentID, subCode, examDate, examCode):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('view_student_answer', [studentID, subCode, examDate, examCode])
            examItem = [Models.StudentAnswerItem(*item) for result in cursor.stored_results() for item in result]
            exam = Models.StudentAnswerView(examItem)
            cursor.close()
            return exam

    # Data req. 21
    # Return MarkInExam object
    def viewMarkInExam(self, studentID, subCode, examDate, examCode):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('view_mark_in_exam', [subCode, examDate, examCode, studentID])
            markList = [Models.MarkInExam(None, None,*item) for result in cursor.stored_results() for item in result]
            mark = markList[0].Mark
            cursor.close()
            return mark

    # Data req. 22
    # Return list MarkInExam object
    def viewMarkInAllExam(self, studentID, examDate):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('view_mark_in_all_exams', [examDate, studentID])
            markList = [MarkInExam(*item) for result in cursor.stored_results() for item in result]
            cursor.close()
            return markList

    # Data req. 24
    # Print "Note on exam successfully" if note successfully
    def noteOnExam(self, studentID, subCode, examDate, examCode, answerNumber, studentNote):
        answerNumber = 1
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('note_on_exam', [studentID, subCode, examDate, examCode, answerNumber, studentNote])
            cursor.close()
            return True
        return False

    # Get data for Incoming/Passed Exam table
    def getExamOfStudent(self, studentID):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT Subject_Code, Content, Exam_Date FROM LEARN_SUB a JOIN EXAM_TIME b ON a.Semester = b.Semester AND a.Learn_Subject_Code = Subject_Code AND Student_ID = %s;", (studentID,))
            data = cursor.fetchall()
            cursor.close()
            return data

    # Check student taken this exam or not ?
    def checkTakenExam(self, studentID, SubjectCode, ExamDate, ExamCode, AnsNum = 1):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT * FROM ANSWER WHERE Student_ID = %s AND Subject_Code = %s AND Exam_Date = %s AND Exam_Code = %s;", (studentID, SubjectCode, ExamDate, ExamCode))
            data = cursor.fetchone()
            cursor.close()
            return False if data is None else True

    # Get note on student exam
    def getStudentNote(self, studentID, SubjectCode, ExamDate, ExamCode, AnsNum = 1):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT Student_Note FROM ANSWER WHERE Student_ID = %s AND Subject_Code = %s AND Exam_Date = %s AND Exam_Code = %s;", (studentID, SubjectCode, ExamDate, ExamCode))
            data = cursor.fetchall()
            cursor.close()
            return data[0][0] if data[0][0] else "Không có"

    def __del__(self):
        self.connection.close()

if __name__ == "__main__":
    newUtils = studentUtils()
    # ques = newUtils.viewPerformedExam('CO2017', '2020-03-15', '2001')
    # print(ques)
    # print(ques.getDisplayInfo())
    # print(newUtils.viewExamWithSolutution('CO2017', '2020-03-15', '2001'))
    # ans = newUtils.viewStudentAnswer('SV1810812','CO2017', '2020-03-15', '2001')
    # for item in ans.getDisplayInfo():
    #     print(item)
    # print(newUtils.viewMarkInExam('SV1810812', 'CO2017', '2020-03-15', '2001'))
    # print(newUtils.viewMarkInAllExam('SV1810812', '2020-03-15'))
    # newUtils.noteOnExam('SV1810812', 'CO2017', '2020-03-15', '2001', 1, 'This is very very hard exam.')
    print(newUtils.getExamOfStudent('SV1810812'))
    print(newUtils.checkTakenExam('SV1810812','CO2003', '2021-04-15', '2001'))
    print(newUtils.getStudentNote('SV1810812','CO2003', '2021-03-15', '2001'))




