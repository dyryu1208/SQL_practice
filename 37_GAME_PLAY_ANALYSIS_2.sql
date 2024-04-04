/*
Table: Activity
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date)는 이 테이블의 기본 키입니다.
이 표는 일부 게임의 플레이어 활동을 보여줍니다.
각 행은 특정 장치를 통해 로그인 한 후에, 로그아웃하기 전까지 플레이한 게임 횟수(0도 가능)의 기록입니다.


각 플레이어에 대해 처음 로그인된 장치를 보고하는 SQL 쿼리를 작성합니다.


Example:
Activity table:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-05-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+

Result table:
+-----------+-----------+
| player_id | device_id |
+-----------+-----------+
| 1         | 2         |
| 2         | 3         |
| 3         | 1         |
+-----------+-----------+
*/

# [SETTING]
USE PRACTICE;
DROP TABLE ACTIVITY;
CREATE TABLE ACTIVITY (PLAYER_ID INT, DEVICE_ID INT, EVENT_DATE DATE, GAMES_PLAYED INT);
INSERT INTO
	ACTIVITY (PLAYER_ID, DEVICE_ID, EVENT_DATE, GAMES_PLAYED)
VALUES
	('1', '2', '2016-03-01', '5')
	,('1', '2', '2016-05-02', '6')
	,('2', '3', '2017-06-25', '1')
	,('3', '1', '2016-03-02', '0')
	,('3', '4', '2018-07-03', '5');
SELECT * FROM ACTIVITY;	    

SELECT PLAYER_ID, DEVICE_ID
FROM (
	SELECT PLAYER_ID, DEVICE_ID, RANK() OVER(PARTITION BY PLAYER_ID ORDER BY EVENT_DATE) AS RNK
    FROM ACTIVITY
)AS A
WHERE RNK = 1 ;