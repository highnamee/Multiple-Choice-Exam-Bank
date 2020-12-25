DROP SCHEMA IF EXISTS MCQS_EXAMS_BANK;
CREATE SCHEMA MCQS_EXAMS_BANK;

USE MCQS_EXAMS_BANK;

CREATE TABLE DESCRIBED_CONTENT (
	Described_Content_ID VARCHAR(9),
	PRIMARY KEY (Described_Content_ID)
);

CREATE TABLE COMMON_DESCRIPTION (
	Description_ID VARCHAR(9),
	CDescription VARCHAR(500)			NOT NULL,
	Described_Content_ID VARCHAR(9),
	PRIMARY KEY (Description_ID),
	FOREIGN KEY (Described_Content_ID) REFERENCES DESCRIBED_CONTENT (Described_Content_ID) ON DELETE SET NULL
);

CREATE TABLE QUESTION (
	Question_ID VARCHAR(9),
	Content VARCHAR(500) NOT NULL,
	Level ENUM('Dễ','Trung bình','Khó')	NOT NULL,
    Number_Of_Choices INT NOT NULL,
	Correct_Choice_ID VARCHAR(5) NOT NULL,
	Described_Content_ID VARCHAR(9),
	PRIMARY KEY (Question_ID),
	FOREIGN KEY (Described_Content_ID) REFERENCES DESCRIBED_CONTENT (Described_Content_ID) ON DELETE SET NULL
);

CREATE TABLE LECTURER (
	Lecturer_ID VARCHAR(9),
	Last_Name VARCHAR(30) NOT NULL,
    First_Name VARCHAR(15) NOT NULL,
	Faculty VARCHAR(30),
	Degree ENUM('Cử nhân','Thạc sĩ','Tiến sĩ'), 
	Address VARCHAR(30),
	Email VARCHAR(30),
	Phone VARCHAR(11),
	PRIMARY KEY (Lecturer_ID)
);

CREATE TABLE MANAGEMENT_LECTURER (
	Lecturer_ID VARCHAR(9),
	PRIMARY KEY (Lecturer_ID),
	FOREIGN KEY (Lecturer_ID) REFERENCES LECTURER (Lecturer_ID)
);

CREATE TABLE LECTURER_IN_CHARGE (
	Lecturer_ID VARCHAR(9),
	PRIMARY KEY (Lecturer_ID),
	FOREIGN KEY (Lecturer_ID) REFERENCES LECTURER (Lecturer_ID)
);

CREATE TABLE STUDENT (
	Student_ID VARCHAR(9),
	Last_Name VARCHAR(30) NOT NULL,
    First_Name VARCHAR(15) NOT NULL,
	Faculty VARCHAR(30),
	Address VARCHAR(30),
	Email VARCHAR(30),
	Phone VARCHAR(11),
	PRIMARY KEY (Student_ID)
);

CREATE TABLE SUBJECT (
	Subject_Code CHAR(6),
	Name VARCHAR(30) NOT NULL,
	PRIMARY KEY (Subject_Code)
);

CREATE TABLE DESCRIPTION_FILE (
	File_Path VARCHAR(255),
	PRIMARY KEY (File_Path)
);

CREATE TABLE OUTCOME (
	Subject_Code CHAR(6),
	Outcome_No VARCHAR(9),
	Content VARCHAR(500) NOT NULL,
	PRIMARY KEY (Subject_Code, Outcome_No),
	FOREIGN KEY (Subject_Code) REFERENCES SUBJECT (Subject_Code)
);

CREATE TABLE EXAM_TIME (
	Subject_Code CHAR(6),
	Exam_Date DATE,
	PRIMARY KEY (Subject_Code, Exam_Date),
	FOREIGN KEY (Subject_Code) REFERENCES SUBJECT (Subject_Code)
);

CREATE TABLE EXAM (
	Subject_Code CHAR(6),
	Exam_Date DATE,
	Exam_Code CHAR(4),
	Lecturer_Note TEXT,
	PRIMARY KEY (Subject_Code, Exam_Date, Exam_Code),
	FOREIGN KEY (Subject_Code, Exam_Date) REFERENCES EXAM_TIME (Subject_Code, Exam_Date)
);

