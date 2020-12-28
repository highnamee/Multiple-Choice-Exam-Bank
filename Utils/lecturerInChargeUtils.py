import mysql.connector
from mysql.connector import Error
from Models import *


class lecturerInChargeUtils:
    def __init__(self):
        try:
            self.connection = mysql.connector.connect(
                host='localhost', database='MCQS_EXAMS_BANK', user='root', password='very_strong_password', auth_plugin='mysql_native_password', autocommit=True)
        except Error as e:
            print("Error while connection to Mysql", e)

    ## LA begin
    # Data req. 1
    # Update (insert/update/delete) questions for 1 subject

    def addQuestion4Choices(self, Content, Level, CorrectChoiceID , \
	    QDesContID, CtrbLecID , TimeCtrb, EvlOutcomeNo, EvlSubCode, \
        ChoiceID1, ChoiceCont1, CDesContID1, ChoiceID2, ChoiceCont2, CDesContID2, \
        ChoiceID3, ChoiceCont3, CDesContID3, ChoiceID4, ChoiceCont4, CDesContID4):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT MAX(Question_ID) FROM QUESTION WHERE SUBSTRING(Question_ID,4) = '%s'" % EvlSubCode)
            max_quesID = cursor.fetchone()
            QuesID = str(int(max_quesID[0][:3])+1) if max_quesID else "001"
            QuesID = QuesID.zfill(3) + EvlSubCode
            cursor.callproc('add_question_4_choices', [QuesID, Content, Level, CorrectChoiceID , \
                QDesContID, CtrbLecID , TimeCtrb, EvlOutcomeNo, EvlSubCode, \
                ChoiceID1, ChoiceCont1, CDesContID1, ChoiceID2, ChoiceCont2, CDesContID2, \
                ChoiceID3, ChoiceCont3, CDesContID3, ChoiceID4, ChoiceCont4, CDesContID4])
            cursor.close()

    def addQuestion5Choices(self, QuesID, Content, Level, CorrectChoiceID , \
	    QDesContID, CtrbLecID , TimeCtrb, EvlOutcomeNo, EvlSubCode, \
        ChoiceID1, ChoiceCont1, CDesContID1, ChoiceID2, ChoiceCont2, CDesContID2, \
        ChoiceID3, ChoiceCont3, CDesContID3, ChoiceID4, ChoiceCont4, CDesContID4, \
        ChoiceID5, ChoiceCont5, CDesContID5):
        cursor = self.connection.cursor()
        cursor.callproc('update_question_for_1_subject', [QuesID, Content, Level, CorrectChoiceID , \
	        QDesContID, CtrbLecID , TimeCtrb, EvlOutcomeNo, EvlSubCode, \
            ChoiceID1, ChoiceCont1, CDesContID1, ChoiceID2, ChoiceCont2, CDesContID2, \
            ChoiceID3, ChoiceCont3, CDesContID3, ChoiceID4, ChoiceCont4, CDesContID4,\
            ChoiceID5, ChoiceCont5, CDesContID5])
        QuestionsList.insert(QuesID, Questions) #can may create a object with full operator
        cursor.close()

    # Delete Question
    def deleteQuestion(self, quesID):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('delete_question', [quesID])
            cursor.close()

    def updateQuestion4Choices(self, QuesID, Content, Level, CorrectChoiceID , \
	    QDesContID, CtrbLecID , TimeCtrb, EvlOutcomeNo, EvlSubCode, \
        ChoiceID1, ChoiceCont1, CDesContID1, ChoiceID2, ChoiceCont2, CDesContID2, \
        ChoiceID3, ChoiceCont3, CDesContID3, ChoiceID4, ChoiceCont4, CDesContID4):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            
            cursor.callproc('update_question_4_choices', [QuesID, Content, Level, CorrectChoiceID , \
                QDesContID, CtrbLecID , TimeCtrb, EvlOutcomeNo, EvlSubCode, \
                ChoiceID1, ChoiceCont1, CDesContID1, ChoiceID2, ChoiceCont2, CDesContID2, \
                ChoiceID3, ChoiceCont3, CDesContID3, ChoiceID4, ChoiceCont4, CDesContID4])
            cursor.close()

    ## LA end

    # Data req. 2
    # Create exam

    def createExam(self,Sub_Code, Exam_Date, Exam_Code, Lecturer_Note, BC_Lecturer_ID):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('create_exam', [Sub_Code, Exam_Date, Exam_Code, Lecturer_Note, BC_Lecturer_ID])
            newExam = Exam(Sub_Code, Exam_Date, Exam_Code, Lecturer_Note, BC_Lecturer_ID,NULL,NULL,NULL)
            cursor.close()

    # add question to exam
    
    def addQuestionToExam(self,Question_ID, Sub_Code, Exam_Date, Exam_Code, Level, Question_No,\
        Mix_Option, Mix_Correct_Choice_IDs, Number_Of_Choices):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('add_question_to_exam', [Question_ID, Sub_Code, Exam_Date, Exam_Code, Level, Question_No,\
                Mix_Option, Mix_Correct_Choice_IDs, Number_Of_Choices])
            newQuestions = Question(Question_ID, Sub_Code, Exam_Date, Exam_Code, Level, Question_No, Mix_Option,\
                Mix_Correct_Choice_IDs, Number_Of_Choices)
            addQuestion4Choices(newQuestions) if Number_Of_Choices==4 else addQuestion5Choices(newQuestions)
            cursor.close()

    # confirm exam

    def confirmExam(self, Sub_Code,Exam_Date, Exam_Code, Date_Of_Confirmation):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('confirm_exam', [Sub_Code,Exam_Date, Exam_Code, Date_Of_ConfirmationQuesID])
            #
            cursor.close()

    # Data req. 4
    # View list of students that perform at exam time of subject

    def viewAmountOfStudQuestion(self,In_Sub_Code, In_Exam_Date):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('View_list_of_students_that_perform_at_exam_time_of_subject', [In_Sub_Code, In_Exam_Date])
            lstStd = [Student(*item) for result in cursor.stored_results() for item in result]
            print(cursor)
            cursor.close()
            return lstStd

    # Data req. 5
    # View result of student's answer that performs at exam time of subject

    def viewAnsContentOfStudent(self, In_Sub_Code, n_Exam_Date, In_Exam_Code, Stud_Id):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.callproc('view_result_of_student_answer_that_performs_at_exam_time_of_subject',\
                [In_Sub_Code, n_Exam_Date, In_Exam_Code, Stud_Id])
            lstStdAns = [Answer(*item) for result in cursor.stored_results() for item in result]
            cursor.close()
            return lstStdAns

    ## LA begin
    # View question of subject that lecturer in charge
    def viewQuestionList(self, subCode):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT * FROM QUESTION LEFT JOIN \
                (SELECT Lecturer_ID, Inchr_Subject_Code, Last_Name, First_Name \
                FROM LEC_INCHARGE_SUB JOIN LECTURER ON Lecturer_ID = Inchr_Lecturer_ID) l \
                ON Ctrb_Lecturer_ID = Lecturer_ID WHERE Inchr_Subject_Code = '%s' ORDER BY Question_ID" % subCode)
            quesList = cursor.fetchall()
            cursor.close()
            return quesList

    # Get outcomes of subject
    def getOutcomeList(self, subCode):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT Outcome_No FROM OUTCOME WHERE Subject_Code = '%s'" % subCode)
            outcomeList = cursor.fetchall()
            cursor.close()
            return outcomeList

    def checkAuthor(self, quesID, lecID):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT * FROM QUESTION WHERE Question_ID = %s AND Ctrb_Lecturer_ID = %s", (quesID, lecID))
            data = cursor.fetchall()
            cursor.close()
            return True if data else False

    def getQuestionInfo(self, quesID):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT * FROM QUESTION WHERE Question_ID = '%s'" % quesID)
            quesInfo = cursor.fetchall()
            cursor.execute("SELECT Last_Name, First_Name FROM LECTURER WHERE Lecturer_ID = '%s'" % quesInfo[0][6])
            lecInfo = cursor.fetchone()
            cursor.execute("SELECT File_Path FROM HAS_FILE WHERE Described_Content_ID = '%s'" % quesInfo[0][5])

            quesInfo[0] = list(quesInfo[0])
            data = cursor.fetchone()
            quesInfo[0].append(None)
            if quesInfo[0][5]:
                quesInfo[0][10] = quesInfo[0][5]
                quesInfo[0][5] = data[0]
            correctChIDs = ""
            for id in quesInfo[0][4]:
                correctChIDs += id + ","
            quesInfo[0][4] = correctChIDs[:-1]
            quesInfo[0] = tuple(quesInfo[0])
            cursor.close()
            return quesInfo[0], lecInfo

    def getChoiceList(self, quesID):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT * FROM CHOICE WHERE Question_ID = '%s'" % quesID)
            choiceList = cursor.fetchall()
            for i in range(len(choiceList)):
                choiceList[i] = list(choiceList[i])
                cursor.execute("SELECT File_Path FROM HAS_FILE WHERE Described_Content_ID = '%s'" % choiceList[i][3])
                data = cursor.fetchone()
                choiceList[i].append(None)
                if choiceList[i][3]:
                    choiceList[i][4] = choiceList[i][3]
                    choiceList[i][3] = data[0]
                choiceList[i] = tuple(choiceList[i])
            cursor.close()
            return choiceList

    def setDesID(self, fileName):
        if self.connection.is_connected():
            cursor = self.connection.cursor()
            cursor.execute("SELECT MAX(CAST(SUBSTRING(Described_Content_ID,2) AS UNSIGNED)) FROM DESCRIBED_CONTENT")
            max_desID = cursor.fetchone()
            new_desID = "D" + str(max_desID[0]+1) if max_desID else "D1"
            cursor.execute("INSERT INTO DESCRIBED_CONTENT VALUES ('%s')" % new_desID)
            cursor.execute("INSERT IGNORE INTO DESCRIPTION_FILE VALUES ('%s')" % fileName)
            cursor.execute("INSERT INTO HAS_FILE VALUES (%s, %s)", (fileName, new_desID))
            
            cursor.close()
            return new_desID

    ## LA end

    def __del__(self):
        self.connection.close()