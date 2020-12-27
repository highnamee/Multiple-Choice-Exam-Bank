USE MCQS_EXAMS_BANK;

###########################################################
# 1. Update (insert/update/delete) questions for 1 subject
# User: LecturerInCharge
###########################################################

-- PROCEDURE: add_question_4_choices
-- TO DO: insert question and its 4 choices
DROP PROCEDURE IF EXISTS add_question_4_choices;
DELIMITER //
CREATE PROCEDURE add_question_4_choices (IN QuesID VARCHAR(9), Content VARCHAR(500), Level ENUM('Dễ','Trung bình','Khó'), CorrectChoiceID VARCHAR(5),
	QDesContID VARCHAR(9), CtrbLecID VARCHAR(9), TimeCtrb DATETIME, EvlOutcomeNo VARCHAR(9), EvlSubCode CHAR(6),
    ChoiceID1 CHAR(1), ChoiceCont1 VARCHAR(500), CDesContID1 VARCHAR(9), ChoiceID2 CHAR(1), ChoiceCont2 VARCHAR(500), CDesContID2 VARCHAR(9),
    ChoiceID3 CHAR(1), ChoiceCont3 VARCHAR(500), CDesContID3 VARCHAR(9), ChoiceID4 CHAR(1), ChoiceCont4 VARCHAR(500), CDesContID4 VARCHAR(9))
BEGIN
	INSERT INTO QUESTION
    VALUES (QuesID, Content, Level, 4, CorrectChoiceID, QDesContID, CtrbLecID, TimeCtrb, EvlOutcomeNo, EvlSubCode);
    
    INSERT INTO CHOICE
    VALUES (QuesID, ChoiceID1, ChoiceCont1, CDesContID1);
    INSERT INTO CHOICE
    VALUES (QuesID, ChoiceID2, ChoiceCont2, CDesContID2);
    INSERT INTO CHOICE
    VALUES (QuesID, ChoiceID3, ChoiceCont3, CDesContID3);
    INSERT INTO CHOICE
    VALUES (QuesID, ChoiceID4, ChoiceCont4, CDesContID4);
END //
DELIMITER ;

-- PROCEDURE: add_question_5_choices
-- TO DO: insert question and its 5 choices
DROP PROCEDURE IF EXISTS add_question_5_choices;
DELIMITER //
CREATE PROCEDURE add_question_5_choices (IN QuesID VARCHAR(9), Content VARCHAR(500), Level ENUM('Dễ','Trung bình','Khó'), CorrectChoiceID VARCHAR(5),
	QDesContID VARCHAR(9), CtrbLecID VARCHAR(9), TimeCtrb DATETIME, EvlOutcomeNo VARCHAR(9), EvlSubCode CHAR(6),
    ChoiceID1 CHAR(1), ChoiceCont1 VARCHAR(500), CDesContID1 VARCHAR(9), ChoiceID2 CHAR(1), ChoiceCont2 VARCHAR(500), CDesContID2 VARCHAR(9),
    ChoiceID3 CHAR(1), ChoiceCont3 VARCHAR(500), CDesContID3 VARCHAR(9), ChoiceID4 CHAR(1), ChoiceCont4 VARCHAR(500), CDesContID4 VARCHAR(9),
    ChoiceID5 CHAR(1), ChoiceCont5 VARCHAR(500), CDesContID5 VARCHAR(9))
BEGIN
	INSERT INTO QUESTION
    VALUES (QuesID, Content, Level, 5, CorrectChoiceID, QDesContID, CtrbLecID, TimeCtrb, EvlOutcomeNo, EvlSubCode);
    
    INSERT INTO CHOICE
    VALUES (QuesID, ChoiceID1, ChoiceCont1, CDesContID1);
    INSERT INTO CHOICE
    VALUES (QuesID, ChoiceID2, ChoiceCont2, CDesContID2);
    INSERT INTO CHOICE
    VALUES (QuesID, ChoiceID3, ChoiceCont3, CDesContID3);
    INSERT INTO CHOICE
    VALUES (QuesID, ChoiceID4, ChoiceCont4, CDesContID4);
    INSERT INTO CHOICE
    VALUES (QuesID, ChoiceID5, ChoiceCont5, CDesContID5);
END //
DELIMITER ;

-- PROCEDURE: update_question_4_choices
-- TO DO: update question by QuesID (unchanged) and its 4 choices by QuesID and ChoiceIDx (x in [1,2,3,4])
DROP PROCEDURE IF EXISTS update_question_4_choices;
DELIMITER //
CREATE PROCEDURE update_question_4_choices (IN QuesID VARCHAR(9), Content VARCHAR(500), Level ENUM('Dễ','Trung bình','Khó'), CorrectChoiceID VARCHAR(5),
	QDesContID VARCHAR(9), CtrbLecID VARCHAR(9), TimeCtrb DATETIME, EvlOutcomeNo VARCHAR(9), EvlSubCode CHAR(6),
    ChoiceID1 CHAR(1), ChoiceCont1 VARCHAR(500), CDesContID1 VARCHAR(9), ChoiceID2 CHAR(1), ChoiceCont2 VARCHAR(500), CDesContID2 VARCHAR(9),
    ChoiceID3 CHAR(1), ChoiceCont3 VARCHAR(500), CDesContID3 VARCHAR(9), ChoiceID4 CHAR(1), ChoiceCont4 VARCHAR(500), CDesContID4 VARCHAR(9))
BEGIN
	UPDATE QUESTION
    SET Content = Content, Level = Level, Correct_Choice_ID = CorrectChoiceID, Described_Content_ID = QDesContID, Ctrb_Lecturer_ID = CtrbLecID, 
		Time_Contribute = TimeCtrb, Evl_Outcome_No = EvlOutcomeNo, Evl_Subject_Code = EvlSubCode
	WHERE Question_ID = QuesID;
    
    UPDATE CHOICE
    SET Choice_Content = ChoiceCont1, Described_Content_ID = CDesContID1
    WHERE Question_ID = QuesID AND Choice_ID = ChoiceID1;
    UPDATE CHOICE
    SET Choice_Content = ChoiceCont2, Described_Content_ID = CDesContID2
    WHERE Question_ID = QuesID AND Choice_ID = ChoiceID2;
	UPDATE CHOICE
    SET Choice_Content = ChoiceCont3, Described_Content_ID = CDesContID3
    WHERE Question_ID = QuesID AND Choice_ID = ChoiceID3;
    UPDATE CHOICE
    SET Choice_Content = ChoiceCont4, Described_Content_ID = CDesContID4
    WHERE Question_ID = QuesID AND Choice_ID = ChoiceID4;
END //
DELIMITER ;

