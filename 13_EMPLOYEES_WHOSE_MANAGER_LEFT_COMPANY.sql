/*
https://leetcode.com/problems/employees-whose-manager-left-the-company/ 

Table: Employees
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| manager_id  | int      |
| salary      | int      |
+-------------+----------+
employee_id 이 테이블의 기본 키입니다.
이 테이블에는 직원, 급여, 관리자 ID에 대한 정보가 포함되어 있습니다.
일부 직원에게는 관리자가 없습니다(manager_id가 null임).


급여가 $30000 미만이고 관리자가 회사를 떠난 직원의 ID를 보고하는 SQL 쿼리를 작성하세요.
관리자가 회사를 떠나면 직원 테이블에서 해당 정보가 삭제되지만 보고서에는 여전히 관리자 ID가 떠난 관리자로 설정되어 있습니다.
employee_id별로 정렬된 결과 테이블을 반환합니다.


Example:
Input:  
Employees table:
+-------------+-----------+------------+--------+
| employee_id | name      | manager_id | salary |
+-------------+-----------+------------+--------+
| 3           | Mila      | 9          | 60301  |
| 12          | Antonella | null       | 31000  |
| 13          | Emery     | null       | 67084  |
| 1           | Kalel     | 11         | 21241  |
| 9           | Mikaela   | null       | 50937  |
| 11          | Joziah    | 6          | 28485  |
+-------------+-----------+------------+--------+
Output: 
+-------------+
| employee_id |
+-------------+
| 11          |
+-------------+

설명:
급여가 $30000 미만인 직원은 1(Kalel)과 11(Joziah)입니다.
Kalel의 관리자는 아직 회사에 있는 직원 11입니다(Joziah).
Joziah의 관리자는 직원 6인데, 직원 6이 삭제되어 해당 행이 없어 회사를 떠났습니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE Employees;
CREATE TABLE Employees (employee_id int, name varchar(20), manager_id int, salary int);
INSERT INTO
	Employees (employee_id, name, manager_id, salary)
VALUES
('3', 'Mila', '9', '60301')
,('12', 'Antonella', null, '31000')
,('13', 'Emery', null, '67084')
,('1', 'Kalel', '11', '21241')
,('9', 'Mikaela', null, '50937')
,('11', 'Joziah', '6', '28485');
SELECT * FROM Employees;

SELECT EMPLOYEE_ID
FROM EMPLOYEES
WHERE SALARY < 30000
AND MANAGER_ID NOT IN (
						SELECT EMPLOYEE_ID
                        FROM EMPLOYEES)
ORDER BY EMPLOYEE_ID;