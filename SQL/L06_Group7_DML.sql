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

INSERT INTO LECTURER_IN_CHARGE
VALUES ('GV444444', 'Phụ', 'IM3001');
INSERT INTO LECTURER_IN_CHARGE
VALUES ('GV123456', 'Chính', 'IM3001');
INSERT INTO LECTURER_IN_CHARGE
VALUES ('GV222222', 'Chính', 'CO2017');
INSERT INTO LECTURER_IN_CHARGE
VALUES ('GV987654', 'Phụ', 'CO2017');

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
INSERT INTO HAS_FILE
VALUES ('file:///D:/Downloads/DBS_Ass1_EER%20diagram.png', 'D1');

INSERT INTO QUESTION 
VALUES ('001CO2017', 'Trong quản lý hệ thống tập tin, phát biểu nào sau đây là không đúng với việc dùng danh sách liên kết để quản lý khối chưa sử dụng (free blocks)?', 'Dễ', 4, 'BCD', NULL, 'GV222222', '2019-02-20 12:00', 'L.O.1', 'CO2017');
INSERT INTO QUESTION
VALUES ('002CO2017', 'Tại phút 55, hình nào sau đây thể hiện bộ nhớ máy tính? Chú ý: bộ nhớ đang được sử dụng sẽ có màu xám.', 'Trung bình', 4, 'A', NULL, 'GV222222', '2019-02-20 23:00', 'L.O.1.2', 'CO2017');
INSERT INTO QUESTION
VALUES ('003CO2017', 'Một job thứ 6 đến ở phút 55, kết thúc tại phút 70 và yêu cầu 25KB bộ nhớ. Hệ điều hành có vùng bộ nhớ rảnh để cấp phát cho job này không?', 'Trung bình', 4, 'D', NULL, 'GV987654', '2019-02-20 23:00', 'L.O.1.2', 'CO2017');

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

UPDATE CHOICE
SET Described_Content_ID = 'D1'
WHERE Question_ID = '001CO2017' AND Choice_ID = 'C';

INSERT INTO COMMON_DESCRIPTION
VALUES ('001CO2017', 'Giả thiết bộ nhớ máy tính chạy những job trên chỉ có kích thước 100KB và được quản lý theo dạng cấp phát liên tục (contiguous memory allocation) với phân hoạch kích thước thay đổi (variable-partition). Bộ nhớ chưa sử dụng sẽ được cấp phát từ thấp đến cao theo cơ chế phù hợp đầu tiên (first-fit strategy).', NULL);

UPDATE COMMON_DESCRIPTION
SET Described_Content_ID = 'D1'
WHERE Description_ID = '001CO2017';

INSERT INTO EXAM_TIME
VALUES ('CO2017', '2020-03-15');

INSERT INTO EXAM
VALUES ('CO2017', '2020-03-15', '2001', NULL, 'GV222222', '2020-03-12', 'GV333333', '2020-03-12');

INSERT INTO USE_DES
VALUES ('001CO2017', '002CO2017');
INSERT INTO USE_DES
VALUES ('001CO2017', '003CO2017');

INSERT INTO IN_EXAM
VALUES ('001CO2017', 'CO2017', '2020-03-15', '2001', 2, 0, 'BCD');
INSERT INTO IN_EXAM
VALUES ('002CO2017', 'CO2017', '2020-03-15', '2001', 1, 1, 'B');

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

INSERT INTO ANSWER
VALUES ('SV1810812', 'CO2017', '2020-03-15', '2001', 1, NULL, NULL);

INSERT INTO ANSWER_CONTENT
VALUES ('SV1810812', 'CO2017', '2020-03-15', '2001', 1, 2, 'ABC', 'Không chính xác');
INSERT INTO ANSWER_CONTENT
VALUES ('SV1810812', 'CO2017', '2020-03-15', '2001', 1, 1, 'B', 'Chính xác');