-- PROCEDURE: update_question_5_choices
-- TO DO: update question by QuesID (unchanged) and its 5 choices by QuesID and ChoiceIDx (x in [1,2,3,4,5])
DROP PROCEDURE IF EXISTS update_question_5_choices;
DELIMITER //
CREATE PROCEDURE update_question_5_choices (IN QuesID VARCHAR(9), Content VARCHAR(500), Level ENUM('Dễ','Trung bình','Khó'), CorrectChoiceID VARCHAR(5),
	QDesContID VARCHAR(9), CtrbLecID VARCHAR(9), TimeCtrb DATETIME, EvlOutcomeNo VARCHAR(9), EvlSubCode CHAR(6),
    ChoiceID1 CHAR(1), ChoiceCont1 VARCHAR(500), CDesContID1 VARCHAR(9), ChoiceID2 CHAR(1), ChoiceCont2 VARCHAR(500), CDesContID2 VARCHAR(9),
    ChoiceID3 CHAR(1), ChoiceCont3 VARCHAR(500), CDesContID3 VARCHAR(9), ChoiceID4 CHAR(1), ChoiceCont4 VARCHAR(500), CDesContID4 VARCHAR(9),
    ChoiceID5 CHAR(1), ChoiceCont5 VARCHAR(500), CDesContID5 VARCHAR(9))
BEGIN
	UPDATE QUESTION
    SET Content = Content, Level = Level, Correct_Choice_ID = CorrectChoiceID, Described_Content_ID = QDesContID, Ctrb_Lecturer_ID = CtrbLecID, 
		Time_Contribute = TimeCtrb, Evl_Outcome_No = EvlOutcomeNo, Evl_Subject_Code = EvlSubCode
	WHERE Question_ID = QuesID;
    
    UPDATE CHOICE
    SET Choice_Content = ChoiceCont1, Described_Content_ID = CDesContID1
    WHERE Question_ID = QuesID AND Choice_ID = ChoiceID1;
    UPDATE CHOICE
    SET Choice_Content = ChoiceCont2, Described_Content_ID = CDesContID2
    WHERE Question_ID = QuesID AND Choice_ID = ChoiceID2;
	UPDATE CHOICE
    SET Choice_Content = ChoiceCont3, Described_Content_ID = CDesContID3
    WHERE Question_ID = QuesID AND Choice_ID = ChoiceID3;
    UPDATE CHOICE
    SET Choice_Content = ChoiceCont4, Described_Content_ID = CDesContID4
    WHERE Question_ID = QuesID AND Choice_ID = ChoiceID4;
    UPDATE CHOICE
    SET Choice_Content = ChoiceCont5, Described_Content_ID = CDesContID5
    WHERE Question_ID = QuesID AND Choice_ID = ChoiceID5;
END //
DELIMITER ;

-- PROCEDURE: delete_question
-- TO DO: delete question by QuesID (its choices are automatically deleted)
DROP PROCEDURE IF EXISTS delete_question;
DELIMITER //
CREATE PROCEDURE delete_question (IN QuesID VARCHAR(9))
BEGIN
	DELETE FROM QUESTION
    WHERE Question_ID = QuesID;
END //
DELIMITER ;

/*
 * 2. Build an exam for LECTURER_IN_CHARGE
 * We have role build_exam, in this we have these procedure:
 * create_exam, add_question_to_exam, confirm_exam, approve_exam
 * and permissions: update on exam
 */

-- Procedure create exam
-- Input: Subject_Code CHAR(6), Exam_Date DATE, Exam_Code CHAR(4), Lecturer_Note TEXT, BC_Lecturer_ID VARCHAR(9). 
-- TO DO: Create exam and create exam date if not already exists
DROP PROCEDURE IF EXISTS create_exam;
DELIMITER $$
CREATE PROCEDURE create_exam(IN Sub_Code CHAR(6), IN Exam_Date DATE, IN Exam_Code CHAR(4), 
                             IN Lecturer_Note TEXT, IN BC_Lecturer_ID VARCHAR(9))
BEGIN
    -- Insert into exam_time if not exists
    INSERT IGNORE INTO exam_time (Subject_Code, Exam_Date)
    VALUES (Sub_Code, Exam_Date);

	INSERT IGNORE INTO exam (Subject_Code, Exam_Date, Exam_Code, Lecturer_Note, BC_Lecturer_ID)
    VALUES (Sub_Code, Exam_Date, Exam_Code, Lecturer_Note, BC_Lecturer_ID);
END $$
DELIMITER ;

-- Test
-- call create_exam('CO2017','2020-01-01','2012','','GV222222');
-- select * from exam natural join exam_time;

-- Procedure add question to exam
-- Input: Question_ID VARCHAR(9), Subject_Code CHAR(6), Exam_Date DATE, Exam_Code CHAR(4), Question_No INT, Mix_Option INT, Mix_Correct_Choice_IDs VARCHAR(5)
-- TODO: Add new questions to exam with mix_option

DROP PROCEDURE IF EXISTS add_question_to_exam;
DELIMITER $$
CREATE PROCEDURE add_question_to_exam(IN Question_ID VARCHAR(9), IN Sub_Code CHAR(6), IN Exam_Date DATE, 
                                      IN Exam_Code CHAR(4), IN Question_No INT, IN Mix_Option INT, IN Mix_Correct_Choice_IDs VARCHAR(5))
BEGIN
	DECLARE count_choice INT DEFAULT 4;

    INSERT INTO In_exam
    VALUES (Question_ID, Sub_Code, Exam_Date, Exam_Code, Question_No, Mix_Option, Mix_Correct_Choice_IDs);

    -- Count number of choice
    SELECT Number_Of_Choices INTO count_choice
    FROM Question 
    WHERE Question.Question_ID = Question_ID;

    -- Insert mapping choice based on Mix_Option
    IF (Mix_Option = 1 AND count_choice = 4) THEN
        INSERT INTO Choice_Mapping
        VALUES (Question_ID, Sub_Code, Exam_Date, Exam_Code,'A', 'B'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'B', 'C'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'C', 'D'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'D', 'A'); 
    ELSEIF (Mix_Option = 1 AND count_choice = 5) THEN
        INSERT INTO Choice_Mapping
        VALUES (Question_ID, Sub_Code, Exam_Date, Exam_Code,'A', 'B'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'B', 'C'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'C', 'D'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'D', 'E'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'E', 'A');
    ELSEIF (Mix_Option = 2 AND count_choice = 4) THEN
        INSERT INTO Choice_Mapping
        VALUES (Question_ID, Sub_Code, Exam_Date, Exam_Code,'A', 'B'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'B', 'A'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'C', 'D'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'D', 'C');
    ELSEIF (Mix_Option = 2 AND count_choice = 5) THEN
        INSERT INTO Choice_Mapping
        VALUES (Question_ID, Sub_Code, Exam_Date, Exam_Code,'A', 'B'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'B', 'A'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'C', 'C'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'D', 'E'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'E', 'D');
    ELSEIF (Mix_Option = 3 AND count_choice = 4) THEN
        INSERT INTO Choice_Mapping
        VALUES (Question_ID, Sub_Code, Exam_Date, Exam_Code,'A', 'C'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'B', 'D'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'C', 'A'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'D', 'B');
    ELSEIF (Mix_Option = 3 AND count_choice = 5) THEN
        INSERT INTO Choice_Mapping
        VALUES (Question_ID, Sub_Code, Exam_Date, Exam_Code,'A', 'C'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'B', 'D'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'C', 'E'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'D', 'A'),
               (Question_ID, Sub_Code, Exam_Date, Exam_Code,'E', 'B');
    END IF;
