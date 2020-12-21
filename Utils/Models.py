from dataclasses import dataclass

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

    def printInfor(self):
        pass