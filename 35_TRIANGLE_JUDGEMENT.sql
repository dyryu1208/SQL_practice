/*
https://leetcode.com/problems/triangle-judgement/ 

Table: Triangle
+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
(x, y, z)는 이 테이블의 기본 키 열입니다.
이 테이블의 각 행에는 세 개의 선분 길이가 포함되어 있습니다.


세 개의 선분마다 삼각형을 형성할 수 있는지 보고하는 SQL 쿼리를 작성하세요.
어떤 순서로든 결과 테이블을 반환합니다.


Example:
Input: 
Triangle table:
+----+----+----+
| x  | y  | z  |
+----+----+----+
| 13 | 15 | 30 |
| 10 | 20 | 15 |
+----+----+----+
Output: 
+----+----+----+----------+
| x  | y  | z  | triangle |
+----+----+----+----------+
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |
+----+----+----+----------+
*/

# [SETTING]
USE PRACTICE;
DROP TABLE TRIANGLE;
CREATE TABLE TRIANGLE (X INT, Y INT, Z INT);
INSERT INTO
	 TRIANGLE (X, Y, Z)
VALUES
('13', '15', '30')
,('10', '20', '15');
SELECT * FROM TRIANGLE;

SELECT X, Y, Z,
      CASE WHEN X+Y <= Z THEN 'NO'
	       WHEN X+Z <= Y THEN 'NO'
           WHEN Y+Z <= X THEN 'NO'
           ELSE 'YES'
	  END AS TRIANGLE
FROM TRIANGLE;