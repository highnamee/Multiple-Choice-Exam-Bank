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
    In_Sub_Code: str
    In_Exam_Code: str
    Mark: float

    def __str__(self):
        pass