END $$
DELIMITER ;

-- Test
-- CALL add_question_to_exam('002CO2017', 'CO2017', '2020-03-15', '2001', 2, 2, 'B');
-- SELECT * FROM In_exam NATURAL JOIN Choice_Mapping;

-- Procedure build exam
-- Input: Subject_Code CHAR(6), Exam_Date DATE, Exam_Code CHAR(4), Date_Of_Confirmation DATE
-- TO DO: Update Date_Of_Confirmation of exam
DROP PROCEDURE IF EXISTS confirm_exam;
DELIMITER $$
CREATE PROCEDURE confirm_exam(IN Sub_Code CHAR(6), IN Exam_Date DATE, IN Exam_Code CHAR(4), IN Date_Of_Confirmation DATE)
BEGIN
    UPDATE exam e
    SET e.Date_Of_Confirmation = Date_Of_Confirmation
    WHERE e.Subject_Code = Sub_Code AND e.Exam_Code = Exam_Code AND e.Exam_Date = Exam_Date;
END $$
DELIMITER ;

-- Test
-- CALL confirm_exam('CO2017','2020-01-01','2012','2019-01-12');
-- SELECT * FROM exam NATURAL JOIN exam_time;

/*
 * 3. View an exam for LECTURER_IN_CHARGE and MANAGEMENT_LECTURER
 * We have procedure view_exam
 */
 
 -- Procedure view_exam
-- Input: Subject_Code CHAR(6), Exam_Date DATE, Exam_Code CHAR(4)
-- TO DO: View exam with exam information

DROP PROCEDURE IF EXISTS view_exam;
DELIMITER $$
CREATE PROCEDURE view_exam(IN In_Sub_Code CHAR(6), IN In_Exam_Date DATE)
BEGIN

    SELECT DISTINCT Subject_Code, Name AS Subject_Name, Exam_Date, Exam_Code, Lecturer_Note, CDescription, DFile_Path, 
		   Question_No, QContent, QFile_Path, Evl_Outcome_No, Choice_ID, Choice_Content, CFile_Path, Mix_Correct_Choice_IDs
    FROM
		(EXAM NATURAL JOIN SUBJECT) NATURAL JOIN IN_EXAM 
        NATURAL JOIN 
		(SELECT CDescription, DFile_Path, q.Question_ID, QContent, QFile_Path, Evl_Outcome_No, Choice_ID, Choice_Content, c.File_Path AS CFile_Path 
		FROM
				(SELECT CDescription, des.File_Path AS DFile_Path, Question_ID, Content AS QContent, q.File_Path AS QFile_Path, Evl_Outcome_No 
				FROM 
					(SELECT * FROM (QUESTION NATURAL LEFT JOIN HAS_FILE) NATURAL LEFT JOIN USE_DES) q 
					LEFT JOIN (SELECT * FROM COMMON_DESCRIPTION NATURAL LEFT JOIN HAS_FILE) des 
					ON q.Description_ID = des.Description_ID) q
			LEFT JOIN
				(SELECT Question_ID, Mapping_Choice_ID AS Choice_ID, Choice_Content, File_Path 
                FROM CHOICE NATURAL LEFT JOIN HAS_FILE NATURAL LEFT JOIN CHOICE_MAPPING) c
			ON c.Question_ID = q.Question_ID) qd
    WHERE Subject_Code = In_Sub_Code AND Exam_Date = In_Exam_Date
	ORDER BY Question_No, Choice_ID ASC;

END $$
DELIMITER ;

-- Test
-- CALL create_exam('CO2017','2020-01-01','2019','','GV222222');
-- CALL add_question_to_exam('002CO2017', 'CO2017', '2020-01-01', '2019', 2, 2, 'B');
-- CALL view_exam('CO2017', '2020-03-15');

/* 
 * 4. View list of students that perform at exam time of subject
 */
DROP PROCEDURE IF EXISTS view_amount_of_stud;
DELIMITER $$
CREATE PROCEDURE view_amount_of_stud (IN In_Sub_Code CHAR(6), In_Exam_Date DATE)
BEGIN
	SELECT Student_ID, Last_Name, First_Name
	FROM STUDENT
	WHERE Student_ID IN
		(SELECT Student_ID FROM ANSWER
		WHERE Subject_Code = In_Sub_Code AND In_Exam_Date = Exam_Date)
	ORDER BY First_Name, Last_Name;
END $$
DELIMITER ;

-- Test
-- CALL view_amount_of_stud ('CO2017', '2020-03-15');

/*
 * 5. View result of student's answer that performs at exam time of subject
 */

DROP VIEW IF EXISTS RESULT_STUDENT_ANSWER;
CREATE VIEW RESULT_STUDENT_ANSWER AS
SELECT ine.Subject_Code, Name AS Subject_Name, ine.Exam_Date, ine.Exam_Code, Lecturer_Note, CDescription, DFile_Path, 
		Question_No, QContent, QFile_Path, Evl_Outcome_No, Choice_ID, Choice_Content, CFile_Path, Mix_Correct_Choice_IDs,
        Student_ID, Answer_Choice_IDs, Check_Sol
    FROM
		(SELECT * FROM (EXAM NATURAL JOIN SUBJECT) NATURAL JOIN IN_EXAM 
        NATURAL JOIN 
		(SELECT CDescription, DFile_Path, q.Question_ID, QContent, QFile_Path, Evl_Outcome_No, Choice_ID, Choice_Content, c.File_Path AS CFile_Path 
		FROM
				(SELECT CDescription, des.File_Path AS DFile_Path, Question_ID, Content AS QContent, q.File_Path AS QFile_Path, Evl_Outcome_No 
				FROM 
					(SELECT * FROM (QUESTION NATURAL LEFT JOIN HAS_FILE) NATURAL LEFT JOIN USE_DES) q 
					LEFT JOIN (SELECT * FROM COMMON_DESCRIPTION NATURAL LEFT JOIN HAS_FILE) des 
					ON q.Description_ID = des.Description_ID) q
			LEFT JOIN
				(SELECT Question_ID, Mapping_Choice_ID AS Choice_ID, Choice_Content, File_Path 
                FROM CHOICE NATURAL LEFT JOIN HAS_FILE NATURAL LEFT JOIN CHOICE_MAPPING) c
			ON c.Question_ID = q.Question_ID) qd) AS ine
		JOIN ANSWER_CONTENT ac
        ON ine.Subject_Code = ac.Subject_Code AND ine.Exam_Date = ac.Exam_Date AND ine.Exam_Code = ac.Exam_Code AND Answer_No = Question_No;  
 
DROP PROCEDURE IF EXISTS view_ans_content_of_stud;
DELIMITER $$
CREATE PROCEDURE view_ans_content_of_stud(IN In_Sub_Code CHAR(6), n_Exam_Date DATE, In_Exam_Code CHAR(4), Stud_Id VARCHAR(9))
BEGIN
	SELECT * FROM RESULT_STUDENT_ANSWER
    ORDER BY Question_No, Choice_ID;
