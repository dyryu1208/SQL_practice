/*
https://leetcode.com/problems/biggest-single-number/ 

Table: MyNumbers
+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+
이 테이블에는 기본 키가 없습니다. 중복된 내용이 포함되어 있을 수 있습니다.
이 테이블의 각 행에는 정수가 포함되어 있습니다.
단일 숫자는 MyNumbers 테이블에 한 번만 나타나는 숫자입니다.


가장 큰 단일 숫자를 보고하는 SQL 쿼리를 작성하세요.
단일 숫자가 없으면 null을 보고합니다.
쿼리 결과 형식은 다음 예와 같습니다.


Example 1:
Input: 
MyNumbers table:
+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |
+-----+
Output: 
+-----+
| num |
+-----+
| 6   |
+-----+
설명:
단일 숫자는 1, 4, 5, 6입니다.
6은 가장 큰 단일 숫자이므로 이를 반환합니다.


Example 2:
Input: 
MyNumbers table:
+-----+
| num |
+-----+
| 8   |
| 8   |
| 7   |
| 7   |
| 3   |
| 3   |
| 3   |
+-----+
Output: 
+------+
| num  |
+------+
| null |
+------+
설명:
입력 테이블에 단일 숫자가 없으므로 null을 반환합니다.
*/

# [SETTING]
USE PRACTICE;
DROP TABLE MyNumbers;
CREATE TABLE MyNumbers (NUM INT);
INSERT INTO
	MyNumbers (NUM)
VALUES
	('8')
	,('8')
	,('3')
	,('3')
	,('1')
	,('4')
	,('5')
	,('6');
SELECT * FROM MyNumbers;

SELECT MAX(A.NUM) AS NUM
FROM (
		SELECT NUM
		FROM MYNUMBERS
        GROUP BY NUM
        HAVING COUNT(NUM) < 2
	) AS A;