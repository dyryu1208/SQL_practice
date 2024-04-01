/*
https://leetcode.com/problems/find-customer-referee/

Table: Customer
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
id는 이 테이블의 기본 키 열입니다.
이 테이블의 각 행에는 고객의 ID, 이름, 추천한 고객의 ID가 표시됩니다.


ID = 2인 고객이 추천하지 않은 고객의 이름을 보고하는 SQL 쿼리를 작성하세요.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+
Output: 
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+
*/

# [SETTING]
USE PRACTICE;
DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (ID INT, NAME VARCHAR(255), REFEREE_ID INT);
INSERT INTO
	 CUSTOMER (ID, NAME, REFEREE_ID)
VALUES
('1', 'WILL', NULL)
,('2', 'JANE', NULL)
,('3', 'ALEX', '2')
,('4', 'BILL', NULL)
,('5', 'ZACK', '1')
,('6', 'MARK', '2');
SELECT * FROM CUSTOMER;

-- [MYSQL1] - 모든 경우의수를 고려해야 함
SELECT ID, NAME
FROM CUSTOMER
WHERE REFEREE_ID != 2 OR REFEREE_ID IS NULL;

-- [MYSQL2] - NOT IN -> 보다 직관적
SELECT ID, NAME
FROM CUSTOMER
WHERE ID NOT IN (
				SELECT ID
                FROM CUSTOMER
                WHERE REFEREE_ID = 2
);

