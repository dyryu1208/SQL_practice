/*
https://leetcode.com/problems/employees-with-missing-information/ 

Table: Employees
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| name        | varchar |
+-------------+---------+
employee_id는 이 테이블의 기본 키입니다.
이 테이블의 각 행은 ID가 employee_id인 직원의 이름을 나타냅니다.


Table: Salaries
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| salary      | int     |
+-------------+---------+
employee_id는 이 테이블의 기본 키입니다.
이 테이블의 각 행은 ID가 employee_id인 직원의 급여를 나타냅니다.


정보가 누락된 모든 직원의 ID를 보고하는 SQL 쿼리를 작성하세요.
직원 정보가 누락된 경우는 다음과 같습니다:
- 직원의 이름이 누락
- 직원의 급여가 누락
employee_id를 기준으로 오름차순으로 정렬된 결과 테이블을 반환합니다.


Example:
Input: 
Employees table:
+-------------+----------+
| employee_id | name     |
+-------------+----------+
| 2           | Crew     |
| 4           | Haven    |
| 5           | Kristian |
+-------------+----------+
Salaries table:
+-------------+--------+
| employee_id | salary |
+-------------+--------+
| 5           | 76071  |
| 1           | 22517  |
| 4           | 63539  |
+-------------+--------+
Output: 
+-------------+
| employee_id |
+-------------+
| 1           |
| 2           |
+-------------+
설명:
직원 1, 2, 4, 5는 이 회사에서 근무하고 있습니다.
직원 1의 이름이 누락되었습니다.
직원 2의 급여가 누락되었습니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE Employees;
CREATE TABLE Employees (employee_id int, name varchar(30));
INSERT INTO
	Employees (employee_id, name)
VALUES
('2', 'Crew')
,('4', 'Haven')
,('5', 'Kristian');
SELECT * FROM Employees;

# [SETTING]
USE PRACTICE;
DROP TABLE Salaries;
CREATE TABLE Salaries (employee_id int, salary int);
INSERT INTO
	Salaries (employee_id, salary)
VALUES
('5', '76071')
,('1', '22517')
,('4', '63539');
SELECT * FROM Salaries;

# MYSQL에서는 FULL OUTER JOIN을 지원하지 않아, 대체 코드를 짜야함
SELECT A.EMPLOYEE_ID
FROM EMPLOYEES A LEFT OUTER JOIN SALARIES B
ON A.EMPLOYEE_ID = B.EMPLOYEE_ID
WHERE B.EMPLOYEE_ID IS NULL

UNION

SELECT A.EMPLOYEE_ID
FROM SALARIES A LEFT OUTER JOIN EMPLOYEES B
ON A.EMPLOYEE_ID = B.EMPLOYEE_ID
WHERE B.EMPLOYEE_ID IS NULL
ORDER BY EMPLOYEE_ID;