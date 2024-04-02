/*
https://leetcode.com/problems/average-selling-price/ 

Table: Prices
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| start_date    | date    |
| end_date      | date    |
| price         | int     |
+---------------+---------+
(product_id, start_date, end_date)는 이 테이블의 기본 키입니다.
이 테이블의 각 행은 start_date부터 end_date까지의 기간 동안 product_id의 가격을 나타냅니다.
각 product_id에 대해 두 개의 겹치는 기간이 없습니다.
이는 동일한 product_id에 대해 겹치는 기간이 없음을 의미합니다.


Table: UnitsSold
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| purchase_date | date    |
| units         | int     |
+---------------+---------+
이 테이블에는 기본 키가 없으며 중복된 내용이 포함될 수 있습니다.
이 테이블의 각 행은 판매된 각 제품의 날짜, 단위 및 product_id를 나타냅니다.


각 제품의 평균 판매 가격을 구하는 SQL 쿼리를 작성하세요.
average_price는 소수점 이하 2자리로 반올림되어야 합니다.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Prices table:
+------------+------------+------------+--------+
| product_id | start_date | end_date   | price  |
+------------+------------+------------+--------+
| 1          | 2019-02-17 | 2019-02-28 | 5      |
| 1          | 2019-03-01 | 2019-03-22 | 20     |
| 2          | 2019-02-01 | 2019-02-20 | 15     |
| 2          | 2019-02-21 | 2019-03-31 | 30     |
+------------+------------+------------+--------+
UnitsSold table:
+------------+---------------+-------+
| product_id | purchase_date | units |
+------------+---------------+-------+
| 1          | 2019-02-25    | 100   |
| 1          | 2019-03-01    | 15    |
| 2          | 2019-02-10    | 200   |
| 2          | 2019-03-22    | 30    |
+------------+---------------+-------+
Output: 
+------------+---------------+
| product_id | average_price |
+------------+---------------+
| 1          | 6.96          |
| 2          | 16.96         |
+------------+---------------+
설명:
평균판매가격 = 총 상품가격 / 판매된 상품수
제품 1의 평균 판매 가격 = ((100 * 5) + (15 * 20)) / 115 = 6.96
제품 2의 평균 판매 가격 = ((200 * 15) + (30 * 30)) / 230 = 16.96
*/

# [SETTING1]
USE PRACTICE;
DROP TABLE Prices;
CREATE TABLE Prices (product_id int, start_date date, end_date date, price int);
INSERT INTO
	Prices (product_id, start_date, end_date, price)
VALUES
('1', '2019-02-17', '2019-02-28', '5')
,('1', '2019-03-01', '2019-03-22', '20')
,('2', '2019-02-01', '2019-02-20', '15')
,('2', '2019-02-21', '2019-03-31', '30');
SELECT * FROM Prices;

# [SETTING1]
USE PRACTICE;
DROP TABLE UnitsSold;
CREATE TABLE UnitsSold (product_id int, purchase_date date, units int);
INSERT INTO
	UnitsSold (product_id, purchase_date, units)
VALUES
('1', '2019-02-25', '100')
,('1', '2019-03-01', '15')
,('2', '2019-02-10', '200')
,('2', '2019-03-22', '30');
SELECT * FROM UnitsSold;

SELECT P.PRODUCT_ID, ROUND(SUM(P.PRICE * U.UNITS) / SUM(U.UNITS), 2) AS AVERAGE_PRICE
FROM PRICES P INNER JOIN UNITSSOLD U
ON P.PRODUCT_ID = U.PRODUCT_ID
WHERE U.PURCHASE_DATE BETWEEN P.START_DATE AND P.END_DATE
GROUP BY P.PRODUCT_ID;