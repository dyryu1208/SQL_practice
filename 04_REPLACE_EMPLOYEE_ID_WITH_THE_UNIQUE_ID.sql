/*
https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/

Table: Employees
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
id는 이 테이블의 기본 키입니다.
이 테이블의 각 행에는 회사 직원의 ID와 이름이 포함되어 있습니다.


Table: EmployeeUNI
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| unique_id     | int     |
+---------------+---------+
(id, Unique_id)는 이 테이블의 기본 키입니다.
이 테이블의 각 행에는 회사 직원의 ID와 해당 고유 ID가 포함되어 있습니다.
 
각 사용자의 고유 ID를 표시하는 SQL 쿼리를 작성합니다. 사용자에게 고유 ID가 없으면 null만 표시하면 됩니다.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Employees table:
+----+----------+
| id | name     |
+----+----------+
| 1  | Alice    |
| 7  | Bob      |
| 11 | Meir     |
| 90 | Winston  |
| 3  | Jonathan |
+----+----------+
EmployeeUNI table:
+----+-----------+
| id | unique_id |
+----+-----------+
| 3  | 1         |
| 11 | 2         |
| 90 | 3         |
+----+-----------+
Output: 
+-----------+----------+
| unique_id | name     |
+-----------+----------+
| null      | Alice    |
| null      | Bob      |
| 2         | Meir     |
| 3         | Winston  |
| 1         | Jonathan |
+-----------+----------+
설명:
Alice와 Bob은 고유 ID가 없으므로 대신 null을 표시하겠습니다.
메이어의 고유 ID는 2이다.
Winston의 고유 ID는 3입니다.
Jonathan의 고유 ID는 1입니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE Employees;
CREATE TABLE Employees (id int, name varchar(20));
INSERT INTO
	Employees (id, name)
VALUES
('1', 'Alice')
,('7', 'Bob')
,('11', 'Meir')
,('90', 'Winston')
,('3', 'Jonathan');
SELECT * FROM Employees;

# [SETTING]
USE PRACTICE;
DROP TABLE EmployeeUNI;
CREATE TABLE EmployeeUNI (id int, unique_id int);
INSERT INTO
	EmployeeUNI (id, unique_id)
VALUES
('3', '1')
,('11', '2')
,('90', '3');
SELECT * FROM EmployeeUNI;


SELECT E.ID, U.UNIQUE_ID
FROM EMPLOYEES E LEFT OUTER JOIN EMPLOYEEUNI U
ON E.ID = U.ID;