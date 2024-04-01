/*
https://leetcode.com/problems/employees-earning-more-than-their-managers/

Table: Employee
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id는 이 테이블의 기본 키 열입니다.
이 테이블의 각 행은 직원의 ID, 이름, 급여 및 관리자의 ID를 나타냅니다.


관리자보다 연봉이 더 높은 직원을 찾는 SQL 쿼리를 작성하세요.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
설명: Joe는 그의 관리자보다 더 많은 돈을 버는 유일한 직원입니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE EMPLOYEE;
CREATE TABLE EMPLOYEE (ID INT, NAME VARCHAR(255), SALARY INT, MANAGERID INT);
INSERT INTO
	EMPLOYEE (ID, NAME, SALARY, MANAGERID)
VALUES
	('1', 'JOE', '70000', '3')
	,('2', 'HENRY', '80000', '4')
	,('3', 'SAM', '60000', NULL)
	,('4', 'MAX', '90000', NULL);	    
SELECT * FROM EMPLOYEE;

# [KEY]
# [MYSQL1] self join
# [MYSQL2] in: 바깥 table의 alias를 안쪽 table의 alias에 그대로 사용 가능
# 안그러면 in 안에 전체 테이블 다 읽어야 되는데, 그럼 너무 비효율적. 바깥 테이블 alias와 조인해서 in 절 안에 있는 데이터 양을 적게 해서 가져오는 셈.
# 그럼 의미에서 subquery도 바깥 테이블 가져올 수 있음

# [MYSQL1] - SELF JOIN
SELECT E.ID, E.NAME, E.SALARY, E.MANAGERID
FROM EMPLOYEE E INNER JOIN EMPLOYEE M
ON E.MANAGERID = M.ID
WHERE E.SALARY > M.SALARY;

# [MYSQL2] - IN & SUB QUERY
SELECT E.ID, E.NAME, E.SALARY, E.MANAGERID
FROM EMPLOYEE AS E
WHERE E.NAME IN (
					SELECT E.NAME
                    FROM EMPLOYEE M
                    WHERE E.MANAGERID = M.ID
                    AND E.SALARY > M.SALARY
				);