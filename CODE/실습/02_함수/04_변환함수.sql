-- CAST(값 AS 데이터형)
-- 문자열을 숫자로 변환
SELECT CAST('123' AS SIGNED)  AS '숫자1'
, CAST('-123' AS SIGNED INT)  AS '숫자2'
, CAST('123.456' AS DOUBLE)  AS '숫자3' ;


-- 날짜 문자열을 날짜타입(DATE)으로 변환
SELECT '2025-04-30 11:36:50' AS 날짜
, CAST('2025-04-30 11:36:50' AS DATE) AS 날짜로변환
, CAST('2025-04-30 11:36:50' AS DATETIME) AS 날짜시간으로변환;

SELECT '2025-04-30 11:36:50' AS 날짜
, CAST('2025-04-30 11:36:50' AS YEAR) AS 날짜로변환 ;

-- 숫자를 문자로 변환
SELECT CAST(123 AS CHAR) AS 문자;


-- CONVERT(값, 데이터형)
-- 문자열을 DATe 타입으로 변환
SELECT '2025-04-30 11:36:50' AS 날짜문자열
, CONVERT('2025-04-30 11:36:50' , DATE) AS 날짜로변환
, CONVERT('2025-04-30 11:36:50' , DATETIME) AS 날짜시간으로변환 ;

-- 숫자를 CHAR 로 변환
SELECT CONVERT(456, CHAR) AS '문자로 변환';




-- FORMAT(숫자, 소수점자리)
-- 123456.789 를 소수점 아래 둘째 자리까지 천단위 구분기호(,) 포함 출력
SELECT FORMAT(12345.6789, 2) ;

-- 123456.789 를 정수만 천단위 구분기호(,) 포함 출력
SELECT FORMAT(123456.789, 0) ;

-- DATE_FORMAT(날짜, 형식)
-- 오늘 날짜를 2025년 04월 30일 12시 00분 00초 형식으로 출력
-- 문자열 타입으로 출력
SELECT DATE_FORMAT(NOW(), '%Y년 %m월 %d일 %H시 %i분 %s초') as 한글
, DATE_FORMAT(NOW(), '%Y/%m/%d %H:%i:%s') as '/'
, DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') as '-'
, DATE_FORMAT(NOW(), '%Y.%m.%d %H:%i:%s') as '.';

-- 날짜형 타입으로 출력
SELECT STR_TO_DATE ('2025년 04월 30일 11시 45분 11초', '%Y년 %m월 %d일 %H시 %i분 %s초') as 한글
, STR_TO_DATE ('2025/04/30 11:45:11', '%Y/%m/%d %H:%i:%s') as '/'
, STR_TO_DATE ('2025-04-30 11:45:11', '%Y-%m-%d %H:%i:%s') as '-'
, STR_TO_DATE ('2025.04.30 11:45:11', '%Y.%m.%d %H:%i:%s') as '.'
, STR_TO_DATE ('2025-04-30 11:45:11', '%Y.%m.%d %H:%i:%s') as 타입지정미스

