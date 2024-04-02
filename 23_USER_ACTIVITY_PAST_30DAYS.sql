/*
https://leetcode.com/problems/user-activity-for-the-past-30-days-i/ 

Table: Activity
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| session_id    | int     |
| activity_date | date    |
| activity_type | enum    |
+---------------+---------+
이 테이블에는 기본 키가 없습니다. 중복된 행이 있을 수 있습니다.
activity_type 열은 ('open_session', 'end_session', 'scroll_down', 'send_message') 유형의 ENUM입니다.
표에는 소셜 미디어 웹사이트의 사용자 활동이 나와 있습니다.
각 세션은 정확히 한 명의 사용자에게 속합니다.


2019년 7월 27일까지 30일 동안의 일일 활성 사용자 수를 찾는 SQL 쿼리를 작성하세요.
사용자가 해당 날짜에 하나 이상의 활동을 수행한 경우 해당 날짜에 활성 상태 입니다.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Activity table:
+---------+------------+---------------+---------------+
| user_id | session_id | activity_date | activity_type |
+---------+------------+---------------+---------------+
| 1       | 1          | 2019-07-20    | open_session  |
| 1       | 1          | 2019-07-20    | scroll_down   |
| 1       | 1          | 2019-07-20    | end_session   |
| 2       | 4          | 2019-07-20    | open_session  |
| 2       | 4          | 2019-07-21    | send_message  |
| 2       | 4          | 2019-07-21    | end_session   |
| 3       | 2          | 2019-07-21    | open_session  |
| 3       | 2          | 2019-07-21    | send_message  |
| 3       | 2          | 2019-07-21    | end_session   |
| 4       | 3          | 2019-06-25    | open_session  |
| 4       | 3          | 2019-06-25    | end_session   |
+---------+------------+---------------+---------------+
Output: 
+------------+--------------+ 
| day        | active_users |
+------------+--------------+ 
| 2019-07-20 | 2            |
| 2019-07-21 | 2            |
+------------+--------------+ 
Explanation: Note that we do not care about days with zero active users.
설명: 활성 사용자가 없는 날짜는 고려하지 않습니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE ACTIVITY;
CREATE TABLE ACTIVITY (USER_ID INT, SESSION_ID INT, ACTIVITY_DATE DATE, ACTIVITY_TYPE VARCHAR(255));
INSERT INTO
	ACTIVITY (USER_ID, SESSION_ID, ACTIVITY_DATE, ACTIVITY_TYPE)
VALUES
	('1', '1', '2019-07-20', 'OPEN_SESSION')
	,('1', '1', '2019-07-20', 'SCROLL_DOWN')
	,('1', '1', '2019-07-20', 'END_SESSION')
	,('2', '4', '2019-07-20', 'OPEN_SESSION')
	,('2', '4', '2019-07-21', 'SEND_MESSAGE')
	,('2', '4', '2019-07-21', 'END_SESSION')
	,('3', '2', '2019-07-21', 'OPEN_SESSION')
	,('3', '2', '2019-07-21', 'SEND_MESSAGE')
	,('3', '2', '2019-07-21', 'END_SESSION')
	,('4', '3', '2019-06-25', 'OPEN_SESSION')
	,('4', '3', '2019-06-25', 'END_SESSION');
SELECT * FROM ACTIVITY;	

# [KEY]
# DATE_SUB 함수, DATE_ADD 함수
# 'period of 30 days': 한 쪽은 등호 있고, 한 쪽은 등호가 없어야지 기간이 30일이 된다.-- https://extbrain.tistory.com/58
# https://extbrain.tistory.com/58

SELECT ACTIVITY_DATE AS DAY, COUNT(DISTINCT(USER_ID)) AS ACTIVE_USERS
FROM ACTIVITY
WHERE DATE_SUB('2019-07-27', INTERVAL 30 DAY) < ACTIVITY_DATE AND ACTIVITY_DATE <= '2019-07-27'
GROUP BY ACTIVITY_DATE