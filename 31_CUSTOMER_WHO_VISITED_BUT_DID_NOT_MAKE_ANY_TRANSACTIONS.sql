/*
https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/ 

Table: Visits
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+
Visit_id는 이 테이블의 기본 키입니다.
해당 테이블에는 쇼핑몰을 방문한 고객에 대한 정보가 포함되어 있습니다.


Table: Transactions
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+
transaction_id는 이 테이블의 기본 키입니다.
이 테이블에는 visit_id 동안 발생한 거래에 대한 정보가 포함되어 있습니다.


거래 없이 방문한 사용자의 ID와 이러한 유형의 방문 횟수를 찾는 SQL 쿼리를 작성하세요.
임의의 순서로 정렬된 결과 테이블을 반환합니다.


Example:
Input: 
Visits
+----------+-------------+
| visit_id | customer_id |
+----------+-------------+
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |
+----------+-------------+
Transactions
+----------------+----------+--------+
| transaction_id | visit_id | amount |
+----------------+----------+--------+
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |
+----------------+----------+--------+
Output: 
+-------------+----------------+
| customer_id | count_no_trans |
+-------------+----------------+
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |
+-------------+----------------+
설명:
ID = 23인 고객은 ID = 12인 방문 중에 쇼핑몰을 한 번 방문하고 1번의 거래를 했습니다.
ID = 9인 고객은 ID = 13인 방문 중에 쇼핑몰을 한 번 방문하고 1번의 거래를 했습니다.
ID = 30인 고객은 쇼핑몰을 한 번 방문했지만 거래를 하지 않았습니다.
ID = 54인 고객이 쇼핑몰을 세 번 방문했습니다. 2번의 방문 동안 그들은 어떤 거래도 하지 않았고, 1번의 방문 동안 3번의 거래를 했습니다.
ID = 96인 고객은 쇼핑몰을 한 번 방문했지만 거래를 하지 않았습니다.
보시다시피, ID 30과 96의 사용자는 거래 없이 한 번 쇼핑몰을 방문했습니다. 또한, 사용자 54는 쇼핑몰을 두 번 방문했지만 거래를 하지 않았습니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE Visits;
CREATE TABLE Visits(visit_id int, customer_id int);
INSERT INTO
	Visits (visit_id, customer_id)
VALUES
('1', '23')
,('2', '9')
,('4', '30')
,('5', '54')
,('6', '96')
,('7', '54')
,('8', '54');
SELECT * FROM Visits;

# [SETTING]
USE PRACTICE;
DROP TABLE Transactions;
CREATE TABLE Transactions(transaction_id int, visit_id int, amount int);
INSERT INTO
	Transactions (transaction_id, visit_id, amount)
VALUES
('2', '5', '310')
,('3', '5', '300')
,('9', '5', '200')
,('12', '1', '910')
,('13', '2', '970');
SELECT * FROM Transactions;

# [MYSQL1] - LEFT OUTER JOIN
SELECT V.CUSTOMER_ID, COUNT(V.VISIT_ID) AS COUNT_NO_TRANS
FROM VISITS V LEFT OUTER JOIN TRANSACTIONS T
ON V.VISIT_ID = T.VISIT_ID
WHERE T.TRANSACTION_ID IS NULL
GROUP BY V.CUSTOMER_ID;

# [MYSQL2] - NOT IN
SELECT CUSTOMER_ID, COUNT(VISIT_ID) AS COUNT_NO_TRANS
FROM VISITS
WHERE VISIT_ID NOT IN (
						SELECT VISIT_ID
                        FROM TRANSACTIONS
					)
GROUP BY CUSTOMER_ID;