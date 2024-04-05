/*
https://leetcode.com/problems/customers-who-never-order/ 

Table: Customers
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id는 이 테이블의 기본 키 열입니다.
이 테이블의 각 행은 고객의 ID와 이름을 나타냅니다.

 
Table: Orders
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+
id는 이 테이블의 기본 키 열입니다.
customerId는 Customers 테이블 ID의 외래 키입니다.
이 테이블의 각 행은 주문 ID와 주문한 고객의 ID를 나타냅니다.


아무것도 주문하지 않은 모든 고객을 보고하는 SQL 쿼리를 작성하세요.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Customers table:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Orders table:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Output: 
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
*/

# [SETTING]
USE PRACTICE;
DROP TABLE CUSTOMERS;
CREATE TABLE CUSTOMERS (ID INT, NAME VARCHAR(255));
INSERT INTO
	CUSTOMERS (ID, NAME)
VALUES
	('1', 'JOE')
	,('2', 'HENRY')
	,('3', 'SAM')
	,('4', 'MAX');
SELECT * FROM CUSTOMERS;

# [SETTING]
USE PRACTICE;
DROP TABLE ORDERS;
CREATE TABLE ORDERS (ID INT, CUSTOMERID INT);
INSERT INTO
	ORDERS (ID, CUSTOMERID)
VALUES
	('1', '3')
	,('2', '1');
SELECT * FROM ORDERS;


SELECT ID, NAME
FROM CUSTOMERS
WHERE ID NOT IN (
				SELECT CUSTOMERID
                FROM ORDERS
				);