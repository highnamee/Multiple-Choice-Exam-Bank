import mysql.connector
from mysql.connector import Error
from Models import *


class lecturerInChargeUtils:
    def __init__(self):
        try:
            self.connection = mysql.connector.connect(
                host='localhost', database='MCQS_EXAMS_BANK', user='root', password='very_strong_password', auth_plugin='mysql_native_password')
        except Error as e:
            print("Error while connection to Mysql", e)    
    # Data req. 13
    # Approve required exams of one subject at exam time

    def approveExam(self,Sub_Code, Exam_Date, Exam_Code, Apr_Lecturer_ID, Date_Of_Approval)
        if self.connection.is_connected():
        cursor = self.connection.cursor()
        cursor.callproc('approve_required_exams_of_one_subject_at_exam_time', [Sub_Code,\
            Exam_Date, Exam_Code, Apr_Lecturer_ID, Date_Of_Approval])

        cursor.close()\


    # Data req. 14
    # View all subjects that have minimum GPA at semester of school year

    def viewMinGpaSubject(self, From_Date, To_Date)
        if self.connection.is_connected():
        cursor = self.connection.cursor()
        cursor.callproc('view_all_subjects_that_have_minimum_GPA_at_semester_of_school_year',\
            [From_Date, To_Date])
        lstMinGPA = [Mark(*item) for result in cursor.stored_results() for item in result]
        cursor.close()
        return lstStdAns

    # Data req. 15
    # View all subjects that have minimum GPA at 3 latest exam time of each subject

    def viewMinGpaSubject3LastestExamTime(self)
        if self.connection.is_connected():
        cursor = self.connection.cursor()
        cursor.callproc('view_all_subjects_that_have_minimum_GPA_at_3_latest_exam_time_of_each_subject',\
            [])
        lstMinGPA = [Mark(*item) for result in cursor.stored_results() for item in result]
        cursor.close()
        return lstStdAns

    # Data req. 16
    # View all subjects that have maximum number of outcomes that have minimum ratio of
    # number of students doing right/total students at exam time

    def viewSubMaxNumOcMinRatioStudDoingRight(self,From_Date, To_Date)
        if self.connection.is_connected():
        cursor = self.connection.cursor()
        cursor.callproc('view_all_subjects_that_have_minimum_GPA_at_3_latest_exam_time_of_each_subject',\
            [From_Date, To_Date])
        lstMaxSub = [Subject(*item) for result in cursor.stored_results() for item in result]
        cursor.close()
        return lstStdAns

    def __del__(self):
        self.connection.close()