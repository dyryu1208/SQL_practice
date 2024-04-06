/*
https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/ 

Table: Employees
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| reports_to  | int      |
| age         | int      |
+-------------+----------+
employee_id는 이 테이블의 기본 키입니다.
이 테이블에는 직원에 대한 정보와 그들이 보고하는 관리자의 ID가 포함되어 있습니다.
일부 직원은 누구에게도 보고하지 않습니다. (reports_to는 null임)


관리자의 ID와 이름, 그들에게 직접 보고하는 직원 수, 보고하는 직원들의 평균 연령(가장 가까운 정수로 반올림)을 SQL 쿼리를 작성하세요.
employee_id별로 정렬된 결과 테이블을 반환합니다.


Example:
Input: 
Employees table:
+-------------+---------+------------+-----+
| employee_id | name    | reports_to | age |
+-------------+---------+------------+-----+
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |
+-------------+---------+------------+-----+
Output: 
+-------------+-------+---------------+-------------+
| employee_id | name  | reports_count | average_age |
+-------------+-------+---------------+-------------+
| 9           | Hercy | 2             | 39          |
+-------------+-------+---------------+-------------+
설명:
Alice와 Bob이라는 2명의 사람은 Hercy에게 직접 보고합니다.
이들의 평균 연령은 (41+36)/2 = 38.5세로, 가장 가까운 정수로 반올림하면 39세입니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE Employees;
CREATE TABLE Employees(employee_id int, name varchar(20), reports_to int, age int);
INSERT INTO
	Employees (employee_id, name, reports_to, age)
VALUES
('9', 'Hercy', 'None', '43')
,('6', 'Alice', '9', '41')
,('4', 'Bob', '9', '36')
,('2', 'Winston', 'None', '37');
SELECT * FROM Employees;


SELECT A.EMPLOYEE_ID, A.NAME, COUNT(B.EMPLOYEE_ID) AS REPORTS_COUNT, ROUND(AVG(B.AGE)) AS AVERAGE_AGE
FROM EMPLOYEES A INNER JOIN EMPLOYEES B
ON A.EMPLOYEE_ID = B.REPORTS_TO
GROUP BY A.EMPLOYEE_ID, A.NAME
ORDER BY A.EMPLOYEE_ID;