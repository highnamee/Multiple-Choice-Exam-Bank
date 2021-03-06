USE MCQS_EXAMS_BANK;

INSERT INTO LECTURER
VALUES ('GV123456', 'Nguyễn Văn', 'A', NULL, 'Thạc sĩ', NULL, NULL, NULL);
INSERT INTO LECTURER
VALUES ('GV111111', 'Trần Ngọc', 'B', NULL, 'Tiến sĩ', NULL, NULL, NULL);
INSERT INTO LECTURER
VALUES ('GV987654', 'Lê Dương Ánh', 'C', NULL, 'Cử nhân', NULL, NULL, NULL);
INSERT INTO LECTURER
VALUES ('GV222222', 'Nguyễn Ngọc Minh', 'T', NULL, 'Thạc sĩ', NULL, NULL, NULL);
INSERT INTO LECTURER
VALUES ('GV333333', 'Phạm Thị', 'H', NULL, 'Tiến sĩ', NULL, NULL, NULL);
INSERT INTO LECTURER
VALUES ('GV444444', 'Mai Đình', 'P', NULL, 'Cử nhân', NULL, NULL, NULL);

INSERT INTO MANAGEMENT_LECTURER
VALUES ('GV111111');
INSERT INTO MANAGEMENT_LECTURER
VALUES ('GV222222');

UPDATE MANAGEMENT_LECTURER
SET Lecturer_ID = 'GV333333'
WHERE Lecturer_ID = 'GV222222';

INSERT INTO SUBJECT 
VALUES ('IM3001', 'Quản trị kinh doanh cho kỹ sư', 'GV111111');
INSERT INTO SUBJECT 
VALUES ('CO2017', 'Hệ điều hành', 'GV333333');
INSERT INTO SUBJECT 
VALUES ('CO2003', 'Cấu trúc dữ liệu & giải thuật', 'GV111111');

INSERT INTO LECTURER_IN_CHARGE
VALUES ('GV444444');
INSERT INTO LECTURER_IN_CHARGE
VALUES ('GV123456');
INSERT INTO LECTURER_IN_CHARGE
VALUES ('GV222222');
INSERT INTO LECTURER_IN_CHARGE
VALUES ('GV987654');

INSERT INTO LEC_INCHARGE_SUB
VALUES 	('GV444444', 'IM3001', 'Phụ'),
	('GV123456', 'IM3001', 'Chính'),
        ('GV222222', 'CO2017', 'Chính'),
        ('GV987654', 'CO2017', 'Phụ');

INSERT INTO OUTCOME 
VALUES ('CO2017', 'L.O.1', 'Mô tả cách ứng dụng các kiến thức nền tảng của máy tính và toán học trong hệ điều hành', NULL, NULL);
INSERT INTO OUTCOME 
VALUES ('CO2017', 'L.O.1.1', 'Định nghĩa được các chức năng và cấu trúc của một hệ điều hành hiện đại theo nhu cầu cụ thể nào đó', 'CO2017', 'L.O.1');
INSERT INTO OUTCOME 
VALUES ('CO2017', 'L.O.1.2', 'Mô tả các khái niệm cơ bản của hệ điều hành cùng các đặc điểm hữu ích nhằm hiện thực hệ thống đồng thời và mô tả tiện ích của mỗi đặc điểm.', 'CO2017', 'L.O.1');
INSERT INTO OUTCOME 
VALUES ('CO2017', 'L.O.2', 'Mối quan hệ giữa hiệu suất và các hạn chế về tài nguyên và công nghệ trong một thiết kế của một hệ điều hành.', NULL, NULL);
INSERT INTO OUTCOME
VALUES ('IM3001', 'L.O.1', 'Nắm được các khái niệm, các hoạt động chức năng cơ bản của quản lý.', NULL, NULL);
INSERT INTO OUTCOME
VALUES ('IM3001', 'L.O.2', 'Nhận diện được tầm quan trọng của kiến thức, kỹ năng quản lý đối với người kỹ sư.', NULL, NULL);
INSERT INTO OUTCOME
VALUES ('IM3001', 'L.O.3', 'Có thái độ tích cực trong làm việc nhóm.', NULL, NULL);

INSERT INTO DESCRIBED_CONTENT
VALUES ('D1');
INSERT INTO DESCRIPTION_FILE 
VALUES ('file:///D:/Downloads/DBS_Ass1_EER%20diagram.png');
INSERT INTO DESCRIPTION_FILE 
VALUES ('process_thread.jpeg');
INSERT INTO DESCRIPTION_FILE 
VALUES ('linux-filesystem.png');
INSERT INTO HAS_FILE
VALUES ('file:///D:/Downloads/DBS_Ass1_EER%20diagram.png', 'D1');
UPDATE HAS_FILE
SET File_Path = 'linux-filesystem.png'
WHERE Described_Content_ID = 'D1';


