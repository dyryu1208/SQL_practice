/*
영화관 매표소에 있는 여러 친구가 연속된 좌석을 예약하고 싶어합니다.
다음 seats 테이블을 사용하여, 연속 사용 가능한 모든 좌석을 seat_id 순서대로 쿼리를 작성하세요.


Example:
Input: 
seats table:
+---------+------+
| seat_id | free |
|---------|------|
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 5       | 1    |
+---------+------+
Output: 
+---------+
| seat_id |
|---------|
| 3       |
| 4       |
| 5       |
+---------+
메모:
seat_id는 자동 증가 integer이고 free는 bool입니다(1은 비어 있음을 의미하고 0은 점유를 의미함).
연속 이용 가능 좌석은 2석 이상 연속 이용 가능 좌석입니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE SEATS;
CREATE TABLE SEATS (SEAT_ID INT, FREE INT);
INSERT INTO
	SEATS (SEAT_ID, FREE)
VALUES
	('1', '1')
	,('2', '0')
	,('3', '1')
	,('4', '1')
	,('5', '1');
SELECT * FROM SEATS;

# [KEY]
# 'consecutive': (1) 이전 좌석과 지금 좌석 비교, (2) 지금 좌석과 이후 좌석 비교

# PRACTICE
SELECT SEAT_ID, FREE,
		LAG(FREE) OVER (ORDER BY SEAT_ID) AS PREV_FREE,
        LEAD(FREE) OVER (ORDER BY SEAT_ID) AS POST_FREE
FROM SEATS
ORDER BY SEAT_ID;

# [MYSQL]
SELECT SEAT_ID
FROM (
		SELECT SEAT_ID, FREE,
				LAG(FREE) OVER (ORDER BY SEAT_ID) AS PREV_FREE,
                LEAD(FREE) OVER (ORDER BY SEAT_ID) AS POST_FREE
		FROM SEATS
        ORDER BY SEAT_ID
) A
WHERE FREE = PREV_FREE OR FREE = POST_FREE;