END $$
DELIMITER ;

-- Test
-- CALL view_ans_content_of_stud ('CO2017', '2020-03-15', '2001', 'SV1810812');

/*
 * 6. View mark of students that perform at exam time of subject
 */
DROP PROCEDURE IF EXISTS view_all_students_mark;
DELIMITER $$
CREATE PROCEDURE view_all_students_mark (IN In_Sub_Code CHAR(6), IN In_Exam_Date DATE)
BEGIN
	SELECT Subject_Code, Exam_Date, Exam_Code, Student_ID, Mark
	FROM ANSWER
	WHERE Subject_Code = In_Sub_Code AND Exam_Date = In_Exam_Date
	GROUP BY Student_ID;
END $$
DELIMITER ;

-- Test
-- CALL view_all_students_mark('CO2017', '2020-03-15');

/*
 * 7. View number of students doing right, number of students doing wrong for a question at exam time
 */
DROP PROCEDURE IF EXISTS view_doing_right_wrong_students;
DELIMITER $$
CREATE PROCEDURE view_doing_right_wrong_students (IN In_Sub_Code CHAR(6), IN In_Exam_Date DATE, IN Ques_Id VARCHAR(9))
BEGIN
	DECLARE num_studs_doing_right INT DEFAULT 0;
	DECLARE num_studs_doing_wrong INT DEFAULT 0;
    
    SELECT COUNT(Student_ID) INTO num_studs_doing_right
    FROM ANSWER_CONTENT NATURAL JOIN IN_EXAM
    WHERE Subject_Code = In_Sub_Code AND Exam_Date = In_Exam_Date AND Question_No = Answer_No
		AND Question_ID = Ques_Id AND Check_Sol = 'Chính xác';
	SELECT COUNT(Student_ID) INTO num_studs_doing_wrong
    FROM ANSWER_CONTENT NATURAL JOIN IN_EXAM
    WHERE Subject_Code = In_Sub_Code AND Exam_Date = In_Exam_Date AND Question_No = Answer_No
		AND Question_ID = Ques_Id AND Check_Sol = 'Không chính xác';
			
	SELECT num_studs_doing_right AS Number_Of_Students_Doing_Right, num_studs_doing_wrong AS Number_Of_Students_Doing_Wrong;
END $$
DELIMITER ;

-- Test
-- CALL view_doing_right_wrong_students ('CO2017', '2020-03-15', '001CO2017');
-- CALL view_doing_right_wrong_students ('CO2017', '2020-03-15', '002CO2017');

/*
 * 8. View the ratio of number of students doing right/total students for each outcome that evaluated by questions at exam time
 */

DROP PROCEDURE IF EXISTS view_ratio_doing_right_studs;
DELIMITER $$
CREATE PROCEDURE view_ratio_doing_right_studs (IN SubCode CHAR(6), ExamDate DATE)
BEGIN
    SELECT Evl_Outcome_No, (Num_Ans_Right_Studs / Total_Studs)*100 AS Ratio FROM
		(SELECT Evl_Outcome_No, Total_Studs, IF (Num_Ans_Right_Studs IS NULL, 0, Num_Ans_Right_Studs) AS Num_Ans_Right_Studs
		FROM 
			(SELECT Evl_Outcome_No, COUNT(Student_ID) AS Total_Studs
			FROM	(SELECT * FROM RESULT_STUDENT_ANSWER 
					WHERE Subject_Code = SubCode AND Exam_Date = ExamDate
					GROUP BY Subject_Code, Exam_Date, Exam_Code, Student_ID, Question_No) sta
			GROUP BY Evl_Outcome_No) total
			NATURAL LEFT JOIN
			(SELECT Evl_Outcome_No, COUNT(Student_ID) AS Num_Ans_Right_Studs
			FROM	(SELECT * FROM RESULT_STUDENT_ANSWER 
					WHERE Subject_Code = SubCode AND Exam_Date = ExamDate
					GROUP BY Subject_Code, Exam_Date, Exam_Code, Student_ID, Question_No) sta
			WHERE Check_Sol = 'Chính xác'
			GROUP BY Evl_Outcome_No) correct) nt;
END $$
DELIMITER ;

-- CALL view_ratio_doing_right_studs ('CO2017', '2020-03-15');

/*
 * 9. View 5 questions that have maximum number of students doing wrong at exam time
 */

DROP PROCEDURE IF EXISTS view_5_ques_max_studs_doing_wrong;
DELIMITER $$
CREATE PROCEDURE view_5_ques_max_studs_doing_wrong (IN In_Sub_Code CHAR(6), In_Exam_Date DATE)
BEGIN
	SELECT Question_ID, Content, COUNT(Student_ID) AS Number_Of_Students_Doing_Wrong
    FROM ANSWER_CONTENT NATURAL JOIN IN_EXAM NATURAL JOIN (SELECT Question_ID, Content FROM QUESTION) q
    WHERE Subject_Code = In_Sub_Code AND Exam_Date = In_Exam_Date AND Question_No = Answer_No AND Check_Sol = 'Không chính xác'
    GROUP BY Question_ID
    ORDER BY Number_Of_Students_Doing_Wrong DESC
    LIMIT 5;
END $$
DELIMITER ;

-- Test
-- CALL view_5_ques_max_studs_doing_wrong ('CO2017', '2020-03-15');

/*
 * 10. View all questions that have maximum number of students doing wrong at all exam time of one subject
 */

DROP PROCEDURE IF EXISTS view_all_quess_max_studs_doing_wrong;
DELIMITER $$
CREATE PROCEDURE view_all_quess_max_studs_doing_wrong (IN In_Sub_Code CHAR(6))
BEGIN
	SELECT Question_ID, Content
    FROM ANSWER_CONTENT NATURAL JOIN IN_EXAM NATURAL JOIN (SELECT Question_ID, Content FROM QUESTION) q
    WHERE Subject_Code = In_Sub_Code AND Question_No = Answer_No AND Check_Sol = 'Không chính xác'
    GROUP BY Question_ID
    HAVING COUNT(Student_ID) = (SELECT MAX(num_studs_doing_wrong)
								FROM 	(SELECT COUNT(Student_ID) AS num_studs_doing_wrong
										FROM ANSWER_CONTENT NATURAL JOIN IN_EXAM 
										WHERE Subject_Code = In_Sub_Code AND Question_No = Answer_No AND Check_Sol = 'Không chính xác'
										GROUP BY Question_ID) nsdw);
END $$
DELIMITER ;

-- Test
-- CALL view_all_quess_max_studs_doing_wrong ('CO2017');

/*
 * 11. View lowest grade outcome on one exam for LECTURER_IN_CHARGE and MANAGEMENT_LECTURER
 * We have procedure view_lowest_grade_outcome_on
 */

-- Procedure view_lowest_grade_outcome_on
-- Input:  Subject_Code CHAR(6), Exam_Date DATE
-- TO DO: View outcome has lowest grade in this exam_time