INSERT INTO QUESTION 
VALUES ('001CO2017', 'Trong quản lý hệ thống tập tin, phát biểu nào sau đây là không đúng với việc dùng danh sách liên kết để quản lý khối chưa sử dụng (free blocks)?', 'Dễ', 4, 'BCD', NULL, 'GV222222', '2019-02-20 12:00', 'L.O.1', 'CO2017');
INSERT INTO QUESTION
VALUES ('002CO2017', 'Tại phút 55, hình nào sau đây thể hiện bộ nhớ máy tính? Chú ý: bộ nhớ đang được sử dụng sẽ có màu xám.', 'Trung bình', 4, 'A', NULL, 'GV222222', '2019-02-20 23:00', 'L.O.1.2', 'CO2017');
INSERT INTO QUESTION
VALUES ('003CO2017', 'Một job thứ 6 đến ở phút 55, kết thúc tại phút 70 và yêu cầu 25KB bộ nhớ. Hệ điều hành có vùng bộ nhớ rảnh để cấp phát cho job này không?', 'Trung bình', 4, 'D', NULL, 'GV987654', '2019-02-20 23:00', 'L.O.1.2', 'CO2017');
INSERT INTO QUESTION
VALUES ('004CO2017', 'Trong các giải pháp sau giải pháp nào vi phạm điều kiện “không có hai tiến trình cùng trong miền tranh chấp”?', 'Dễ', 4, 'C', NULL, 'GV987654', '2019-02-21 00:00', 'L.O.1.1', 'CO2017');
INSERT INTO QUESTION
VALUES ('005CO2017', 'Trong chiến lược điều phối nào, tiến trình vào trước được cấp CPU trước?', 'Trung bình', 4, 'A', NULL, 'GV987654', '2019-02-21 00:00', 'L.O.1.1', 'CO2017');
INSERT INTO QUESTION
VALUES ('006CO2017', 'Đây là câu hỏi thứ 6 trong môn CO2017', 'Khó', 4, 'B', NULL, 'GV222222', '2019-02-21 05:00', 'L.O.1', 'CO2017');
INSERT INTO QUESTION
VALUES ('007CO2017', 'Đây là câu hỏi thứ 7 trong môn CO2017', 'Dễ', 4, 'C', NULL, 'GV222222', '2019-02-21 05:00', 'L.O.1.2', 'CO2017');
INSERT INTO QUESTION
VALUES ('008CO2017', 'Đây là câu hỏi thứ 8 trong môn CO2017', 'Khó', 4, 'D', NULL, 'GV987654', '2019-02-21 05:00', 'L.O.2', 'CO2017');
INSERT INTO QUESTION
VALUES ('001IM3001', 'Đây là câu hỏi thứ 1 trong môn IM3001', 'Dễ', 4, 'A', NULL, 'GV444444', '2019-02-21 05:00', 'L.O.1', 'IM3001');
INSERT INTO QUESTION
VALUES ('002IM3001', 'Đây là câu hỏi thứ 2 trong môn IM3001', 'Trung bình', 4, 'B', NULL, 'GV444444', '2019-02-21 05:04', 'L.O.2', 'IM3001');
INSERT INTO QUESTION
VALUES ('003IM3001', 'Đây là câu hỏi thứ 3 trong môn IM3001', 'Khó', 4, 'C', NULL, 'GV123456', '2019-02-21 05:04', 'L.O.2', 'IM3001');
INSERT INTO QUESTION
VALUES ('004IM3001', 'Đây là câu hỏi thứ 4 trong môn IM3001', 'Trung bình', 4, 'D', NULL, 'GV123456', '2019-02-21 05:13', 'L.O.3', 'IM3001');
INSERT INTO QUESTION
VALUES ('005IM3001', 'Đây là câu hỏi thứ 5 trong môn IM3001', 'Khó', 4, 'C', NULL, 'GV444444', '2019-02-21 05:13', 'L.O.1', 'IM3001');


UPDATE QUESTION
SET Correct_Choice_ID = 'ABD', Described_Content_ID = 'D1'
WHERE Question_ID = '001CO2017';

