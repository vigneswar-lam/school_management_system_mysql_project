create database school_managementDB;
use school_managementDB;
create table students(
student_id int primary key,
first_name varchar(50),
last_name varchar(50)
);
create table subjects(
subject_id int primary key,
subject_name varchar(30)
);
create table exams(
exam_id int primary key,
exam_name varchar(30)
);
create table marks(
mark_id int primary key,
student_id int,
subject_id int,
exam_id int,
score int,
foreign key (student_id) references students(student_id),
foreign key (subject_id) references subjects(subject_id),
foreign key (exam_id) references exams(exam_id)
);


insert into students (student_id, first_name, last_name) VALUES
(101, 'Aarav', 'Sharma'),
(102, 'Riya', 'Patel'),
(103, 'Aditya', 'Verma'),
(104, 'Sneha', 'Joshi'),
(105, 'Arjun', 'Mehta'),
(106, 'Ananya', 'Singh'),
(107, 'Rahul', 'Kumar'),
(108, 'Priya', 'Deshmukh'),
(109, 'Rohan', 'Gupta'),
(110, 'Kavya', 'Shinde'),
(111, 'Vikram', 'Reddy'),
(112, 'Isha', 'Kulkarni'),
(113, 'Karan', 'Malhotra'),
(114, 'Neha', 'Pawar'),
(115, 'Siddharth', 'Chavan'),
(116, 'Pooja', 'Mishra'),
(117, 'Akash', 'Yadav'),
(118, 'Tanvi', 'Jadhav'),
(119, 'Nikhil', 'Thakur'),
(120, 'Simran', 'Bansal');

insert into subjects (subject_id, subject_name) VALUES
(301, 'Mathematics'),
(302, 'Physics'),
(303, 'Chemistry'),
(304, 'Computer Science'),
(305, 'English'),
(306, 'Hindi'),
(307, 'Biology'),
(308, 'History'),
(309, 'Geography'),
(310, 'Economics'),
(311, 'Political Science'),
(312, 'Physical Education'),
(313, 'Computer Applications'),
(314, 'Environmental Science'),
(315, 'Sanskrit'),
(316, 'Art and Craft');

insert into exams (exam_id, exam_name) VALUES
(501, 'Unit Test 1'),
(502, 'Unit Test 2'),
(503, 'Mid Term Examination'),
(504, 'Half Yearly Examination'),
(505, 'Unit Test 3'),
(506, 'Unit Test 4'),
(507, 'Pre Final Examination'),
(508, 'Annual Examination'),
(509, 'Practical Examination');

insert into marks (mark_id, student_id, subject_id, exam_id, score) VALUES
(1001, 101, 301, 501, 85),
(1002, 101, 302, 502, 72),
(1003, 101, 304, 503, 91),
(1004, 101, 305, 504, 68),

(1005, 102, 301, 501, 76),
(1006, 102, 303, 502, 88),
(1007, 102, 307, 505, 94),
(1008, 102, 308, 506, 81),

(1009, 103, 302, 501, 63),
(1010, 103, 304, 503, 87),
(1011, 103, 309, 507, 79),
(1012, 103, 310, 508, 92),

(1013, 104, 301, 502, 95),
(1014, 104, 305, 504, 73),
(1015, 104, 311, 505, 86),
(1016, 104, 312, 509, 90),

(1017, 105, 303, 501, 58),
(1018, 105, 304, 502, 82),
(1019, 105, 306, 506, 77),
(1020, 105, 313, 508, 89),

(1021, 106, 307, 501, 96),
(1022, 106, 308, 503, 84),
(1023, 106, 309, 505, 71),
(1024, 106, 314, 507, 93),

(1025, 107, 301, 501, 67),
(1026, 107, 302, 504, 74),
(1027, 107, 304, 506, 88),
(1028, 107, 315, 509, 80),

(1029, 108, 303, 502, 91),
(1030, 108, 305, 503, 85),
(1031, 108, 310, 506, 78),
(1032, 108, 316, 508, 95),

(1033, 109, 301, 503, 55),
(1034, 109, 306, 505, 69),
(1035, 109, 311, 507, 83),
(1036, 109, 313, 509, 87),

(1037, 110, 302, 501, 98),
(1038, 110, 304, 504, 90),
(1039, 110, 312, 506, 76),
(1040, 110, 314, 508, 89);

/*Query 1
Retrieve all students: List the first name and last name of every student.*/

select first_name,last_name from students;

/*Query 2
Filter by Score: Find all entries in the Marks table where the score is greater than 80.*/

select * from marks where score > 80;


ALTER TABLE exams
ADD exam_date DATE;

UPDATE exams SET exam_date = '2026-06-10' WHERE exam_id = 501;
UPDATE exams SET exam_date = '2026-06-24' WHERE exam_id = 502;
UPDATE exams SET exam_date = '2026-07-15' WHERE exam_id = 503;
UPDATE exams SET exam_date = '2026-07-30' WHERE exam_id = 504;
UPDATE exams SET exam_date = '2026-08-12' WHERE exam_id = 505;
UPDATE exams SET exam_date = '2026-08-25' WHERE exam_id = 506;
UPDATE exams SET exam_date = '2026-09-05' WHERE exam_id = 507;
UPDATE exams SET exam_date = '2026-09-12' WHERE exam_id = 508;
UPDATE exams SET exam_date = '2026-09-17' WHERE exam_id = 509;

/*Query 3
Sort Data: List all exams sorted by their date, starting with the most recent.*/

select * from exams order by exam_date desc;

/*Query 4
Student Marks: List the First Name, Subject Name, and Score for every mark recorded.*/

SELECT s.first_name, sub.subject_name, m.score
FROM students s
JOIN marks m
ON s.student_id = m.student_id
JOIN subjects sub
ON m.subject_id = sub.subject_id;

/*Query 5
Subject Averages: Calculate the average score for each subject. Display the Subject Name and the Average Score.*/

SELECT s.subject_name, AVG(m.score) AS average_score
FROM subjects s
JOIN marks m
ON s.subject_id = m.subject_id
GROUP BY s.subject_id, s.subject_name;

/*Query 6
Count Exams: How many marks have been recorded specifically for "Aarav Sharma"?*/

SELECT COUNT(*) AS total_marks
FROM students s
JOIN marks m
ON s.student_id = m.student_id
WHERE s.first_name = 'Aarav'
AND s.last_name = 'Sharma';

/*Query 7
Top Performer: Find the student (First Name, Last Name) who has the highest single score in any exam*/

SELECT s.first_name, s.last_name, m.score
FROM students s
JOIN marks m
ON s.student_id = m.student_id
WHERE m.score = (SELECT MAX(score) FROM marks);

/*Query 8
Scores by Exam: Display the Exam Name and the total sum of scores for that exam, but only for exams where the total sum is greater than 250.*/

SELECT e.exam_name, SUM(m.score) AS total_score
FROM exams e
JOIN marks m
ON e.exam_id = m.exam_id
GROUP BY e.exam_id, e.exam_name
HAVING SUM(m.score) > 250;

/*Query 9
Pass/Fail Label: Create a report showing the Student Name, Subject, Score, and a status column that says "Pass" if the score is 70 or above, and "Fail" if below.*/

SELECT 
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    sub.subject_name,
    m.score,
    CASE
        WHEN m.score >= 70 THEN 'Pass'
        ELSE 'Fail'
    END AS status
FROM students s
JOIN marks m
ON s.student_id = m.student_id
JOIN subjects sub
ON m.subject_id = sub.subject_id;



