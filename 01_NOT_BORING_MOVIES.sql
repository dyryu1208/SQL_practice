/*
https://leetcode.com/problems/not-boring-movies/ 

Table: Cinema
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+

id는 이 테이블의 기본 키입니다.
각 행에는 영화 이름, 장르, 등급에 대한 정보가 포함되어 있습니다.
등급은 [0, 10] 범위의 부동소수점 2자리입니다.


홀수 ID와 "boring"이 아닌 설명이 포함된 영화를 보고하는 SQL 쿼리를 작성하세요.
등급별로 내림차순으로 정렬된 결과 테이블을 반환합니다.


Example:
Input: 
Cinema table:
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |
+----+------------+-------------+--------+
Output: 
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |
+----+------------+-------------+--------+

설명:
홀수 ID인 1, 3, 5의 영화 3개가 있습니다.
ID = 3인 영화는 'boring'이므로 답변에 포함하지 않습니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE cinema;
CREATE TABLE cinema (id int, movie varchar(255), description varchar(255), rating float(2, 1));
INSERT INTO
	cinema (id, movie, description, rating)
VALUES
	('1', 'War', 'great 3D', '8.9')
	,('2', 'Science', 'fiction', '8.5')
	,('3', 'irish', 'boring', '6.2')
	,('4', 'Ice song', 'Fantacy', '8.6')
	,('5', 'House card', 'Interesting', '9.1');

SELECT * 
FROM cinema
WHERE MOD(ID, 2) = 1 
AND DESCRIPTION != 'boring'
ORDER BY rating DESC;

SELECT *
FROM CINEMA
WHERE ID%2 = 1
AND DESCRIPTION != 'boring'
ORDER BY RATING DESC;