DROP PROCEDURE IF EXISTS view_lowest_grade_outcome_on;
DELIMITER $$
CREATE PROCEDURE view_lowest_grade_outcome_on(IN In_Sub_Code CHAR(6), IN In_Exam_Date DATE)
BEGIN
    -- Count num of answer
    DECLARE num_of_answers INT DEFAULT 1;
    SELECT COUNT(*) INTO num_of_answers
    FROM Answer
    WHERE Subject_Code = In_Sub_Code AND Exam_Date = In_Exam_Date;

    SELECT Evl_Outcome_No, Question_ID, (1 - num_of_wrong/num_of_answers)*100 True_Percentage
    FROM (
            SELECT DISTINCT Evl_Outcome_No, Question_ID, COUNT(*) num_of_wrong
            FROM (((Answer NATURAL JOIN In_Exam) NATURAL JOIN Answer_Content) NATURAL JOIN QUESTION)
            WHERE Question_No = Answer_No AND Answer_Choice_IDs <> Mix_Correct_Choice_IDs
                  AND Subject_Code = In_Sub_Code AND Exam_Date = In_Exam_Date
            GROUP BY Question_ID
        ) count_wrong
    WHERE num_of_wrong = (SELECT MAX(num_of_wrong) FROM (
                                                            SELECT DISTINCT Evl_Outcome_No, Question_ID, COUNT(*) num_of_wrong
                                                            FROM (((Answer NATURAL JOIN In_Exam) NATURAL JOIN Answer_Content) NATURAL JOIN QUESTION)
                                                            WHERE Question_No = Answer_No AND Answer_Choice_IDs <> Mix_Correct_Choice_IDs
                                                                  AND Subject_Code = In_Sub_Code AND Exam_Date = In_Exam_Date
                                                            GROUP BY Question_ID
                                                        )count_wrong_2 );

END $$
DELIMITER ;

-- Test
-- CALL view_lowest_grade_outcome_on('CO2017', '2020-03-15');

/*
 * 12. View lowest grade outcome on 3 latest exam for LECTURER_IN_CHARGE and MANAGEMENT_LECTURER
 * We have procedure view_lowest_grade_outcome_on_lastest_3_exam
 */

-- Procedure view_lowest_grade_outcome_on
-- Input:  Subject_Code CHAR(6)
-- TO DO: View outcome has lowest grade in this 3 latest exam_time

DROP PROCEDURE IF EXISTS view_lowest_grade_outcome_on_lastest_3_exam;
DELIMITER $$
CREATE PROCEDURE view_lowest_grade_outcome_on_lastest_3_exam(IN In_Sub_Code CHAR(6))
BEGIN
    -- Count num of answer
    DECLARE num_of_answers INT DEFAULT 1;
    SELECT COUNT(*) INTO num_of_answers
    FROM Answer
    WHERE Subject_Code = In_Sub_Code AND Exam_Date IN ( SELECT * FROM(
                                                        SELECT DISTINCT Exam_Date
                                                        FROM Answer
                                                        WHERE Subject_Code = In_Sub_Code
                                                        ORDER BY Exam_date ASC
                                                        LIMIT 3) latest_3_exam_1
                                                        );

    SELECT Evl_Outcome_No, Question_ID, (1 - num_of_wrong/num_of_answers)*100 True_Percentage
    FROM (
            SELECT DISTINCT Evl_Outcome_No, Question_ID, COUNT(*) num_of_wrong
            FROM (((Answer NATURAL JOIN In_Exam) NATURAL JOIN Answer_Content) NATURAL JOIN QUESTION)
            WHERE Question_No = Answer_No AND Answer_Choice_IDs <> Mix_Correct_Choice_IDs
                  AND Subject_Code = In_Sub_Code AND Exam_Date IN (
																	SELECT * FROM(
                                                                    SELECT DISTINCT Exam_Date
                                                                    FROM Answer
                                                                    WHERE Subject_Code = In_Sub_Code
                                                                    ORDER BY Exam_date ASC
                                                                    LIMIT 3) latest_3_exam_2
                                                                    )
            GROUP BY Question_ID
        ) count_wrong
    WHERE num_of_wrong = (SELECT MAX(num_of_wrong) FROM (
                                                            SELECT DISTINCT Evl_Outcome_No, Question_ID, COUNT(*) num_of_wrong
                                                            FROM (((Answer NATURAL JOIN In_Exam) NATURAL JOIN Answer_Content) NATURAL JOIN QUESTION)
                                                            WHERE Question_No = Answer_No AND Answer_Choice_IDs <> Mix_Correct_Choice_IDs
                                                                  AND Subject_Code = In_Sub_Code AND Exam_Date IN (
																													SELECT * FROM(
                                                                                                                    SELECT DISTINCT Exam_Date
                                                                                                                    FROM Answer
                                                                                                                    WHERE Subject_Code = In_Sub_Code
                                                                                                                    ORDER BY Exam_date ASC
                                                                                                                    LIMIT 3) latest_3_exam_3
                                                                                                                    )
                                                            GROUP BY Question_ID
                                                        )count_wrong_2 );

END $$
DELIMITER ;

-- Test
-- CALL view_lowest_grade_outcome_on_lastest_3_exam('CO2017');

/* 
 * 13. Approve required exams of one subject at exam time
 */
-- Procedure: approve_exam
-- Input: Subject_Code CHAR(6), Exam_Date DATE, Exam_Code CHAR(4), Apr_Lecturer_ID VARCHAR(9)
-- TO DO: Check constraint Exam_time has at least 2 exams. If satisfied, update Apr_Lecturer_ID and Date_Of_Approval

DROP PROCEDURE IF EXISTS approve_exam;
DELIMITER $$
CREATE PROCEDURE approve_exam(IN Sub_Code CHAR(6), IN Exam_Date DATE, IN Exam_Code CHAR(4), 
                            IN Apr_Lecturer_ID VARCHAR(9), IN Date_Of_Approval DATE)
BEGIN
    -- Count exam
    DECLARE count_exam INT DEFAULT 0;
    SELECT COUNT(*) INTO count_exam
    FROM exam 
    WHERE exam.Subject_Code = Sub_Code AND exam.Exam_Date = Exam_Date;

    IF count_exam > 1 THEN
        UPDATE exam
        SET exam.Apr_Lecturer_ID = Apr_Lecturer_ID, exam.Date_Of_Approval = Date_Of_Approval
        WHERE exam.Subject_Code = Sub_Code AND exam.Exam_Date = Exam_Date;
    ELSE
        SELECT 'Exam time must has at least 2 exams';
    END IF;
END $$
DELIMITER ;

-- Test
-- CALL approve_exam('CO2017','2020-01-01','2012','GV333333','2019-02-12');

-- CALL create_exam('CO2017','2020-01-01','2013','','GV222222');
-- CALL approve_exam('CO2017','2020-01-01','2012','GV333333','2019-02-12');
-- SELECT * FROM exam NATURAL JOIN exam_time;

########################################################################
# 14. View all subjects that have minimum GPA at semester of school year
# User: ManagementLecturer
########################################################################

