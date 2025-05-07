-- Active: 1745889706777@@127.0.0.1@3306@employees
-- 문자열을 대문자, 소문자, 첫글자만 대문자로 변환하는 쿼리
SELECT 'AlohA WoRlD~!' as 원문 
, UPPER('AlohA WoRlD~!') as 대문자
, LOWER('AlohA WoRlD~!') as 소문자;

-- 문자열의 바이트 수를 반환하는 쿼리
-- 영문, 공백 : 1Byte
-- 한글       : 3Byte
SELECT 'AlohA WoRlD~!' as 원문 
, LENGTH('AlohA WoRlD~!') as 글자수
,'알로하 클래스' as 원문 
, LENGTH('알로하 클래스') as 글자수;

-- 문자열의 문자 수를 반환하는 쿼리
SELECT 'AlohA WoRlD~!' as 원문 
, CHAR_LENGTH('AlohA WoRlD~!') as 글자수
,'알로하 클래스' as 원문 
, CHAR_LENGTH('알로하 클래스') as 글자수;

-- 주어진 문자열을 연결하는 쿼리
SELECT CONCAT('AlohA','WoRlD~!') as `CONCAT`
, CONCAT_WS(' ', 'AlohA','WoRlD~!') as `CONCAT_WS`;

-- 문자열의 일부만 출력하는 쿼리
SELECT 'www.alohaclass.com' as 원문 
, SUBSTRING('www.alohaclass.com', 1, 3) as `1`
, SUBSTRING('www.alohaclass.com', 5, 10) as `2`
, SUBSTRING('www.alohaclass.com', 16, 3) as `3`
, SUBSTRING('www.alohaclass.com', -3, 3) as `3`;

SELECT 'www.alohaclass.com' as 원문 
, LOCATE('O', 'www.alohaclass.com') as `LOCATE` ;

SELECT SUBSTRING(주소, 처음 + 1 , LOCATE('.', 도메인) - 1) AS 도메인
FROM (
SELECT 'www.alohaclass.com' AS 주소
, LOCATE('.', 'www.alohaclass.com') AS 처음
, SUBSTR('www.alohaclass.com', LOCATE('.', 'www.alohaclass.com') + 1) AS 도메인
FROM DUAL
) AS 체크
;

-- 대상 문자열을 왼쪽/오른쪽에 출력하고
-- 빈 공간을 특정 문자로 채우는 쿼리
SELECT 'ALOHACLASS' AS 원문
, LPAD('ALOHACLASS', 20, '*') AS 왼쪽
, RPAD('ALOHACLASS', 20, '*') AS 오른쪽
, RPAD(LPAD('ALOHACLASS', 15, '*'), 20, '*') AS 가운데