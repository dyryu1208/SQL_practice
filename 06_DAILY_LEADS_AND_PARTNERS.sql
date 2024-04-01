/*
https://leetcode.com/problems/daily-leads-and-partners/ 

Table: DailySales
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| date_id     | date    |
| make_name   | varchar |
| lead_id     | int     |
| partner_id  | int     |
+-------------+---------+
이 테이블에는 기본 키가 없습니다.
이 테이블에는 판매된 제품의 날짜와 이름, 제품이 판매된 리드 및 파트너의 ID가 포함되어 있습니다.
이름은 영문 소문자로만 구성됩니다.

각 date_id 및 make_name에 대해 다음을 수행하는 SQL 쿼리를 작성하세요.
고유한 lead_id 및 고유한 partner_id 수를 반환합니다.
어떤 순서로든 결과 테이블을 반환합니다.

Example:
Input: 
DailySales table:
+-----------+-----------+---------+------------+
| date_id   | make_name | lead_id | partner_id |
+-----------+-----------+---------+------------+
| 2020-12-8 | toyota    | 0       | 1          |
| 2020-12-8 | toyota    | 1       | 0          |
| 2020-12-8 | toyota    | 1       | 2          |
| 2020-12-7 | toyota    | 0       | 2          |
| 2020-12-7 | toyota    | 0       | 1          |
| 2020-12-8 | honda     | 1       | 2          |
| 2020-12-8 | honda     | 2       | 1          |
| 2020-12-7 | honda     | 0       | 1          |
| 2020-12-7 | honda     | 1       | 2          |
| 2020-12-7 | honda     | 2       | 1          |
+-----------+-----------+---------+------------+
Output: 
+-----------+-----------+--------------+-----------------+
| date_id   | make_name | unique_leads | unique_partners |
+-----------+-----------+--------------+-----------------+
| 2020-12-8 | toyota    | 2            | 3               |
| 2020-12-7 | toyota    | 1            | 2               |
| 2020-12-8 | honda     | 2            | 2               |
| 2020-12-7 | honda     | 3            | 2               |
+-----------+-----------+--------------+-----------------+
Explanation: 
For 2020-12-8, toyota gets leads = [0, 1] and partners = [0, 1, 2] while honda gets leads = [1, 2] and partners = [1, 2].
For 2020-12-7, toyota gets leads = [0] and partners = [1, 2] while honda gets leads = [0, 1, 2] and partners = [1, 2].
설명:
2020-12-8의 경우 Toyota는 leads = [0, 1] 및 partners = [0, 1, 2]를 얻는 반면 Honda는 leads = [1, 2] 및 partners = [1, 2]를 얻습니다.
2020-12-7의 경우 Toyota는 leads = [0] 및 partners = [1, 2]를 얻는 반면 Honda는 leads = [0, 1, 2] 및 partners = [1, 2]를 얻습니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE DailySales;
CREATE TABLE DailySales(date_id date, make_name varchar(20), lead_id int, partner_id int);
INSERT INTO
	DailySales (date_id, make_name, lead_id, partner_id)
VALUES
('2020-12-8', 'toyota', '0', '1')
,('2020-12-8', 'toyota', '1', '0')
,('2020-12-8', 'toyota', '1', '2')
,('2020-12-7', 'toyota', '0', '2')
,('2020-12-7', 'toyota', '0', '1')
,('2020-12-8', 'honda', '1', '2')
,('2020-12-8', 'honda', '2', '1')
,('2020-12-7', 'honda', '0', '1')
,('2020-12-7', 'honda', '1', '2')
,('2020-12-7', 'honda', '2', '1');
SELECT * FROM DailySales;

# [MYSQL]
SELECT DATE_ID, MAKE_NAME,
	   COUNT(DISTINCT(LEAD_ID)) AS UNIQUE_LEADS,
	   COUNT(DISTINCT(PARTNER_ID)) AS UNIQUE_PARTNERS
FROM DAILYSALES
GROUP BY DATE_ID, MAKE_NAME;