DROP PROCEDURE IF EXISTS view_min_gpa_subject;
DELIMITER //
CREATE PROCEDURE view_min_gpa_subject (IN From_Date DATE, To_Date DATE)
BEGIN
	SELECT Subject_Code, Name AS Subject_Name, AVG(Mark) AS GPA
    FROM ANSWER NATURAL JOIN SUBJECT 
    WHERE Exam_Date BETWEEN From_Date AND To_Date 
    GROUP BY Subject_Code
    HAVING AVG(Mark) = (SELECT MIN(gpa)
						FROM 	(SELECT AVG(Mark) AS gpa FROM ANSWER 
                                WHERE Exam_Date BETWEEN From_Date AND To_Date 
								GROUP BY Subject_Code) gs);
END //
DELIMITER ;

-- Test
-- CALL view_min_gpa_subject ('2020-02-01', '2020-06-01');

####################################################################################
# 15. View all subjects that have minimum GPA at 3 latest exam time of each subject
# User: ManagementLecturer
####################################################################################

DROP PROCEDURE IF EXISTS view_min_gpa_subject_3_lastest_exam_time;
DELIMITER //
CREATE PROCEDURE view_min_gpa_subject_3_lastest_exam_time ()
BEGIN
	DROP VIEW IF EXISTS GPA_IN_EXAM_TIME;
    ## calculate gpa in each exam time of each subject ##
	CREATE VIEW GPA_IN_EXAM_TIME AS 
	SELECT Subject_Code, Name AS Subject_Name, Exam_Date, AVG(Mark) AS GPA
    FROM ANSWER NATURAL JOIN SUBJECT 
    GROUP BY Subject_Code, Exam_Date;
   
	SELECT Subject_Code, Subject_Name FROM GPA_IN_EXAM_TIME g
    GROUP BY Subject_Code
    HAVING (SELECT COUNT(*) FROM
				(SELECT * FROM (SELECT * FROM GPA_IN_EXAM_TIME g1
				WHERE g1.Subject_Code = g.Subject_Code
				ORDER BY Exam_Date DESC
				LIMIT 3) AS by_date
				UNION
				SELECT * FROM (SELECT * FROM GPA_IN_EXAM_TIME g2
                WHERE g2.Subject_Code = g.Subject_Code
                ORDER BY GPA ASC
                LIMIT 3) AS by_gpa) AS cmp
			) = 0;
END //
DELIMITER ;

-- Test
-- CALL view_min_gpa_subject_3_lastest_exam_time ();

#######################################################################################
# 16. View all subjects that have maximum number of outcomes that have minimum ratio of 
# number of students doing right/total students at exam time
# User: ManagementLecturer
#######################################################################################

DROP VIEW IF EXISTS RATIO_STUD_DOING_RIGHT;
CREATE VIEW RATIO_STUD_DOING_RIGHT AS
SELECT Subject_Code, Exam_Date, Evl_Outcome_No, (Num_Ans_Right_Studs / Total_Studs)*100 AS Ratio FROM
		(SELECT Subject_Code, Exam_Date, Evl_Outcome_No, Total_Studs, IF (Num_Ans_Right_Studs IS NULL, 0, Num_Ans_Right_Studs) AS Num_Ans_Right_Studs
		FROM 
			(SELECT Subject_Code, Exam_Date, Evl_Outcome_No, COUNT(Student_ID) AS Total_Studs
			FROM	(SELECT * FROM RESULT_STUDENT_ANSWER 
					GROUP BY Subject_Code, Exam_Date, Exam_Code, Student_ID, Question_No) sta
			GROUP BY Subject_Code, Exam_Date, Evl_Outcome_No) total
			NATURAL LEFT JOIN
			(SELECT Subject_Code, Exam_Date, Evl_Outcome_No, COUNT(Student_ID) AS Num_Ans_Right_Studs
			FROM	(SELECT * FROM RESULT_STUDENT_ANSWER 
					GROUP BY Subject_Code, Exam_Date, Exam_Code, Student_ID, Question_No) sta
			WHERE Check_Sol = 'Chính xác'
			GROUP BY Subject_Code, Exam_Date, Evl_Outcome_No) correct) nt;

-- Procedure: view_sub_max_num_oc_min_ratio_stud_doing_right
DROP PROCEDURE IF EXISTS view_sub_max_num_oc_min_ratio_stud_doing_right;
DELIMITER //
CREATE PROCEDURE view_sub_max_num_oc_min_ratio_stud_doing_right (IN From_Date DATE, To_Date DATE)
BEGIN
	DROP VIEW IF EXISTS NUM_OC_MIN_RATIO;
	CREATE VIEW NUM_OC_MIN_RATIO AS
	SELECT Subject_Code, Exam_Date, COUNT(Evl_Outcome_No) AS Number_Of_Outcomes_Have_Min_Ratio, Ratio 
    FROM RATIO_STUD_DOING_RIGHT r1
    GROUP BY Subject_Code, Exam_Date, Evl_Outcome_No
    HAVING Ratio = (SELECT MIN(Ratio) FROM RATIO_STUD_DOING_RIGHT r2
                    WHERE r1.Subject_Code = r2.Subject_Code AND r1.Exam_Date = r2.Exam_Date);
	SELECT * FROM NUM_OC_MIN_RATIO
    WHERE (Exam_Date BETWEEN From_Date AND To_Date)
		AND Number_Of_Outcomes_Have_Min_Ratio = (SELECT MAX(Number_Of_Outcomes_Have_Min_Ratio) FROM NUM_OC_MIN_RATIO
												WHERE Exam_Date BETWEEN From_Date AND To_Date);
END //
DELIMITER ;

-- Test
-- CALL view_sub_max_num_oc_min_ratio_stud_doing_right ('2020-03-10', '2020-03-20');

#################################################################
# 17. Perform an exam of subject at exam time/semester/school year
# User: Student
#################################################################

-- PROCEDURE: add_one_answer
-- TO DO: insert one answer into ANSWER_CONTENT
DROP PROCEDURE IF EXISTS add_one_answer;
DELIMITER //
CREATE PROCEDURE add_one_answer (IN StudentID VARCHAR(9), SubCode CHAR(6), ExamDate DATE, ExamCode CHAR(4), AnsNum INT, AnsNo INT, AnsChoiceIDs VARCHAR(5))
BEGIN
	DECLARE CheckSol ENUM ('Không chính xác', 'Chính xác', 'Không hoàn thành');
    DECLARE CorrectChoiceIDs VARCHAR(5);
    SELECT Mix_Correct_Choice_IDs INTO CorrectChoiceIDs FROM IN_EXAM
    WHERE Subject_Code = SubCode AND Exam_Date = ExamDate AND Exam_Code = ExamCode AND Question_No = AnsNo;
    IF AnsChoiceIDs IS NULL THEN
		SET CheckSol = 'Không hoàn thành';
	ELSEIF AnsChoiceIDs = CorrectChoiceIDs THEN
		SET CheckSol = 'Chính xác';
	ELSE
		SET CheckSol = 'Không chính xác';
    END IF;
	INSERT INTO ANSWER_CONTENT
    VALUES (StudentID, SubCode, ExamDate, ExamCode, AnsNum, AnsNo, AnsChoiceIDs, CheckSol);