INSERT INTO CHOICE
VALUES ('001CO2017', 'A', 'Tốn nhiều thời gian để tìm một khối chưa dùng để cấp phát.', NULL);
INSERT INTO CHOICE
VALUES ('001CO2017', 'B', 'Không tốn quá nhiều bộ nhớ máy tính để lưu danh sách khối chưa sử dụng.', NULL);
INSERT INTO CHOICE
VALUES ('001CO2017', 'C', 'Nếu một khối dữ liệu hỏng thì sẽ khó khăn tìm ra những khối còn lại.', NULL);
INSERT INTO CHOICE
VALUES ('001CO2017', 'D', 'Không cần tạo một danh sách khối chưa sử dụng trong bộ nhớ.', NULL);
INSERT INTO CHOICE
VALUES ('002CO2017', 'A', '4-5-2', NULL);
INSERT INTO CHOICE
VALUES ('002CO2017', 'B', '1-2-4', NULL);
INSERT INTO CHOICE
VALUES ('002CO2017', 'C', '1-2-3', NULL);
INSERT INTO CHOICE
VALUES ('002CO2017', 'D', '2-4-5', NULL);
INSERT INTO CHOICE
VALUES ('003CO2017', 'A', 'Có', NULL);
INSERT INTO CHOICE
VALUES ('003CO2017', 'B', 'Không. Tổng bộ nhớ rảnh không đủ.', NULL);
INSERT INTO CHOICE
VALUES ('003CO2017', 'C', 'Không', NULL);
INSERT INTO CHOICE
VALUES ('003CO2017', 'D', 'Không. Có những khoảng trống (hole) rảnh nhưng kích thước của chúng < 25KB.', NULL);
INSERT INTO CHOICE
VALUES ('004CO2017', 'A', 'Chỉ thị TSL', NULL);
INSERT INTO CHOICE
VALUES ('004CO2017', 'B', 'Peterson', NULL);
INSERT INTO CHOICE
VALUES ('004CO2017', 'C', 'Sử dụng biến cờ hiệu', NULL);
INSERT INTO CHOICE
VALUES ('004CO2017', 'D', 'Kiểm tra luân phiên', NULL);
INSERT INTO CHOICE
VALUES ('005CO2017', 'A', 'FIFO', NULL);
INSERT INTO CHOICE
VALUES ('005CO2017', 'B', 'SJF', NULL);
INSERT INTO CHOICE
VALUES ('005CO2017', 'C', 'Round robin', NULL);
INSERT INTO CHOICE
VALUES ('005CO2017', 'D', 'Priority', NULL);
INSERT INTO CHOICE
VALUES ('006CO2017', 'A', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('006CO2017', 'B', 'Chọn cái này nè', NULL);
INSERT INTO CHOICE
VALUES ('006CO2017', 'C', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('006CO2017', 'D', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('007CO2017', 'A', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('007CO2017', 'B', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('007CO2017', 'C', 'Chọn cái này nè', NULL);
INSERT INTO CHOICE
VALUES ('007CO2017', 'D', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('008CO2017', 'A', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('008CO2017', 'B', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('008CO2017', 'C', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('008CO2017', 'D', 'Chọn thì chọn không chọn thì chọn', NULL);
INSERT INTO CHOICE
VALUES ('001IM3001', 'A', 'Chắc kèo câu này đúng', NULL);
INSERT INTO CHOICE
VALUES ('001IM3001', 'B', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('001IM3001', 'C', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('001IM3001', 'D', 'Đừng chọn dùm cám ơn', NULL);
INSERT INTO CHOICE
VALUES ('002IM3001', 'A', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('002IM3001', 'B', 'Chọn cái này dùm cám ơn', NULL);
INSERT INTO CHOICE
VALUES ('002IM3001', 'C', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('002IM3001', 'D', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('003IM3001', 'A', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('003IM3001', 'B', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('003IM3001', 'C', 'Là người sáng suốt sẽ chọn câu này', NULL);
INSERT INTO CHOICE
VALUES ('003IM3001', 'D', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('004IM3001', 'A', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('004IM3001', 'B', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('004IM3001', 'C', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('004IM3001', 'D', 'Pick me pick me pick me up', NULL);
INSERT INTO CHOICE
VALUES ('005IM3001', 'A', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('005IM3001', 'B', 'Đừng chọn', NULL);
INSERT INTO CHOICE
VALUES ('005IM3001', 'C', '"Câu nào không biết cứ lụi C" - Một thầy giáo nào đó cho biết', NULL);
INSERT INTO CHOICE
VALUES ('005IM3001', 'D', 'Đừng chọn', NULL);

UPDATE CHOICE
SET Described_Content_ID = 'D1'
WHERE Question_ID = '001CO2017' AND Choice_ID = 'C';

INSERT INTO COMMON_DESCRIPTION
VALUES ('001CO2017', 'Giả thiết bộ nhớ máy tính chạy những job trên chỉ có kích thước 100KB và được quản lý theo dạng cấp phát liên tục (contiguous memory allocation) với phân hoạch kích thước thay đổi (variable-partition). Bộ nhớ chưa sử dụng sẽ được cấp phát từ thấp đến cao theo cơ chế phù hợp đầu tiên (first-fit strategy).', NULL);

UPDATE COMMON_DESCRIPTION
SET Described_Content_ID = 'D1'
WHERE Description_ID = '001CO2017';
UPDATE COMMON_DESCRIPTION
SET Described_Content_ID = 'D1'
WHERE Description_ID = '002CO2017';

INSERT INTO EXAM_TIME
VALUES ('CO2017', '2020-03-15', '192', NULL);
UPDATE EXAM_TIME
SET Content = 'Kiểm tra cuối kỳ Hệ điều hành'
WHERE Subject_Code = 'CO2017' and Exam_Date = '2020-03-15';
INSERT INTO EXAM_TIME
VALUES ('CO2003', '2021-03-15', '202', "Kiểm tra thực hành DSA");
INSERT INTO EXAM_TIME
VALUES ('CO2017', '2021-04-15', '202', "Kiểm tra Hệ điều hành mở rộng");
INSERT INTO EXAM_TIME
VALUES ('CO2003', '2019-03-15', '192', "Kiểm tra lý thuyết DSA");

INSERT INTO EXAM
VALUES ('CO2017', '2020-03-15', '2001', NULL, 'GV222222', '2020-03-12', 'GV333333', '2020-03-12');
INSERT INTO EXAM
VALUES ('CO2003', '2021-03-15', '2001', NULL, 'GV222222', '2021-03-09', 'GV333333', '2021-03-10');
INSERT INTO EXAM
VALUES ('CO2017', '2021-04-15', '2001', NULL, 'GV222222', '2021-03-09', 'GV333333', '2021-03-10');
INSERT INTO EXAM
VALUES ('CO2003', '2019-03-15', '2001', NULL, 'GV222222', '2018-03-09', 'GV333333', '2018-03-10');

INSERT INTO USE_DES
VALUES ('001CO2017', '002CO2017');
INSERT INTO USE_DES
VALUES ('001CO2017', '003CO2017');

INSERT INTO IN_EXAM
VALUES ('001CO2017', 'CO2017', '2020-03-15', '2001', 2, 0, 'BCD');
INSERT INTO IN_EXAM
VALUES ('002CO2017', 'CO2017', '2020-03-15', '2001', 1, 1, 'B');
INSERT INTO IN_EXAM
VALUES ('001CO2017', 'CO2003', '2021-03-15', '2001', 2, 0, 'BCD');
INSERT INTO IN_EXAM
VALUES ('002CO2017', 'CO2003', '2021-03-15', '2001', 1, 1, 'B');
INSERT INTO IN_EXAM
VALUES ('001CO2017', 'CO2017', '2021-04-15', '2001', 2, 0, 'BCD');
INSERT INTO IN_EXAM
VALUES ('002CO2017', 'CO2017', '2021-04-15', '2001', 1, 1, 'B');
INSERT INTO IN_EXAM
VALUES ('003CO2017', 'CO2017', '2021-04-15', '2001', 4, 0, 'A');
INSERT INTO IN_EXAM
VALUES ('004CO2017', 'CO2017', '2021-04-15', '2001', 3, 1, 'D');
INSERT INTO IN_EXAM
VALUES ('002CO2017', 'CO2003', '2019-03-15', '2001', 1, 1, 'B');

INSERT INTO CHOICE_MAPPING
VALUES ('001CO2017', 'CO2017', '2020-03-15', '2001', 'A', 'B'),
	   ('001CO2017', 'CO2017', '2020-03-15', '2001', 'B', 'C'),
	   ('001CO2017', 'CO2017', '2020-03-15', '2001', 'C', 'D'),
	   ('001CO2017', 'CO2017', '2020-03-15', '2001', 'D', 'A');

INSERT INTO STUDENT 
VALUES ('SV181012', 'Nguyễn Ngọc Lan', 'Anh', 'CSE', NULL, NULL, NULL);

UPDATE STUDENT
SET Student_ID = 'SV1810812'
WHERE Student_ID = 'SV181012';

INSERT INTO LEARN_SUB 
VALUES	('SV1810812', 'CO2017', '192');
INSERT INTO LEARN_SUB 
VALUES	('SV1810812', 'CO2003', '202');
INSERT INTO LEARN_SUB 
VALUES	('SV1810812', 'CO2017', '202');
INSERT INTO LEARN_SUB 
VALUES	('SV1810812', 'CO2003', '192');

INSERT INTO ANSWER
VALUES ('SV1810812', 'CO2017', '2020-03-15', '2001', 1, NULL, NULL);

INSERT INTO ANSWER_CONTENT
VALUES ('SV1810812', 'CO2017', '2020-03-15', '2001', 1, 2, 'ABC', 'Không chính xác');
INSERT INTO ANSWER_CONTENT
VALUES ('SV1810812', 'CO2017', '2020-03-15', '2001', 1, 1, 'B', 'Chính xác');

