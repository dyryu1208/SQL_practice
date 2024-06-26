/*
https://leetcode.com/problems/sales-person/ 

Table: SalesPerson
+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| sales_id        | int     |
| name            | varchar |
| salary          | int     |
| commission_rate | int     |
| hire_date       | date    |
+-----------------+---------+
sales_id는 이 테이블의 기본 키 열입니다.
이 테이블의 각 행에는 영업사원의 ID, 이름, 급여, 수수료율, 채용 날짜가 표시됩니다.


Table: Company
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| com_id      | int     |
| name        | varchar |
| city        | varchar |
+-------------+---------+
com_id는 이 테이블의 기본 키 열입니다.
이 테이블의 각 행은 회사의 ID, 이름, 회사가 위치한 도시를 나타냅니다.


Table: Orders
+-------------+------+
| Column Name | Type |
+-------------+------+
| order_id    | int  |
| order_date  | date |
| com_id      | int  |
| sales_id    | int  |
| amount      | int  |
+-------------+------+
order_id는 이 테이블의 기본 키 열입니다.
com_id는 Company 테이블의 com_id에 대한 외래 키입니다.
sales_id는 SalesPerson 테이블의 sales_id에 대한 외래 키입니다.
이 테이블의 각 행에는 하나의 주문에 대한 정보가 포함되어 있습니다.
여기에는 회사 ID, 영업사원 ID, 주문 날짜, 결제 금액이 포함됩니다.


이름이 "RED"인 회사와 관련된 주문이 없는 모든 영업사원의 이름을 보고하는 SQL 쿼리를 작성하세요.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
SalesPerson table:
+----------+------+--------+-----------------+------------+
| sales_id | name | salary | commission_rate | hire_date  |
+----------+------+--------+-----------------+------------+
| 1        | John | 100000 | 6               | 4/1/2006   |
| 2        | Amy  | 12000  | 5               | 5/1/2010   |
| 3        | Mark | 65000  | 12              | 12/25/2008 |
| 4        | Pam  | 25000  | 25              | 1/1/2005   |
| 5        | Alex | 5000   | 10              | 2/3/2007   |
+----------+------+--------+-----------------+------------+
Company table:
+--------+--------+----------+
| com_id | name   | city     |
+--------+--------+----------+
| 1      | RED    | Boston   |
| 2      | ORANGE | New York |
| 3      | YELLOW | Boston   |
| 4      | GREEN  | Austin   |
+--------+--------+----------+
Orders table:
+----------+------------+--------+----------+--------+
| order_id | order_date | com_id | sales_id | amount |
+----------+------------+--------+----------+--------+
| 1        | 1/1/2014   | 3      | 4        | 10000  |
| 2        | 2/1/2014   | 4      | 5        | 5000   |
| 3        | 3/1/2014   | 1      | 1        | 50000  |
| 4        | 4/1/2014   | 1      | 4        | 25000  |
+----------+------------+--------+----------+--------+
Output: 
+------+
| name |
+------+
| Amy  |
| Mark |
| Alex |
+------+
설명:
Orders 테이블의 주문 3과 4에 따르면 판매원 John과 Pam만이 RED 회사에 판매하고 있음을 쉽게 알 수 있으므로 판매원 테이블에 다른 모든 이름을 보고합니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE SALESPERSON;
CREATE TABLE SALESPERSON (SALES_ID INT, NAME VARCHAR(255), SALARY INT, COMMISSION_RATE INT, HIRE_DATE DATE);
INSERT INTO
	SALESPERSON (SALES_ID, NAME, SALARY, COMMISSION_RATE, HIRE_DATE)
VALUES
	('1', 'JOHN', '100000', '6', '2006-04-01')
	,('2', 'AMY', '120000', '5', '2010-05-01')
	,('3', 'MARK', '65000', '12', '2008-12-24')
	,('4', 'PAM', '25000', '25', '2005-01-01')
	,('5', 'ALEX', '50000', '10', '2007-02-03');
SELECT * FROM SALESPERSON;	

# [SETTING]
USE PRACTICE;
DROP TABLE COMPANY;
CREATE TABLE COMPANY (COM_ID INT, NAME VARCHAR(255), CITY VARCHAR(255));
INSERT INTO
	COMPANY (COM_ID, NAME, CITY)
VALUES
	('1', 'RED', 'BOSTON')
	,('2', 'ORANGE', 'NEW YORK')
	,('3', 'YELLOW', 'BOSTON')
	,('4', 'GREEN', 'AUSTIN');
SELECT * FROM COMPANY;	

# [SETTING]
USE PRACTICE;
DROP TABLE ORDERS;
CREATE TABLE ORDERS (ORDER_ID INT, DATES DATE, COM_ID INT, SALES_ID INT, AMOUNT INT);
INSERT INTO
	ORDERS (ORDER_ID, DATES, COM_ID, SALES_ID, AMOUNT)
VALUES
	('1', '2014-01-01', '3', '4', '100000')
	,('2', '2014-02-01', '4', '5', '5000')
	,('3', '2014-03-01', '1', '1', '50000')
	,('4', '2014-04-01', '1', '4', '25000');
SELECT * FROM ORDERS;	

# [MYSQL1] - PAM이랑 ALEX만 나옴!
SELECT S.NAME
FROM COMPANY C INNER JOIN ORDERS O RIGHT OUTER JOIN SALESPERSON S
ON C.COM_ID = O.COM_ID AND O.SALES_ID = S.SALES_ID
WHERE C.NAME != 'RED';

# [MYSQL2] 예외적인 케이스도 고려하는 NOT IN 사용!
SELECT NAME
FROM SALESPERSON
WHERE SALES_ID NOT IN (
						SELECT SALES_ID
                        FROM ORDERS
                        WHERE COM_ID IN (
											SELECT COM_ID
                                            FROM COMPANY
                                            WHERE NAME = 'RED')
					)
                    
                    