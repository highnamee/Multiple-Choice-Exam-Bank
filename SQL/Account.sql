USE MCQS_EXAMS_BANK;

DROP TABLE IF EXISTS lecturerAccount;
CREATE TABLE lecturerAccount(
    userName VARCHAR(32) primary key,
    password VARCHAR(32),
    Lecturer_ID VARCHAR(9),
    foreign key (Lecturer_ID) references LECTURER(Lecturer_ID)
);

DROP TABLE IF EXISTS studentAccount;
CREATE TABLE studentAccount(
    userName VARCHAR(32) primary key,
    password VARCHAR(32),
    Student_ID VARCHAR(9),
    foreign key (Student_ID) references STUDENT(Student_ID)
);

/*
 * Add some data to check
 * We should using hash later
 */
-- Password is abc, when hash MD5 it's is 900150983cd24fb0d6963f7d28e17f72
-- Lecturer account
INSERT IGNORE INTO lecturerAccount
VALUES ('lecturer1', '900150983cd24fb0d6963f7d28e17f72', 'GV123456'),
	   ('lecturer2', '900150983cd24fb0d6963f7d28e17f72', 'GV987654'),
	   ('lecturer3', '900150983cd24fb0d6963f7d28e17f72', 'GV111111'),
	   ('lecturer4', '900150983cd24fb0d6963f7d28e17f72', 'GV222222'),
	   ('lecturer5', '900150983cd24fb0d6963f7d28e17f72', 'GV333333');
-- ('lecturer6', '900150983cd24fb0d6963f7d28e17f72', 'GV444444');

-- Student Account
INSERT IGNORE INTO STUDENT 
VALUES ('SV181034', 'Võ Hoàng Hải', 'Nam', 'CSE', NULL, NULL, NULL);

INSERT IGNORE INTO studentAccount
VALUES ('student1', '900150983cd24fb0d6963f7d28e17f72', 'SV181034'),
	   ('student2', '900150983cd24fb0d6963f7d28e17f72', 'SV181012');
       
select * from studentAccount;
select * from lecturerAccount;
SELECT * FROM LECTURER WHERE Lecturer_ID = 'GV444444';