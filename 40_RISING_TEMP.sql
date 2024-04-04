/*
https://leetcode.com/problems/rising-temperature/ 

Table: Weather
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id는 이 테이블의 기본 키입니다.
이 표에는 특정 날짜의 기온에 대한 정보가 포함되어 있습니다.


이전 날짜(어제)에 비해 기온이 더 높은 모든 날짜의 ID를 찾는 SQL 쿼리를 작성하세요.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
설명:
2015-01-02에는 전날보다 기온이 높아졌습니다(10->25).
2015-01-04년에는 전날보다 기온이 높아졌습니다(20->30).
*/

# [SETTING]
USE PRACTICE;
DROP TABLE WEATHER;
CREATE TABLE WEATHER (ID INT, RECORDDATE DATE, TEMPERATURE INT);
INSERT INTO
	WEATHER (ID, RECORDDATE, TEMPERATURE)
VALUES
('1', '2015-01-01', '10')
,('2', '2015-01-02', '25')
,('3', '2015-01-03', '20')
,('4', '2015-01-04', '30')
,('5', '2015-01-14', '5') # 데이터 추가함
,('6', '2015-01-16', '7'); # 데이터 추가함
SELECT * FROM WEATHER;

# 이렇게 하면 2015-01-14 ~ 2015-01-16은 이틀차이인데 id 6을 리턴해버림
SELECT ID
FROM (
	SELECT ID, TEMPERATURE, LAG(TEMPERATURE) OVER(ORDER BY RECORDDATE) AS PREV_TEMP
    FROM WEATHER
) AS A
WHERE TEMPERATURE > PREV_TEMP;

# [MYSQL]
SELECT ID #RECORDDATE,PREV_DAY, TEMPERATURE, PREV_TEMP
FROM (
	SELECT ID, TEMPERATURE, RECORDDATE,
    LAG(TEMPERATURE) OVER (ORDER BY RECORDDATE) AS PREV_TEMP,
    LAG(RECORDDATE) OVER (ORDER BY RECORDDATE) AS PREV_DAY
    FROM WEATHER
) AS A
WHERE DATE_ADD(PREV_DAY, INTERVAL 1 DAY) = RECORDDATE AND TEMPERATURE > PREV_TEMP;