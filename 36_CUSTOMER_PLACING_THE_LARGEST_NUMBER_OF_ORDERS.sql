/*
https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/ 

Table: Orders
+-----------------+----------+
| Column Name     | Type     |
+-----------------+----------+
| order_number    | int      |
| customer_number | int      |
+-----------------+----------+
order_number는 이 테이블의 기본 키입니다.
이 테이블에는 주문 ID 및 고객 ID에 대한 정보가 포함되어 있습니다.


가장 많은 주문을 한 고객의 customer_number를 찾는 SQL 쿼리를 작성하세요.
테스트 사례는 정확히 한 명의 고객이 다른 고객보다 더 많은 주문을 하도록 생성됩니다.


Example:
Input: 
Orders table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
설명:
3번 고객은 2개의 주문을 가지고 있는데, 이는 각각 하나의 주문만 갖고 있기 때문에 고객 1이나 2보다 더 많습니다.
따라서 결과는 customer_number 3입니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE Orders;
CREATE TABLE Orders (ORDER_NUMBER INT, CUSTOMER_NUMBER INT);
INSERT INTO
	 Orders (ORDER_NUMBER, CUSTOMER_NUMBER)
VALUES
	('1', '1')
	,('2', '2')
	,('3', '3')
	,('4', '3');
SELECT * FROM Orders;

SELECT CUSTOMER_NUMBER
FROM (
	SELECT CUSTOMER_NUMBER, RANK() OVER(ORDER BY CNT DESC) AS RK
    FROM (
			SELECT CUSTOMER_NUMBER, COUNT(ORDER_NUMBER) AS CNT
            FROM ORDERS
            GROUP BY CUSTOMER_NUMBER
		) AS A
    
    ) AS B
WHERE RK = 1;