END //
DELIMITER ;

-- PROCEDURE: add_student_task
-- TO DO: insert student task into ANSWER (include NumCorrectAns and Mark which are calculated in application after student submit)
DROP PROCEDURE IF EXISTS add_student_task;
DELIMITER //
CREATE PROCEDURE add_student_task (IN StudentID VARCHAR(9), SubCode CHAR(6), ExamDate DATE, ExamCode CHAR(4), AnsNum INT)
BEGIN
	INSERT INTO ANSWER
    VALUES (StudentID, SubCode, ExamDate, ExamCode, AnsNum, NULL, NULL);
END //
DELIMITER ;

-- FUNCTION: calculate_mark
-- TO DO: calculate mark of student answer in an exam at exam time
DROP FUNCTION IF EXISTS calculate_mark;
DELIMITER //
CREATE FUNCTION calculate_mark (In_Sub_Code CHAR(6), In_Exam_Date DATE, In_Exam_Code CHAR(4), Stud_Id VARCHAR(9))
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
	DECLARE num_of_ques INT DEFAULT 0;
	DECLARE num_of_correct_ans INT DEFAULT 0;
    DECLARE mark DECIMAL(5,2);
    
    SELECT COUNT(*) INTO num_of_ques FROM ANSWER_CONTENT
	WHERE Subject_Code = In_Sub_Code AND Exam_Date = In_Exam_Date AND Exam_Code = In_Exam_Code AND Student_ID = Stud_Id;
    SELECT COUNT(*) INTO num_of_correct_ans FROM ANSWER_CONTENT
	WHERE Subject_Code = In_Sub_Code AND Exam_Date = In_Exam_Date AND Exam_Code = In_Exam_Code AND Student_ID = Stud_Id AND Check_Sol = 'Chính xác';
	
    SET mark = (num_of_correct_ans / num_of_ques) * 10;
    RETURN mark;
END //
DELIMITER ;

-- Test
-- SELECT calculate_mark ('CO2017', '2020-03-15', '2001','SV1810812');

-- PROCEDURE: set_student_mark
-- TO DO: set mark of student answer after insert, calculated by FUNCTION calculate_mark
DROP PROCEDURE IF EXISTS set_student_mark;
DELIMITER //
CREATE PROCEDURE set_student_mark (IN SubCode CHAR(6), ExamDate DATE, ExamCode CHAR(4), StudentID VARCHAR(9), AnsNum INT)
BEGIN
	UPDATE ANSWER
    SET Mark = calculate_mark(SubCode, ExamDate, ExamCode, StudentID)
    WHERE Subject_Code = SubCode AND Exam_Date = ExamDate AND Exam_Code = ExamCode AND Student_ID = StudentID;
END //
DELIMITER ;

-- Test
-- CALL set_student_mark ('CO2017', '2020-03-15', '2001', 'SV1810812', 1);

############################################
# 18. View one exam of subject at exam time
# User: Student
############################################

DROP VIEW IF EXISTS EXAM_SOLUTION;
CREATE VIEW EXAM_SOLUTION AS
SELECT Subject_Code, Name AS Subject_Name, Exam_Date, Exam_Code, Lecturer_Note, CDescription, DFile_Path, 
		Question_No, QContent, QFile_Path, Evl_Outcome_No, Choice_ID, Choice_Content, CFile_Path, Mix_Correct_Choice_IDs
    FROM
		(EXAM NATURAL JOIN SUBJECT) NATURAL JOIN IN_EXAM 
        NATURAL JOIN 
		(SELECT CDescription, DFile_Path, q.Question_ID, QContent, QFile_Path, Evl_Outcome_No, Choice_ID, Choice_Content, c.File_Path AS CFile_Path 
		FROM
				(SELECT CDescription, des.File_Path AS DFile_Path, Question_ID, Content AS QContent, q.File_Path AS QFile_Path, Evl_Outcome_No 
				FROM 
					(SELECT * FROM (QUESTION NATURAL LEFT JOIN HAS_FILE) NATURAL LEFT JOIN USE_DES) q 
					LEFT JOIN (SELECT * FROM COMMON_DESCRIPTION NATURAL LEFT JOIN HAS_FILE) des 
					ON q.Description_ID = des.Description_ID) q
			LEFT JOIN
				(SELECT Question_ID, Mapping_Choice_ID AS Choice_ID, Choice_Content, File_Path 
                FROM CHOICE NATURAL LEFT JOIN HAS_FILE NATURAL LEFT JOIN CHOICE_MAPPING) c
			ON c.Question_ID = q.Question_ID) qd;
    
-- PROCEDURE: view_performed_exam
-- TO DO: select view EXAM_SOLUTION by SubCode, ExamDate, ExamCode
DROP PROCEDURE IF EXISTS view_performed_exam;
DELIMITER //
CREATE PROCEDURE view_performed_exam (IN SubCode CHAR(6), ExamDate DATE, ExamCode CHAR(4))
BEGIN
      SELECT Subject_Code, Subject_Name, Exam_Date, Exam_Code, Lecturer_Note, CDescription, DFile_Path, 
		Question_No, QContent, QFile_Path, Evl_Outcome_No, Choice_ID, Choice_Content, CFile_Path FROM EXAM_SOLUTION
      WHERE Subject_Code = SubCode AND Exam_Date = ExamDate AND Exam_Code = ExamCode
      ORDER BY Question_No, Choice_ID;
END //
DELIMITER ;

-- Test
-- CALL view_performed_exam ('CO2017', '2020-03-15', '2001');

###################################################################################################
# 19. View correct choices of each question in an exam of subject at exam time/semester/school year
# User: Student, ManagementLecturer, LecturerInCharge
###################################################################################################

-- PROCEDURE: view_exam_with_solution
-- TO DO: select view EXAM_SOLUTION by SubCode, ExamDate, ExamCode
DROP PROCEDURE IF EXISTS view_exam_with_solution;
DELIMITER //
CREATE PROCEDURE view_exam_with_solution (IN SubCode CHAR(6), ExamDate DATE, ExamCode CHAR(4))
BEGIN
      SELECT * FROM EXAM_SOLUTION
      WHERE Subject_Code = SubCode AND Exam_Date = ExamDate AND Exam_Code = ExamCode
      ORDER BY Question_No, Choice_ID;
END //
DELIMITER ;

-- Test
-- CALL view_exam_with_solution ('CO2017', '2020-03-15', '2001');

###########################################################################
# 20. Review answer of task for one exam at exam time/semester/school year
# User: Student
###########################################################################

