/*
https://leetcode.com/problems/article-views-i/ 

Table: Views
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+

이 테이블에는 기본 키가 없습니다. 중복된 행이 있을 수 있습니다.
이 표의 각 행은 일부 시청자가 특정 날짜에 기사(특정 작성자가 쓴)를 봤음을 나타냅니다.
동일한 author_id와 viewer_id는 동일한 사람을 나타냅니다.

자신의 기사를 하나 이상 본 모든 저자를 찾는 SQL 쿼리를 작성하세요.
id를 기준으로 오름차순으로 정렬된 결과 테이블을 반환합니다.


Example:
Input: 
Views table:
+------------+-----------+-----------+------------+
| article_id | author_id | viewer_id | view_date  |
+------------+-----------+-----------+------------+
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |
+------------+-----------+-----------+------------+
Output: 
+------+
| id   |
+------+
| 4    |
| 7    |
+------+
*/

# [SETTING]
USE PRACTICE;
DROP TABLE VIEWS;
CREATE TABLE VIEWS (ARTICLE_ID INT, AUTHOR_ID INT, VIEWER_ID INT, VIEW_DATE DATE);
INSERT INTO
	VIEWS (ARTICLE_ID, AUTHOR_ID, VIEWER_ID , VIEW_DATE)
VALUES
	('1', '3', '5', '2019-08-01')
	,('1', '3', '6', '2019-08-02')
	,('2', '7', '7', '2019-08-01')
	,('2', '7', '6', '2019-08-02')
	,('4', '7', '1', '2019-07-22')
	,('3', '4', '4', '2019-07-21')
	,('3', '4', '4', '2019-07-21');	    

SELECT * FROM VIEWS;

SELECT DISTINCT(AUTHOR_ID) AS ID
FROM VIEWS
WHERE AUTHOR_ID = VIEWER_ID
ORDER BY ID;