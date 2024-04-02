/*
https://leetcode.com/problems/project-employees-i/ 

Table: Project
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+
(project_id, employee_id)는 이 테이블의 기본 키입니다.
employee_id는 Employee 테이블의 외래 키입니다.
이 테이블의 각 행은 employee_id를 가진 직원이 project_id를 가진 프로젝트에서 작업 중임을 나타냅니다.


Table: Employee
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+
employee_id는 이 테이블의 기본 키입니다.
experience_years가 NULL이 아니라는 것이 보장됩니다.
이 테이블의 각 행에는 직원 한 명에 대한 정보가 포함되어 있습니다.


각 프로젝트에 대한 모든 직원의 평균 경력 연수를 두 자리 숫자로 반올림하여 보고하는 SQL 쿼리를 작성합니다.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+
Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+
Output: 
+-------------+---------------+
| project_id  | average_years |
+-------------+---------------+
| 1           | 2.00          |
| 2           | 2.50          |
+-------------+---------------+
Explanation:
첫 번째 프로젝트의 평균 경험 기간은 (3 + 2 + 1) / 3 = 2.00입니다.
두 번째 프로젝트의 경우 (3 + 2) / 2 = 2.50입니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE PROJECT;
CREATE TABLE PROJECT (PROJECT_ID INT, EMPLOYEE_ID INT);
INSERT INTO
	PROJECT (PROJECT_ID, EMPLOYEE_ID)
VALUES
	('1', '1')
	,('1', '2')
	,('1', '3')
	,('2', '1')
	,('2', '4');
SELECT * FROM PROJECT;	    

# [SETTING]
USE PRACTICE;
DROP TABLE EMPLOYEE;
CREATE TABLE EMPLOYEE (EMPLOYEE_ID INT, NAME VARCHAR(255), EXPERIENCE_YEARS INT);
INSERT INTO
	EMPLOYEE (EMPLOYEE_ID, NAME, EXPERIENCE_YEARS)
VALUES
	('1', 'KHALED', '3')
	,('2', 'ALI', '2')
	,('3', 'JOHN', '1')
	,('4', 'DOE', '2');
SELECT * FROM EMPLOYEE;	   

SELECT P.PROJECT_ID, ROUND(AVG(E.EXPERIENCE_YEARS), 2) AS AVERAGE_YEARS
FROM PROJECT P INNER JOIN EMPLOYEE E
ON P.EMPLOYEE_ID = E.EMPLOYEE_ID
GROUP BY P.PROJECT_ID;