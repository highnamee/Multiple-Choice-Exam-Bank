from dataclasses import dataclass
from re import template
from typing import List, Tuple

@dataclass
class Student:
    """Class to store Student's information"""
    Student_ID: str
    Last_name: str
    First_name: str
    Faculty: str
    Address: str
    Email: str
    Phone: str

    def __str__(self):
        pass

@dataclass
class ExamViewItem:
    Subject_Code: str
    Subject_Name: str
    Exam_Date: str
    Exam_Code: str
    Lecturer_Note: str
    CDescription: str
    DFile_Path: str
    Question_No: str
    QContent: str
    QFile_Path: str
    Evl_Outcome_No: str
    Choice_ID: str
    Choice_Content: str
    CFile_Path: str

@dataclass
class ExamView:
    QuestionList: List[ExamViewItem]

    def __str__(self):
        pass

@dataclass
class ExamSolutionViewItem:
    Subject_Code: str
    Subject_Name: str
    Exam_Date: str
    Exam_Code: str
    Lecturer_Note: str
    CDescription: str
    DFile_Path: str
    Question_No: str
    QContent: str
    QFile_Path: str
    Evl_Outcome_No: str
    Choice_ID: str
    Choice_Content: str
    CFile_Path: str
    Mix_Correct_Choice_IDs: str

@dataclass
class ExamSolutionView:
    QuestionList: List[ExamSolutionViewItem]

    def __str__(self):
        pass

@dataclass
class StudentAnswerItem:
    Subject_Code: str
    Subject_Name: str
    Exam_Date: str
    Exam_Code: str
    Lecturer_Note: str
    CDescription: str
    DFile_Path: str
    Question_No: str
    QContent: str
    QFile_Path: str
    Evl_Outcome_No: str
    Choice_ID: str
    Choice_Content: str
    CFile_Path: str
    Mix_Correct_Choice_IDs: str
    Student_ID: str
    Answer_Choice_IDs: str
    Check_Sol: str

@dataclass
class StudentAnswerView:
    AnswerList: List[StudentAnswerItem]

    def __str__(self):
        pass

@dataclass
class MarkInExam:
    Stud_Id: str
    In_Sub_Code: str
    In_Exam_Date: str
    In_Exam_Code: str
    Mark: float

    def __str__(self):
        pass









#Khai

@dataclass
class ManagementLecturer:
    Lecturer_ID: str
    Last_name: str
    First_name: str
    Faculty: str
    Address: str
    Email: str
    Phone: str
    Degree

@dataclass
class LecturerInCharge:
    Lecturer_ID: str
    Inchr_Subject_Code: str
    Last_name: str
    First_name: str
    Faculty: str
    Address: str
    Email: str
    Phone: str
    Degree: str
    Role: str

    def __str__(self):
        pass


@dataclass
class Question:
    Question_ID: str
    Sub_Code: str
    Exam_Date: str
    Level: str
    Question_No: int
    Correct_Choice_ID: str
    #? Mixoption: str
    Number_Of_Choices: int
    Described_Content_ID: str
    Ctrb_Lecturer_ID: str
    
    Content: str
    def __str__(self):
        pass


@dataclass
class Choice:
    Subject_Code: str
    Exam_Date: str
    Question_ID: str
    Question_No: str
    Mix_Correct_Choice_IDs: str

    def __str__(self):
        pass

@dataclass
class Answer:
    Student_ID: str
    Subject_Code: str
    Exam_Date: str
    Exam_Code: str
    Answer_Number: str
    Student_Note: str

@dataclass
class AnswerContent:
    Student_ID: str
    Subject_Code: Str
    Exam_Date: str
    Exam_Code: str 
    Answer_Number: str
    Answer_No: str
    Answer_Choice_IDs: str

@dataclass
class ExamTime:
    SubjectCode: str
    ExamDate: str
    Semester: int
    SchoolYear: int
    Number_Of_Exams: int


    def __str__(self):
        pass

@dataclass
class Exam:
    #
    Subject_Code: str
    Exam_Date: str;
    ExamCode: str
    Lecturer_Note: str
    Number_O_fQuestions: str
    BC_Lecturer_ID: str
    Total_Positions: str
    Number_Of_Different_Positions: str
    QuestionsList: List[QuestionsItem]


@dataclass
class Mark:
    pass