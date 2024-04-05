/*
https://leetcode.com/problems/bank-account-summary-ii/ 

Table: Users
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| account      | int     |
| name         | varchar |
+--------------+---------+
account는 이 테이블의 기본 키입니다.
이 테이블의 각 행에는 은행에 있는 각 사용자의 계좌 번호가 포함되어 있습니다.
테이블에는 동일한 이름을 가진 동명이인 사용자가 없습니다.


Table: Transactions
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| trans_id      | int     |
| account       | int     |
| amount        | int     |
| transacted_on | date    |
+---------------+---------+
trans_id는 이 테이블의 기본 키입니다.
이 표의 각 행에는 모든 계정에 대한 모든 변경사항이 포함됩니다.
금액은 사용자가 돈을 받은 경우 양수이고, 돈을 이체한 경우 음수입니다.
모든 계정은 잔액 0으로 시작합니다.


잔액이 10000보다 큰 사용자의 이름과 잔액을 보고하는 SQL 쿼리를 작성하세요.
계좌의 잔액은 해당 계좌와 관련된 모든 거래 금액의 합계와 같습니다.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Users table:
+------------+--------------+
| account    | name         |
+------------+--------------+
| 900001     | Alice        |
| 900002     | Bob          |
| 900003     | Charlie      |
+------------+--------------+
Transactions table:
+------------+------------+------------+---------------+
| trans_id   | account    | amount     | transacted_on |
+------------+------------+------------+---------------+
| 1          | 900001     | 7000       |  2020-08-01   |
| 2          | 900001     | 7000       |  2020-09-01   |
| 3          | 900001     | -3000      |  2020-09-02   |
| 4          | 900002     | 1000       |  2020-09-12   |
| 5          | 900003     | 6000       |  2020-08-07   |
| 6          | 900003     | 6000       |  2020-09-07   |
| 7          | 900003     | -4000      |  2020-09-11   |
+------------+------------+------------+---------------+
Output: 
+------------+------------+
| name       | balance    |
+------------+------------+
| Alice      | 11000      |
+------------+------------+
설명:
앨리스의 잔액은 (7000 + 7000 - 3000) = 11000입니다.
밥의 잔액은 1000입니다.
찰리의 잔액은 (6000 + 6000 - 4000) = 8000입니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE Users;
CREATE TABLE Users (account int, name varchar(20));
INSERT INTO
	Users (account, name)
VALUES
('900001', 'Alice')
,('900002', 'Bob')
,('900003', 'Charlie');
SELECT * FROM Users;

# [SETTING]
USE PRACTICE;
DROP TABLE Transactions;
CREATE TABLE Transactions (trans_id int, account int, amount int, transacted_on date);
INSERT INTO
	Transactions (trans_id, account, amount, transacted_on)
VALUES
('1', '900001', '7000', '2020-08-01')
,('2', '900001', '7000', '2020-09-01')
,('3', '900001', '-3000', '2020-09-02')
,('4', '900002', '1000', '2020-09-12')
,('5', '900003', '6000', '2020-08-07')
,('6', '900003', '6000', '2020-09-07')
,('7', '900003', '-4000', '2020-09-11');
SELECT * FROM Transactions;


SELECT U.NAME, T.BALANCE
FROM USERS U INNER JOIN
						(SELECT ACCOUNT, SUM(AMOUNT) AS BALANCE
                        FROM TRANSACTIONS
                        GROUP BY ACCOUNT
                        HAVING SUM(AMOUNT) > 10000
                        ) T
ON U.ACCOUNT = T.ACCOUNT;