/* CREATE TABLE EXPRESSION_OF_QUESTION (
	Subject_Code CHAR(6),
	Exam_Date DATE,
	Question_ID VARCHAR(9),
    Expression_ID VARCHAR(9),
	Question_No INT CHECK (Question_No > 0),
	Mix_Correct_Choice_IDs VARCHAR(5) NOT NULL,
    ESubject_Code CHAR(6) NOT NULL,
    EExam_Date DATE NOT NULL,
    Exam_Code CHAR(4) NOT NULL,
	PRIMARY KEY (Subject_Code, Exam_Date, Question_ID, Expression_ID),
	FOREIGN KEY (Subject_Code, Exam_Date) REFERENCES EXAM_TIME (Subject_Code, Exam_Date),
	FOREIGN KEY (Question_ID) REFERENCES QUESTION (Question_ID),
    FOREIGN KEY (ESubject_Code, EExam_Date, Exam_Code) REFERENCES EXAM (Subject_Code, Exam_Date, Exam_Code)
); */

CREATE TABLE CHOICE (
	Question_ID VARCHAR(9),
	Choice_ID CHAR(1),
	Choice_Content VARCHAR(500),
	Described_Content_ID VARCHAR(9),
	PRIMARY KEY (Question_ID, Choice_ID, Choice_Content),
	FOREIGN KEY (Question_ID) REFERENCES QUESTION (Question_ID) ON DELETE CASCADE,
	FOREIGN KEY (Described_Content_ID) REFERENCES DESCRIBED_CONTENT (Described_Content_ID)
);

CREATE TABLE ANSWER (
	Student_ID VARCHAR(9),
	Subject_Code CHAR(6),
	Exam_Date DATE,
	Exam_Code CHAR(4),
	Answer_Number INT CHECK (Answer_Number > 0),
	Student_Note TEXT,
    Mark DECIMAL(5,2) CHECK (Mark >= 0 AND Mark <= 10),
	PRIMARY KEY (Student_ID, Subject_Code, Exam_Date, Exam_Code, Answer_Number),
	FOREIGN KEY (Student_ID) REFERENCES STUDENT (Student_ID),
	FOREIGN KEY (Subject_Code, Exam_Date, Exam_Code) REFERENCES EXAM (Subject_Code, Exam_Date, Exam_Code)
);

CREATE TABLE ANSWER_CONTENT (
	Student_ID VARCHAR(9),
	Subject_Code CHAR(6),
	Exam_Date DATE,
	Exam_Code CHAR(4),
	Answer_Number INT,
	Answer_No INT CHECK (Answer_No > 0),
	Answer_Choice_IDs VARCHAR(5),
    Check_Sol ENUM('Chính xác', 'Không chính xác', 'Không hoàn thành'),
	PRIMARY KEY (Student_ID, Subject_Code, Exam_Date, Exam_Code, Answer_Number, Answer_No),
	FOREIGN KEY (Student_ID, Subject_Code, Exam_Date, Exam_Code, Answer_Number) REFERENCES ANSWER (Student_ID, Subject_Code, Exam_Date, Exam_Code, Answer_Number)
);

--

ALTER TABLE SUBJECT
ADD COLUMN Mgr_Lecturer_ID VARCHAR(9) NOT NULL;

ALTER TABLE SUBJECT
ADD FOREIGN KEY (Mgr_Lecturer_ID) REFERENCES MANAGEMENT_LECTURER (Lecturer_ID);

ALTER TABLE QUESTION 
ADD COLUMN Ctrb_Lecturer_ID VARCHAR(9) NOT NULL;

ALTER TABLE QUESTION
ADD COLUMN Time_Contribute DATETIME NOT NULL;

ALTER TABLE QUESTION 
ADD FOREIGN KEY (Ctrb_Lecturer_ID) REFERENCES LECTURER_IN_CHARGE (Lecturer_ID);

ALTER TABLE EXAM
ADD COLUMN BC_Lecturer_ID VARCHAR(9);

ALTER TABLE EXAM
ADD COLUMN Date_Of_Confirmation DATE;

ALTER TABLE EXAM 
ADD FOREIGN KEY (BC_Lecturer_ID) REFERENCES LECTURER_IN_CHARGE (Lecturer_ID);

ALTER TABLE EXAM
ADD COLUMN Apr_Lecturer_ID VARCHAR(9);

ALTER TABLE EXAM 
ADD COLUMN Date_Of_Approval DATE;

ALTER TABLE EXAM
ADD FOREIGN KEY (Apr_Lecturer_ID) REFERENCES MANAGEMENT_LECTURER (Lecturer_ID);

ALTER TABLE QUESTION
ADD COLUMN Evl_Outcome_No VARCHAR(9) NOT NULL;

ALTER TABLE QUESTION
ADD COLUMN Evl_Subject_Code CHAR(6) NOT NULL;

ALTER TABLE QUESTION
ADD FOREIGN KEY (Evl_Subject_Code, Evl_Outcome_No) REFERENCES OUTCOME (Subject_Code, Outcome_No);

