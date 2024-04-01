/*
https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/ 

Table: ActorDirector
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| actor_id    | int     |
| director_id | int     |
| timestamp   | int     |
+-------------+---------+

timestamp는 이 테이블의 기본 키 열입니다.

 
배우가 감독과 최소 3번 협력한 쌍(actor_id, director_id)을 제공하는 보고서에 대한 SQL 쿼리를 작성합니다.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
ActorDirector table:
+-------------+-------------+-------------+
| actor_id    | director_id | timestamp   |
+-------------+-------------+-------------+
| 1           | 1           | 0           |
| 1           | 1           | 1           |
| 1           | 1           | 2           |
| 1           | 2           | 3           |
| 1           | 2           | 4           |
| 2           | 1           | 5           |
| 2           | 1           | 6           |
+-------------+-------------+-------------+
Output: 
+-------------+-------------+
| actor_id    | director_id |
+-------------+-------------+
| 1           | 1           |
+-------------+-------------+
Explanation: The only pair is (1, 1) where they cooperated exactly 3 times.
설명: 유일한 쌍은 정확히 3번 협력한 (1, 1)입니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE ACTORDIRECTOR;
CREATE TABLE ACTORDIRECTOR (ACTOR_ID INT, DIRECTOR_ID INT, TIMESTAMP INT);
INSERT INTO
	ACTORDIRECTOR (ACTOR_ID, DIRECTOR_ID, TIMESTAMP)
VALUES
	('1', '1', '0')
	,('1', '1', '1')
	,('1', '1', '2')
	,('1', '2', '3')
	,('1', '2', '4')
	,('2', '1', '5')
	,('2', '1', '6');
SELECT * FROM ACTORDIRECTOR;

# [KEY]
# 'at least': 등호 포함된 >=
# COUNT(actor_id), COUNT(director_id), COUNT(timestamp), COUNT(*): 모두 having절에서 사용해도 정답

SELECT ACTOR_ID, DIRECTOR_ID
FROM ACTORDIRECTOR
GROUP BY ACTOR_ID, DIRECTOR_ID
HAVING COUNT(DIRECTOR_ID) >= 3;
