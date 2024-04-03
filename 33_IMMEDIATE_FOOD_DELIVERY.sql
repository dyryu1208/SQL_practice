/*
Table: Delivery
+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+
delivery_id는 이 테이블의 기본 키입니다.
테이블에는 특정 날짜에 주문한 고객의 음식 배달 정보와 원하는 배송 날짜(동일한 주문 날짜 또는 그 이후) 정보를 포함합니다.


고객이 원하는 배송 날짜가 주문 날짜와 동일한 경우 'immediate'라고 합니다.
그렇지 않으면 'scheduled'라고 합니다.
테이블에서 소수점 이하 2자리까지 반올림된 'immediate' 주문의 비율을 찾는 SQL 쿼리를 작성하세요.


Example:
Delivery table:
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
| 1           | 1           | 2019-08-01 | 2019-08-02                  |
| 2           | 5           | 2019-08-02 | 2019-08-02                  |
| 3           | 1           | 2019-08-11 | 2019-08-11                  |
| 4           | 3           | 2019-08-24 | 2019-08-26                  |
| 5           | 4           | 2019-08-21 | 2019-08-22                  |
| 6           | 2           | 2019-08-11 | 2019-08-13                  |
+-------------+-------------+------------+-----------------------------+
Result table:
+----------------------+
| immediate_percentage |
+----------------------+
| 33.33                |
+----------------------+
Explanation: The orders with delivery id 2 and 3 are immediate while the others are scheduled.
설명: 배송 ID가 2와 3인 주문은 즉시 주문이고 나머지 주문은 예약입니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE DELIVERY;
CREATE TABLE DELIVERY (DELIVERY_ID INT, CUSTOMER_ID INT, ORDER_DATE DATE, CUSTOMER_PREF_DELIVERY_DATE DATE);
INSERT INTO
	DELIVERY (DELIVERY_ID, CUSTOMER_ID, ORDER_DATE, CUSTOMER_PREF_DELIVERY_DATE)
VALUES
	('1', '1', '2019-08-01', '2019-08-02')
	,('2', '5', '2019-08-02', '2019-08-02')
	,('3', '1', '2019-08-11', '2019-08-11')
	,('4', '3', '2019-08-24', '2019-08-26')
	,('5', '4', '2019-08-21', '2019-08-22')
	,('6', '2', '2019-08-11', '2019-08-13');
SELECT * FROM DELIVERY;

# [MYSQL1]
SELECT ROUND(COUNT(CASE WHEN D.ORDER_DATE = D.CUSTOMER_PREF_DELIVERY_DATE THEN 1 END) / COUNT(*) * 100, 2) AS IMMEDIATE_PERCENTAGE
FROM DELIVERY AS D;

# [MYSQL2]
SELECT ROUND(SUM(CASE WHEN D.ORDER_DATE = D.CUSTOMER_PREF_DELIVERY_DATE THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS IMMEDIATE_PERCENTAGE
FROM DELIVERY AS D;