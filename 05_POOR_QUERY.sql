/*
https://leetcode.com/problems/queries-quality-and-percentage/ 

Table: Queries
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+
이 테이블에는 기본 키가 없습니다. 중복된 행이 있을 수 있습니다.
이 테이블에는 데이터베이스의 일부 쿼리에서 수집된 정보가 포함되어 있습니다.
position 열의 값은 1부터 500까지입니다.
rating 열에는 1부터 5까지의 값이 있습니다.
rating이 3 미만인 쿼리는 잘못된 쿼리입니다.


쿼리 품질을 다음과 같이 정의합니다: 쿼리 rating과 해당 position 간의 비율 평균입니다.
또한 불량한 쿼리 비율을 다음과 같이 정의합니다: rating이 3 미만인 모든 쿼리의 비율입니다.


각각의 query_name, quality 및 poor_query_percentage 찾는 SQL 쿼리를 작성합니다.
quality와 poor_query_percentage 모두 소수점 이하 2자리로 반올림되어야 합니다.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Queries table:
+------------+-------------------+----------+--------+
| query_name | result            | position | rating |
+------------+-------------------+----------+--------+
| Dog        | Golden Retriever  | 1        | 5      |
| Dog        | German Shepherd   | 2        | 5      |
| Dog        | Mule              | 200      | 1      |
| Cat        | Shirazi           | 5        | 2      |
| Cat        | Siamese           | 3        | 3      |
| Cat        | Sphynx            | 7        | 4      |
+------------+-------------------+----------+--------+
Output: 
+------------+---------+-----------------------+
| query_name | quality | poor_query_percentage |
+------------+---------+-----------------------+
| Dog        | 2.50    | 33.33                 |
| Cat        | 0.66    | 33.33                 |
+------------+---------+-----------------------+
설명:
개 쿼리 quality은 ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50입니다.
개 쿼리 poor_query_percentage는 (1 / 3) * 100 = 33.33입니다.

고양이 쿼리 quality은 ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66입니다.
Cat 쿼리 poor_query_percentage는 (1 / 3) * 100 = 33.33입니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE Queries;
CREATE TABLE Queries (query_name varchar(30), result varchar(50), position int, rating int);
INSERT INTO
	Queries (query_name, result, position, rating)
VALUES
('Dog', 'Golden Retriever', '1', '5')
,('Dog', 'German Shepherd', '2', '5')
,('Dog', 'Mule', '200', '1')
,('Cat', 'Shirazi', '5', '2')
,('Cat', 'Siamese', '3', '3')
,('Cat', 'Sphynx', '7', '4');
SELECT * FROM Queries;


# [KEY]
# case when과 함께 group by 사용하면 매우 유용!
# (참고) case when을 count로도 사용 가능(count(case when rating < 3 then 1 end)/count(*)) -> Easy 섹션에서 다시 다룰 예정!
# round: 소수점 몇 자리 수 기준으로 반올림

SELECT QUERY_NAME, 
ROUND(AVG(RATING / POSITION), 2) AS QUALITY,
ROUND(SUM(CASE WHEN RATING < 3 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS POOR_QUERY_PERCENTAGE
FROM QUERIES
GROUP BY QUERY_NAME;