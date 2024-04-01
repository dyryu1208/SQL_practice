/*
https://leetcode.com/problems/classes-more-than-5-students/ 

Table: Courses
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(학생, 수업)은 이 테이블의 기본 키 열입니다.
이 표의 각 행에는 학생의 이름과 학생이 등록한 수업이 표시됩니다.

학생이 5명 이상인 모든 수업을 보고하는 SQL 쿼리를 작성하세요.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Courses table:
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+
Output: 
+---------+
| class   |
+---------+
| Math    |
+---------+
설명:
- 수학에는 6명의 학생이 있으므로 포함합니다.
- 영어는 1명이므로 포함하지 않습니다.
- 생물학은 1명이므로 포함하지 않습니다.
- 컴퓨터에는 학생이 1명 있으므로 포함하지 않습니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE COURSES;
CREATE TABLE COURSES (STUDENT VARCHAR(255), CLASS VARCHAR(255));
INSERT INTO
	COURSES (STUDENT, CLASS)
VALUES
	('A', 'MATH')
	,('B', 'ENGLISH')
	,('C', 'MATH')
	,('D', 'BIOLOGY')
	,('E', 'MATH')
	,('F', 'COMPUTER')
	,('G', 'MATH')
	,('H', 'MATH')
	,('I', 'MATH');
SELECT * FROM COURSES;

SELECT CLASS, COUNT(STUDENT) AS NUMBER_OF_STUDENTS
FROM COURSES
GROUP BY CLASS
HAVING COUNT(STUDENT) >= 5;