/*
https://leetcode.com/problems/employee-bonus/ 

Table: Employee
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| empId       | int     |
| name    A    | varchar |
| supervisor  | int     |
| salary      | int     |
+-------------+---------+
empId는 이 테이블의 기본 키 열입니다.
이 테이블의 각 행에는 직원의 이름과 ID, 급여 및 관리자의 ID가 표시됩니다.


 Table: Bonus
 +-------------+------+
| Column Name | Type |
+-------------+------+
| empId       | int  |
| bonus       | int  |
+-------------+------+
empId는 이 테이블의 기본 키 열입니다.
empId는 Employee 테이블의 empId에 대한 외래 키입니다.
이 테이블의 각 행에는 직원의 ID와 해당 보너스가 포함되어 있습니다.


보너스가 1000보다 작은 각 직원의 이름과 보너스 금액을 보고하는 SQL 쿼리를 작성하세요.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Employee table:
+-------+--------+------------+--------+
| empId | name   | supervisor | salary |
+-------+--------+------------+--------+
| 3     | Brad   | null       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |
+-------+--------+------------+--------+
Bonus table:
+-------+-------+
| empId | bonus |
+-------+-------+
| 2     | 500   |
| 4     | 2000  |
+-------+-------+
Output: 
+------+-------+
| name | bonus |
+------+-------+
| Brad | null  |
| John | null  |
| Dan  | 500   |
+------+-------+
*/

# [SETTING]
USE PRACTICE;
DROP TABLE EMPLOYEE;
CREATE TABLE EMPLOYEE (EMPID INT, NAME VARCHAR(255), SUPERVISOR INT, SALARY INT);
INSERT INTO
	EMPLOYEE (EMPID, NAME, SUPERVISOR, SALARY)
VALUES
	('1', 'JOHN', '3', '1000')
	,('2', 'DAN', '3', '2000')
	,('3', 'BRAD', NULL, '4000')
	,('4', 'THOMAS', '3', '4000');
SELECT * FROM EMPLOYEE;	  
     
# [SETTING]
USE PRACTICE;
DROP TABLE BONUS;
CREATE TABLE BONUS (EMPID INT, BONUS INT);
INSERT INTO
	BONUS (EMPID, BONUS)
VALUES
	('2', '500')
	,('4', '2000');
SELECT * FROM BONUS;	


# [MYSQL1]
SELECT E.NAME, B.BONUS
FROM EMPLOYEE E LEFT OUTER JOIN BONUS B
ON E.EMPID = B.EMPID
WHERE B.BONUS < 1000 OR B.BONUS IS NULL;

# [MYSQL2]
SELECT E.NAME, B.BONUS
FROM (SELECT EMPID, NAME
	  FROM EMPLOYEE
	  WHERE EMPID NOT IN (
						  SELECT EMPID
                          FROM BONUS
                          WHERE BONUS >= 1000
                          )
	 ) AS E
LEFT OUTER JOIN BONUS AS B
ON E.EMPID = B.EMPID;