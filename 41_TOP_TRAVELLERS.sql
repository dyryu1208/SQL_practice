/*
https://leetcode.com/problems/top-travellers/ 

Table: Users
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
id는 이 테이블의 기본 키입니다.
이름은 사용자의 이름입니다.


Table: Rides
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| user_id       | int     |
| distance      | int     |
+---------------+---------+
id는 이 테이블의 기본 키입니다.
user_id는 "distance" 거리를 이동한 사용자의 ID입니다.
 
 
각 사용자가 이동한 거리를 보고하는 SQL 쿼리를 작성합니다.
travelled_distance 기준으로 정렬된 결과 테이블을 내림차순으로 반환하고, 두 명 이상의 사용자가 동일한 거리를 이동한 경우 이름을 기준으로 오름차순으로 정렬합니다.


Example:
Input: 
Users table:
+------+-----------+
| id   | name      |
+------+-----------+
| 1    | Alice     |
| 2    | Bob       |
| 3    | Alex      |
| 4    | Donald    |
| 7    | Lee       |
| 13   | Jonathan  |
| 19   | Elvis     |
+------+-----------+
Rides table:
+------+----------+----------+
| id   | user_id  | distance |
+------+----------+----------+
| 1    | 1        | 120      |
| 2    | 2        | 317      |
| 3    | 3        | 222      |
| 4    | 7        | 100      |
| 5    | 13       | 312      |
| 6    | 19       | 50       |
| 7    | 7        | 120      |
| 8    | 19       | 400      |
| 9    | 7        | 230      |
+------+----------+----------+
Output: 
+----------+--------------------+
| name     | travelled_distance |
+----------+--------------------+
| Elvis    | 450                |
| Lee      | 450                |
| Bob      | 317                |
| Jonathan | 312                |
| Alex     | 222                |
| Alice    | 120                |
| Donald   | 0                  |
+----------+--------------------+
설명:
Elvis와 Lee는 450마일을 여행했습니다. Elvis는 Lee보다 알파벳순으로 이름이 작기 때문에 최고의 여행자입니다.
Bob, Jonathan, Alex, Alice는 한 번만 이동했으며 총 탑승 거리를 기준으로 순서를 지정합니다.
Donald는 이동하지 않았으므로 그가 이동한 거리는 0입니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE Users;
CREATE TABLE Users (id int, name varchar(30));
INSERT INTO
	Users (id, name)
VALUES
('1', 'Alice')
,('2', 'Bob')
,('3', 'Alex')
,('4', 'Donald')
,('7', 'Lee')
,('13', 'Jonathan')
,('19', 'Elvis');
SELECT * FROM Users;

# [SETTING]
USE PRACTICE;
DROP TABLE Rides;
CREATE TABLE Rides (id int, user_id int, distance int);
INSERT INTO
	Rides (id, user_id, distance)
VALUES
('1', '1', '120')
,('2', '2', '317')
,('3', '3', '222')
,('4', '7', '100')
,('5', '13', '312')
,('6', '19', '50')
,('7', '7', '120')
,('8', '19', '400')
,('9', '7', '230');
SELECT * FROM Rides;

SELECT U.NAME, IFNULL(SUM(R.DISTANCE),0) AS TRAVELLED_DISTANCE
FROM USERS U LEFT OUTER JOIN RIDES R
ON U.ID = R.USER_ID
GROUP BY U.ID, U.NAME
ORDER BY TRAVELLED_DISTANCE DESC, NAME;