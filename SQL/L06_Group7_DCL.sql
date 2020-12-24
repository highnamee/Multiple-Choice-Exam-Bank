-- User
DROP USER IF EXISTS 'LecturerInCharge'@'localhost';
CREATE USER 'LecturerInCharge'@'localhost' IDENTIFIED BY 'LecturerInCharge';
DROP USER IF EXISTS 'ManagementLecturer'@'localhost';
CREATE USER 'ManagementLecturer'@'localhost' IDENTIFIED BY 'ManagementLecturer';
DROP USER IF EXISTS 'Student'@'localhost';
CREATE USER 'Student'@'localhost' IDENTIFIED BY 'Student';

-- Role
DROP ROLE IF EXISTS CRUD_QUESTIONS;
CREATE ROLE CRUD_QUESTIONS;

DROP ROLE IF EXISTS build_exam;
CREATE ROLE build_exam;

DROP ROLE IF EXISTS PERFORM_EXAM;
CREATE ROLE PERFORM_EXAM;

USE MCQS_EXAMS_BANK;
-- Privileges
## 1
GRANT EXECUTE ON PROCEDURE add_question_4_choices TO CRUD_QUESTIONS;
GRANT EXECUTE ON PROCEDURE add_question_5_choices TO CRUD_QUESTIONS;
GRANT EXECUTE ON PROCEDURE update_question_4_choices TO CRUD_QUESTIONS;
GRANT EXECUTE ON PROCEDURE update_question_5_choices TO CRUD_QUESTIONS;
GRANT EXECUTE ON PROCEDURE delete_question TO CRUD_QUESTIONS;
GRANT CRUD_QUESTIONS TO 'LecturerInCharge'@'localhost';

## 2
GRANT EXECUTE ON PROCEDURE create_exam TO build_exam;
GRANT EXECUTE ON PROCEDURE add_question_to_exam TO build_exam;
GRANT EXECUTE ON PROCEDURE confirm_exam TO build_exam;
GRANT build_exam TO 'LecturerInCharge'@'localhost';
GRANT UPDATE ON exam TO 'LecturerInCharge'@'localhost';

## 3
GRANT EXECUTE ON PROCEDURE view_exam TO 'LecturerInCharge'@'localhost';
GRANT EXECUTE ON PROCEDURE view_exam TO 'ManagementLecturer'@'localhost';

## 4
GRANT EXECUTE ON PROCEDURE view_amount_of_stud TO 'LecturerInCharge'@'localhost';

## 5
GRANT EXECUTE ON PROCEDURE view_ans_content_of_stud TO 'LecturerInCharge'@'localhost';

## 6
GRANT EXECUTE ON PROCEDURE view_all_students_mark TO 'LecturerInCharge'@'localhost';
GRANT EXECUTE ON PROCEDURE view_all_students_mark TO 'ManagementLecturer'@'localhost';

## 7
GRANT EXECUTE ON PROCEDURE view_doing_right_wrong_students TO 'LecturerInCharge'@'localhost';
GRANT EXECUTE ON PROCEDURE view_doing_right_wrong_students TO 'ManagementLecturer'@'localhost';

## 8
GRANT EXECUTE ON PROCEDURE view_ratio_doing_right_studs TO 'LecturerInCharge'@'localhost';
GRANT EXECUTE ON PROCEDURE view_ratio_doing_right_studs TO 'ManagementLecturer'@'localhost';

## 9
GRANT EXECUTE ON PROCEDURE view_5_ques_max_studs_doing_wrong TO 'LecturerInCharge'@'localhost';
GRANT EXECUTE ON PROCEDURE view_5_ques_max_studs_doing_wrong TO 'ManagementLecturer'@'localhost';

## 10
GRANT EXECUTE ON PROCEDURE view_all_quess_max_studs_doing_wrong TO 'LecturerInCharge'@'localhost';
GRANT EXECUTE ON PROCEDURE view_all_quess_max_studs_doing_wrong TO 'ManagementLecturer'@'localhost';

## 11
GRANT EXECUTE ON PROCEDURE view_lowest_grade_outcome_on TO 'LecturerInCharge'@'localhost';
GRANT EXECUTE ON PROCEDURE view_lowest_grade_outcome_on TO 'ManagementLecturer'@'localhost';

## 12
GRANT EXECUTE ON PROCEDURE view_lowest_grade_outcome_on_lastest_3_exam TO 'LecturerInCharge'@'localhost';
GRANT EXECUTE ON PROCEDURE view_lowest_grade_outcome_on_lastest_3_exam TO 'ManagementLecturer'@'localhost';

## 13
GRANT EXECUTE ON PROCEDURE approve_exam TO 'ManagementLecturer'@'localhost';

## 14
GRANT EXECUTE ON PROCEDURE view_min_gpa_subject TO 'ManagementLecturer'@'localhost';

## 15
GRANT EXECUTE ON PROCEDURE view_min_gpa_subject_3_lastest_exam_time TO 'ManagementLecturer'@'localhost';

## 16
GRANT EXECUTE ON PROCEDURE view_sub_max_num_oc_min_ratio_stud_doing_right TO 'ManagementLecturer'@'localhost';

## 17
GRANT EXECUTE ON PROCEDURE add_one_answer TO PERFORM_EXAM;
GRANT EXECUTE ON PROCEDURE add_student_task TO PERFORM_EXAM;
GRANT EXECUTE ON PROCEDURE set_student_mark TO PERFORM_EXAM;
GRANT PERFORM_EXAM TO 'Student'@'localhost';

## 18
GRANT EXECUTE ON PROCEDURE view_performed_exam TO 'Student'@'localhost';

## 19
GRANT EXECUTE ON PROCEDURE view_exam_with_solution TO 'Student'@'localhost';
GRANT EXECUTE ON PROCEDURE view_exam_with_solution TO 'ManagementLecturer'@'localhost';
GRANT EXECUTE ON PROCEDURE view_exam_with_solution TO 'LecturerInCharge'@'localhost';

## 20
GRANT EXECUTE ON PROCEDURE view_student_answer TO 'Student'@'localhost';

## 21
GRANT EXECUTE ON PROCEDURE view_mark_in_exam TO 'Student'@'localhost';

## 22
GRANT EXECUTE ON PROCEDURE view_mark_in_all_exams TO 'Student'@'localhost';

## 23
GRANT EXECUTE ON PROCEDURE view_ratio_outcome_in_exam TO 'Student'@'localhost';

## 24
GRANT EXECUTE ON PROCEDURE note_on_exam TO 'Student'@'localhost';
