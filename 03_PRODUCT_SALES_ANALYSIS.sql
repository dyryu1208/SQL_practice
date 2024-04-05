/*
https://leetcode.com/problems/product-sales-analysis-i/ 

Table: Sales
+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+

(sale_id, year)는 이 테이블의 기본 키입니다.
product_id는 Product 테이블의 외래 키입니다.
이 테이블의 각 행에는 특정 연도의 product_id 제품 판매가 표시됩니다.
가격은 개당 가격이니 참고하세요.


Table: Product
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+

product_id는 이 테이블의 기본 키입니다.
이 표의 각 행은 각 제품의 제품 이름을 나타냅니다.


Sales 테이블의 각 sale_id에 대한 product_name, 연도 및 가격을 보고하는 SQL 쿼리를 작성합니다.
결과 테이블을 어떤 순서로든 반환합니다.


Example:
Input: 
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+
Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+
Output: 
+--------------+-------+-------+
| product_name | year  | price |
+--------------+-------+-------+
| Nokia        | 2008  | 5000  |
| Nokia        | 2009  | 5000  |
| Apple        | 2011  | 9000  |
+--------------+-------+-------+

설명:
sale_id = 1을 통해 Nokia가 2008년에 5000에 판매되었다는 결론을 내릴 수 있습니다.
sale_id = 2로부터 우리는 Nokia가 2009년에 5000에 판매되었다는 결론을 내릴 수 있습니다.
sale_id = 7을 통해 2011년에 Apple이 9000에 판매되었다는 결론을 내릴 수 있습니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE SALES;
CREATE TABLE SALES (SALE_ID INT, PRODUCT_ID INT, YEAR INT, QUANTITY INT, PRICE INT);
INSERT INTO
	SALES (SALE_ID, PRODUCT_ID, YEAR, QUANTITY, PRICE)
VALUES
	('1', '100', '2008', '10', '5000')
	,('2', '100', '2009', '12', '5000')
	,('7', '200', '2011', '15', '9000');
SELECT * FROM SALES;

# [SETTING]
USE PRACTICE;
DROP TABLE PRODUCT;
CREATE TABLE PRODUCT (PRODUCT_ID INT, PRODUCT_NAME VARCHAR(255));
INSERT INTO
	PRODUCT (PRODUCT_ID, PRODUCT_NAME)
VALUES
	('100', 'NOKIA')
	,('200', 'APPLE')
	,('300', 'SAMSUNG');
    
    
SELECT P.PRODUCT_NAME, S.YEAR, S.PRICE
FROM SALES S INNER JOIN PRODUCT P
WHERE S.PRODUCT_ID = P.PRODUCT_ID;
