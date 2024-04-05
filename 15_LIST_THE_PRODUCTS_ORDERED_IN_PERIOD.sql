/*
https://leetcode.com/problems/list-the-products-ordered-in-a-period/ 

Table: Products
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| product_id       | int     |
| product_name     | varchar |
| product_category | varchar |
+------------------+---------+
product_id는 이 테이블의 기본 키입니다.
이 테이블에는 회사 제품에 대한 데이터가 포함되어 있습니다.


Table: Orders
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| order_date    | date    |
| unit          | int     |
+---------------+---------+
이 테이블에는 기본 키가 없습니다. 중복된 행이 있을 수 있습니다.
product_id는 Products 테이블에 대한 외래 키입니다.
단위는 order_date에 주문된 제품 수입니다.


2020년 2월에 100개 이상 주문한 제품의 이름과 총 팔린 제품 수를 가져오는 SQL 쿼리를 작성하세요.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Products table:
+-------------+-----------------------+------------------+
| product_id  | product_name          | product_category |
+-------------+-----------------------+------------------+
| 1           | Leetcode Solutions    | Book             |
| 2           | Jewels of Stringology | Book             |
| 3           | HP                    | Laptop           |
| 4           | Lenovo                | Laptop           |
| 5           | Leetcode Kit          | T-shirt          |
+-------------+-----------------------+------------------+
Orders table:
+--------------+--------------+----------+
| product_id   | order_date   | unit     |
+--------------+--------------+----------+
| 1            | 2020-02-05   | 60       |
| 1            | 2020-02-10   | 70       |
| 2            | 2020-01-18   | 30       |
| 2            | 2020-02-11   | 80       |
| 3            | 2020-02-17   | 2        |
| 3            | 2020-02-24   | 3        |
| 4            | 2020-03-01   | 20       |
| 4            | 2020-03-04   | 30       |
| 4            | 2020-03-04   | 60       |
| 5            | 2020-02-25   | 50       |
| 5            | 2020-02-27   | 50       |
| 5            | 2020-03-01   | 50       |
+--------------+--------------+----------+
Output: 
+--------------------+---------+
| product_name       | unit    |
+--------------------+---------+
| Leetcode Solutions | 130     |
| Leetcode Kit       | 100     |
+--------------------+---------+
설명:
product_id = 1인 제품은 2월에 총 (60 + 70) = 130개 주문되었습니다.
product_id = 2인 제품은 2월에 총 80개 주문되었습니다.
product_id = 3인 제품은 2월에 총 (2 + 3) = 5개 주문되었습니다.
product_id = 4인 제품은 2020년 2월에 주문되지 않았습니다.
product_id = 5인 제품은 2월에 총 (50 + 50) = 100개 주문되었습니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE Products;
CREATE TABLE Products (product_id int, product_name varchar(40), product_category varchar(40));
INSERT INTO
	Products (product_id, product_name, product_category)
VALUES
('1', 'Leetcode Solutions', 'Book')
,('2', 'Jewels of Stringology', 'Book')
,('3', 'HP', 'Laptop')
,('4', 'Lenovo', 'Laptop')
,('5', 'Leetcode Kit', 'T-shirt');
SELECT * FROM Products;

# [SETTING]
USE PRACTICE;
DROP TABLE Orders;
CREATE TABLE Orders (product_id int, order_date date, unit int);
INSERT INTO
	Orders (product_id, order_date, unit)
VALUES
('1', '2020-02-05', '60')
,('1', '2020-02-10', '70')
,('2', '2020-01-18', '30')
,('2', '2020-02-11', '80')
,('3', '2020-02-17', '2')
,('3', '2020-02-24', '3')
,('4', '2020-03-01', '20')
,('4', '2020-03-04', '30')
,('4', '2020-03-04', '60')
,('5', '2020-02-25', '50')
,('5', '2020-02-27', '50')
,('5', '2020-03-01', '50');
SELECT * FROM Orders;


# [MYSQL1]
SELECT P.PRODUCT_NAME, UNIT
FROM PRODUCTS P INNER JOIN 
	(SELECT PRODUCT_ID, SUM(UNIT) AS UNIT
	FROM ORDERS
	WHERE EXTRACT(YEAR_MONTH FROM ORDER_DATE) = '202002'
	GROUP BY PRODUCT_ID
	HAVING SUM(UNIT) >= 100) O
ON P.PRODUCT_ID = O.PRODUCT_ID;