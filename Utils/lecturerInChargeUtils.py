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


    # Data req. 1
    # Update (insert/update/delete) questions for 1 subject

    def addQuestion4Choices(self, QuesID, Content, Level, CorrectChoiceID , \
	    QDesContID, CtrbLecID , TimeCtrb, EvlOutcomeNo, EvlSubCode, \
        ChoiceID1, ChoiceCont1, CDesContID1, ChoiceID2, ChoiceCont2, CDesContID2, \
        ChoiceID3, ChoiceCont3, CDesContID3, ChoiceID4, ChoiceCont4, CDesContID4)
        cursor = self.connection.cursor()
        cursor.callproc('update_question_for_1_subject', [QuesID, Content, Level, CorrectChoiceID , \
	        QDesContID, CtrbLecID , TimeCtrb, EvlOutcomeNo, EvlSubCode, \
            ChoiceID1, ChoiceCont1, CDesContID1, ChoiceID2, ChoiceCont2, CDesContID2, \
            ChoiceID3, ChoiceCont3, CDesContID3, ChoiceID4, ChoiceCont4, CDesContID4])
        QuestionsList.append(Questions) #can may create a object with full operator
        cursor.close()

    def addQuestion5Choices(self, QuesID, Content, Level, CorrectChoiceID , \
	    QDesContID, CtrbLecID , TimeCtrb, EvlOutcomeNo, EvlSubCode, \
        ChoiceID1, ChoiceCont1, CDesContID1, ChoiceID2, ChoiceCont2, CDesContID2, \
        ChoiceID3, ChoiceCont3, CDesContID3, ChoiceID4, ChoiceCont4, CDesContID4, \
        ChoiceID5, ChoiceCont5, CDesContID5)
        cursor = self.connection.cursor()
        cursor.callproc('update_question_for_1_subject', [QuesID, Content, Level, CorrectChoiceID , \
	        QDesContID, CtrbLecID , TimeCtrb, EvlOutcomeNo, EvlSubCode, \
            ChoiceID1, ChoiceCont1, CDesContID1, ChoiceID2, ChoiceCont2, CDesContID2, \
            ChoiceID3, ChoiceCont3, CDesContID3, ChoiceID4, ChoiceCont4, CDesContID4,\
            ChoiceID5, ChoiceCont5, CDesContID5])
        QuestionsList.insert(QuesID, Questions) #can may create a object with full operator
        cursor.close()

    # Delete Question
    def deleteQuestion(self,QuesID)
        if self.connection.is_connected():
        cursor = self.connection.cursor()
        cursor.callproc('delete_questions', [QuesID])
        QuestionsList.pop(QuesID)
        cursor.close()

    # Data req. 2
    # Create exam

    def createExam(self,Sub_Code, Exam_Date, Exam_Code, Lecturer_Note, BC_Lecturer_ID)
        if self.connection.is_connected():
        cursor = self.connection.cursor()
        cursor.callproc('create_exam', [Sub_Code, Exam_Date, Exam_Code, Lecturer_Note, BC_Lecturer_ID])
        newExam = Exam(Sub_Code, Exam_Date, Exam_Code, Lecturer_Note, BC_Lecturer_ID,,,)
        cursor.close()

    # add question to exam
    
    def addQuestionToExam(self,Question_ID, Sub_Code, Exam_Date, Exam_Code, Level, Question_No,\
        Mix_Option, Mix_Correct_Choice_IDs, Number_Of_Choices)
        if self.connection.is_connected():
        cursor = self.connection.cursor()
        cursor.callproc('add_question_to_exam', [Question_ID, Sub_Code, Exam_Date, Exam_Code, Level, Question_No,\
            Mix_Option, Mix_Correct_Choice_IDs, Number_Of_Choices])
        newQuestions = Question(Question_ID, Sub_Code, Exam_Date, Exam_Code, Level, Question_No, Mix_Option,\
            Mix_Correct_Choice_IDs, Number_Of_Choices)
        addQuestion4Choices(newQuestions) if Number_Of_Choices==4 else addQuestion5Choices(newQuestions)
        cursor.close()

    # confirm exam

    def confirmExam(self, Sub_Code,Exam_Date, Exam_Code, Date_Of_Confirmation)
        if self.connection.is_connected():
        cursor = self.connection.cursor()
        cursor.callproc('confirm_exam', [Sub_Code,Exam_Date, Exam_Code, Date_Of_ConfirmationQuesID])
        #
        cursor.close()

    # Data req. 4
    # View list of students that perform at exam time of subject

    def viewAmountOfStudQuestion(self,In_Sub_Code, In_Exam_Date)
        if self.connection.is_connected():
        cursor = self.connection.cursor()
        cursor.callproc('View_list_of_students_that_perform_at_exam_time_of_subject', [In_Sub_Code, In_Exam_Date])
        lstStd = [Student(*item) for result in cursor.stored_results() for item in result]
        print cursor
        cursor.close()
        return lstStd

    # Data req. 5
    # View result of student's answer that performs at exam time of subject

    def viewAnsContentOfStudent(self, In_Sub_Code, n_Exam_Date, In_Exam_Code, Stud_Id)
        if self.connection.is_connected():
        cursor = self.connection.cursor()
        cursor.callproc('view_result_of_student_answer_that_performs_at_exam_time_of_subject',\
            [In_Sub_Code, n_Exam_Date, In_Exam_Code, Stud_Id])
        lstStdAns = [Answer(*item) for result in cursor.stored_results() for item in result]
        cursor.close()
        return lstStdAns

    def __del__(self):
        self.connection.close()