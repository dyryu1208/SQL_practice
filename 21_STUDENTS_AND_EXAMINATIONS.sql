/*
https://leetcode.com/problems/students-and-examinations/ 

Table: Students
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+
student_id는 이 테이블의 기본 키입니다.
이 테이블의 각 행에는 학교에 다니는 학생의 ID와 이름이 포함되어 있습니다.


Table: Subjects
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| subject_name | varchar |
+--------------+---------+
subject_name은 이 테이블의 기본 키입니다.
이 테이블의 각 행에는 학교의 과목 이름이 포함되어 있습니다.


Table: Examinations
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| subject_name | varchar |
+--------------+---------+
이 테이블에는 기본 키가 없습니다. 중복된 내용이 포함되어 있을 수 있습니다.
학생 테이블의 각 학생은 과목 테이블의 모든 강좌를 수강합니다.
이 테이블의 각 행은 ID가 student_id인 학생이 subject_name의 시험에 참석했음을 나타냅니다.


각 학생이 각 시험에 참석한 횟수를 알아보는 SQL 쿼리를 작성하세요.
student_id와 subject_name으로 정렬된 결과 테이블을 반환합니다.


Example:
Input: 
Students table:
+------------+--------------+
| student_id | student_name |
+------------+--------------+
| 1          | Alice        |
| 2          | Bob          |
| 13         | John         |
| 6          | Alex         |
+------------+--------------+
Subjects table:
+--------------+
| subject_name |
+--------------+
| Math         |
| Physics      |
| Programming  |
+--------------+
Examinations table:
+------------+--------------+
| student_id | subject_name |
+------------+--------------+
| 1          | Math         |
| 1          | Physics      |
| 1          | Programming  |
| 2          | Programming  |
| 1          | Physics      |
| 1          | Math         |
| 13         | Math         |
| 13         | Programming  |
| 13         | Physics      |
| 2          | Math         |
| 1          | Math         |
+------------+--------------+
Output: 
+------------+--------------+--------------+----------------+
| student_id | student_name | subject_name | attended_exams |
+------------+--------------+--------------+----------------+
| 1          | Alice        | Math         | 3              |
| 1          | Alice        | Physics      | 2              |
| 1          | Alice        | Programming  | 1              |
| 2          | Bob          | Math         | 1              |
| 2          | Bob          | Physics      | 0              |
| 2          | Bob          | Programming  | 1              |
| 6          | Alex         | Math         | 0              |
| 6          | Alex         | Physics      | 0              |
| 6          | Alex         | Programming  | 0              |
| 13         | John         | Math         | 1              |
| 13         | John         | Physics      | 1              |
| 13         | John         | Programming  | 1              |
+------------+--------------+--------------+----------------+
설명:
결과 테이블에는 모든 학생과 모든 과목이 포함되어야 합니다.
Alice는 수학 시험에 3번, 물리학 시험에 2번, 프로그래밍 시험에 1번 참석했습니다.
Bob은 수학 시험에 1번, 프로그래밍 시험에 1번 참석했지만 물리학 시험에는 참석하지 않았습니다.
Alex는 어떤 시험에도 참석하지 않았습니다.
John은 수학 시험에 1번, 물리학 시험에 1번, 프로그래밍 시험에 1번 참석했습니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE Students;
CREATE TABLE Students (student_id int, student_name varchar(20));
INSERT INTO
	Students (student_id, student_name)
VALUES
('1', 'Alice')
,('2', 'Bob')
,('13', 'John')
,('6', 'Alex');
SELECT * FROM Students;

# [SETTING]
USE PRACTICE;
DROP TABLE Subjects;
CREATE TABLE Subjects (subject_name varchar(20));
INSERT INTO
	Subjects (subject_name)
VALUES
('Math')
,('Physics')
,('Programming');
SELECT * FROM Subjects;

# [SETTING]
USE PRACTICE;
DROP TABLE Examinations;
CREATE TABLE Examinations (student_id int, subject_name varchar(20));
INSERT INTO
	Examinations (student_id, subject_name)
VALUES
('1', 'Math')
,('1', 'Physics')
,('1', 'Programming')
,('2', 'Programming')
,('1', 'Physics')
,('1', 'Math')
,('13', 'Math')
,('13', 'Programming')
,('13', 'Physics')
,('2', 'Math')
,('1', 'Math');
SELECT * FROM Examinations;

SELECT A.STUDENT_ID, A.STUDENT_NAME, B.SUBJECT_NAME, 
		(
        SELECT COUNT(*)
        FROM EXAMINATIONS C
        WHERE A.STUDENT_ID = C.STUDENT_ID AND B.SUBJECT_NAME = C.SUBJECT_NAME
        ) AS ATTENDED_EXAMS
FROM STUDENTS A CROSS JOIN SUBJECTS B
ORDER BY STUDENT_ID, SUBJECT_NAME;