ALTER TABLE OUTCOME
ADD COLUMN Super_Subject_Code CHAR(6);

ALTER TABLE OUTCOME
ADD COLUMN Super_Outcome_No VARCHAR(9);

ALTER TABLE OUTCOME
ADD FOREIGN KEY (Super_Subject_Code, Super_Outcome_No) REFERENCES OUTCOME (Subject_Code, Outcome_No);

CREATE TABLE IN_EXAM (
	Question_ID VARCHAR(9),
    Subject_Code CHAR(6),
    Exam_Date DATE,
    Exam_Code CHAR(4),
    Question_No INT NOT NULL CHECK (Question_No > 0),
    Mix_Option INT,
    Mix_Correct_Choice_IDs VARCHAR(5) NOT NULL,
    PRIMARY KEY (Question_ID, Subject_Code, Exam_Date, Exam_Code),
    FOREIGN KEY (Question_ID) REFERENCES QUESTION (Question_ID),
    FOREIGN KEY (Subject_Code, Exam_Date, Exam_Code) REFERENCES EXAM (Subject_Code, Exam_Date, Exam_Code)
);

CREATE TABLE CHOICE_MAPPING (
	Question_ID VARCHAR(9),
    Subject_Code CHAR(6),
    Exam_Date DATE,
    Exam_Code CHAR(4),
	Choice_ID CHAR(1),
	Mapping_Choice_ID CHAR(1),
	PRIMARY KEY (Question_ID, Subject_Code, Exam_Date, Exam_Code, Choice_ID, Mapping_Choice_ID),
	FOREIGN KEY (Question_ID, Subject_Code, Exam_Date, Exam_Code) REFERENCES IN_EXAM (Question_ID, Subject_Code, Exam_Date, Exam_Code)
);


CREATE TABLE USE_DES (
    Description_ID VARCHAR(9),
    Question_ID VARCHAR(9),
    PRIMARY KEY (Description_ID, Question_ID),
    FOREIGN KEY (Description_ID) REFERENCES COMMON_DESCRIPTION (Description_ID),
    FOREIGN KEY (Question_ID) REFERENCES QUESTION (Question_ID)
);

CREATE TABLE HAS_FILE (
    File_Path VARCHAR(255),
    Described_Content_ID VARCHAR(9),
    PRIMARY KEY (File_Path, Described_Content_ID),
    FOREIGN KEY (File_Path) REFERENCES DESCRIPTION_FILE (File_Path),
    FOREIGN KEY (Described_Content_ID) REFERENCES DESCRIBED_CONTENT (Described_Content_ID)
);

/* CREATE TABLE MIX_CHOICE_ORDER (
    Subject_Code CHAR(6),
    Exam_Date DATE,
    Question_ID VARCHAR(9),
    Expression_ID VARCHAR(9),
    A_Mix_Choice_ID CHAR(1),
    A_Mix_Choice_Content VARCHAR(500),
    PRIMARY KEY (Subject_Code, Exam_Date, Question_ID, Expression_ID, A_Mix_Choice_ID, A_Mix_Choice_Content),
    FOREIGN KEY (Subject_Code, Exam_Date, Question_ID, Expression_ID) REFERENCES EXPRESSION_OF_QUESTION (Subject_Code, Exam_Date, Question_ID, Expression_ID)
); */

ALTER TABLE EXAM
ADD CONSTRAINT CHECK (Date_Of_Confirmation <= Date_Of_Approval AND Date_Of_Approval <= Exam_Date - 3);

CREATE TABLE LEC_INCHARGE_SUB (
	Inchr_Lecturer_ID VARCHAR(9),
    Inchr_Subject_Code CHAR(6),
    Role ENUM('Chính','Phụ') NOT NULL,
    PRIMARY KEY (Inchr_Lecturer_ID, Inchr_Subject_Code),
    FOREIGN KEY (Inchr_Lecturer_ID) REFERENCES LECTURER_IN_CHARGE (Lecturer_ID),
    FOREIGN KEY (Inchr_Subject_Code) REFERENCES SUBJECT (Subject_Code)
);

CREATE TABLE LEARN_SUB (
	Student_ID VARCHAR(9),
    Learn_Subject_Code CHAR(6),
    PRIMARY KEY (Student_ID, Learn_Subject_Code),
    FOREIGN KEY (Student_ID) REFERENCES STUDENT (Student_ID),
    FOREIGN KEY (Learn_Subject_Code) REFERENCES SUBJECT (Subject_Code)
);