DROP VIEW IF EXISTS STUDENT_ANSWER;
CREATE VIEW STUDENT_ANSWER AS
SELECT ine.Subject_Code, Name AS Subject_Name, ine.Exam_Date, ine.Exam_Code, Lecturer_Note, CDescription, DFile_Path, 
		Question_No, QContent, QFile_Path, Evl_Outcome_No, Choice_ID, Choice_Content, CFile_Path, Student_ID, Answer_Choice_IDs
    FROM
		(SELECT * FROM (EXAM NATURAL JOIN SUBJECT) NATURAL JOIN IN_EXAM 
        NATURAL JOIN 
		(SELECT CDescription, DFile_Path, q.Question_ID, QContent, QFile_Path, Evl_Outcome_No, Choice_ID, Choice_Content, c.File_Path AS CFile_Path 
		FROM
				(SELECT CDescription, des.File_Path AS DFile_Path, Question_ID, Content AS QContent, q.File_Path AS QFile_Path, Evl_Outcome_No 
				FROM 
					(SELECT * FROM (QUESTION NATURAL LEFT JOIN HAS_FILE) NATURAL LEFT JOIN USE_DES) q 
					LEFT JOIN (SELECT * FROM COMMON_DESCRIPTION NATURAL LEFT JOIN HAS_FILE) des 
					ON q.Description_ID = des.Description_ID) q
			LEFT JOIN
				(SELECT Question_ID, Mapping_Choice_ID AS Choice_ID, Choice_Content, File_Path 
                FROM CHOICE NATURAL LEFT JOIN HAS_FILE NATURAL LEFT JOIN CHOICE_MAPPING) c
			ON c.Question_ID = q.Question_ID) qd) AS ine
		JOIN ANSWER_CONTENT ac
        ON ine.Subject_Code = ac.Subject_Code AND ine.Exam_Date = ac.Exam_Date AND ine.Exam_Code = ac.Exam_Code AND Answer_No = Question_No;  
  
-- PROCEDURE: view_student_answer
-- TO DO: select view STUDENT_ANSWER by StudentID, SubCode, ExamDate, ExamCode
DROP PROCEDURE IF EXISTS view_student_answer;
DELIMITER //
CREATE PROCEDURE view_student_answer (IN StudentID VARCHAR(9), SubCode CHAR(6), ExamDate DATE, ExamCode CHAR(4))
BEGIN
	SELECT * FROM result_student_answer
    WHERE Student_ID = StudentID AND Subject_Code = SubCode AND Exam_Date = ExamDate AND Exam_Code = ExamCode
    ORDER BY Question_No, Choice_ID;
END //
DELIMITER ;

-- Test
-- CALL view_student_answer ('SV1810812','CO2017', '2020-03-15', '2001');

/*
 * 21. View self mark in exam of subject at exam time 
 */

DROP PROCEDURE IF EXISTS view_mark_in_exam;
DELIMITER $$
CREATE PROCEDURE view_mark_in_exam (IN In_Sub_Code CHAR(6), In_Exam_Date DATE, In_Exam_Code CHAR(4), Stud_Id VARCHAR(9))
BEGIN
	CALL set_student_mark (In_Sub_Code, In_Exam_Date, In_Exam_Code, Stud_Id, 1);
	SELECT Mark FROM ANSWER
    WHERE Student_ID = Stud_ID AND Subject_Code = In_Sub_Code AND Exam_Date = In_Exam_Date AND Exam_Code = In_Exam_Code;
END $$
DELIMITER ;

-- Test
CALL view_mark_in_exam('CO2017', '2020-03-15', '2001','SV1810812');

/*
 * 22. View self mark in all exams of all subjects at exam time
 */
DROP PROCEDURE IF EXISTS view_mark_in_all_exams;
DELIMITER $$
CREATE PROCEDURE view_mark_in_all_exams (IN In_Exam_Date DATE, Stud_Id VARCHAR(9))
BEGIN
	SELECT Subject_Code, Exam_Code, Mark FROM ANSWER
    WHERE Stud_Id = Student_ID AND Exam_Date = In_Exam_Date;
END $$
DELIMITER ;

-- Test
-- CALL view_mark_in_all_exams('2020-03-15', 'SV1810812');

#############################################################################
# 23. View ratio of number of correct answers/total questions of each outcome 
#     evaluated by question in exam at exam time/semester/school year
# User: Student
#############################################################################

-- PROCEDURE: view_ratio_outcome_in_exam
-- TO DO: calculate and select ratio in Req 23. of each outcome in student answer
DROP PROCEDURE IF EXISTS view_ratio_outcome_in_exam;
DELIMITER //
CREATE PROCEDURE view_ratio_outcome_in_exam (IN StudentID VARCHAR(9), SubCode CHAR(6), ExamDate DATE, ExamCode CHAR(4))
BEGIN
	SELECT Evl_Outcome_No, (Num_Correct_Ans / Total_Ques) AS Ratio FROM
		(SELECT Evl_Outcome_No, Total_Ques, IF (Num_Correct_Ans IS NULL, 0, Num_Correct_Ans) AS Num_Correct_Ans
		FROM 
			(SELECT Evl_Outcome_No, COUNT(question_no) AS Total_Ques
			FROM	(SELECT * FROM RESULT_STUDENT_ANSWER 
					WHERE Student_ID = StudentID AND Subject_Code = SubCode AND Exam_Date = ExamDate AND Exam_Code = ExamCode
					GROUP BY Question_No) sta
			GROUP BY Evl_Outcome_No) correct
			NATURAL LEFT JOIN
			(SELECT Evl_Outcome_No, COUNT(question_no) AS Num_Correct_Ans
			FROM	(SELECT * FROM RESULT_STUDENT_ANSWER 
					WHERE Student_ID = StudentID AND Subject_Code = SubCode AND Exam_Date = ExamDate AND Exam_Code = ExamCode
					GROUP BY Question_No) sta
			WHERE Check_Sol = 'Chính xác'
			GROUP BY Evl_Outcome_No) total) nt;
END //
DELIMITER ;

-- Test
-- CALL view_ratio_outcome_in_exam ('SV1810812','CO2017', '2020-03-15', '2001');

/*
 * 24. Note on exam for STUDENT
 * We have procedure note_on_exam
 */

-- Procedure note_on_exam
-- Input: Student_ID VARCHAR(9), Subject_Code CHAR(6), Exam_Date DATE, Exam_Code CHAR(4), Answer_Number INT, Student_Note TEXT,
-- TO DO: Student add a note to completed exam answers 

DROP PROCEDURE IF EXISTS note_on_exam;
DELIMITER $$
CREATE PROCEDURE note_on_exam(IN Student_ID VARCHAR(9), IN Subject_Code CHAR(6), IN Exam_Date DATE, 
                              IN Exam_Code CHAR(4), IN Answer_Number INT, IN Student_Note TEXT)
BEGIN
    UPDATE answer
    SET answer.Student_Note = Student_Note
    WHERE answer.Student_ID = Student_ID AND answer.Subject_Code = Subject_Code AND answer.Exam_Date = Exam_Date
                              AND answer.Exam_Code = Exam_Code AND answer.Answer_Number = Answer_Number;
END $$
DELIMITER ;

-- Test
-- CALL note_on_exam('SV1810812', 'CO2017', '2020-03-15', '2001', 1, 'This is hard exam.');
-- SELECT * FROM answer;

