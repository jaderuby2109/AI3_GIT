-- Active: 1745889706777@@127.0.0.1@3306@employees
-- NOW() : 현재 날짜/시간, CURDATE() : 현재 날짜, CURTIME() : 현재 시간
SELECT NOW(), CURDATE(), CURTIME();

-- DATE(날짜/시간), TIME(날짜/시간)
-- YEAR(날짜 OR 날짜/시간), MONTH(날짜 OR 날짜/시간), DAY(날짜 OR 날짜/시간)
SELECT DATE(NOW()) AS 날짜
, TIME(NOW()) AS 시간
, YEAR(CURDATE()) AS 년
, MONTH(CURDATE()) AS 월
, DAY(CURDATE()) AS 일;

-- 이번달에 입사한 사원
SELECT * FROM employees
WHERE MONTH(hire_date) = MONTH(NOW())
LIMIT 10;

-- 이번달에 생일인 사원
SELECT * FROM employees
WHERE MONTH(birth_date) = MONTH(NOW())
LIMIT 10;


-- 오늘로부터 5년뒤는 몇년도
SELECT  YEAR( DATE_ADD(NOW(), INTERVAL 5 YEAR) ) AS 5년후;

-- 입사한지 30년이 넘은 사원 조회
SELECT hire_date 
FROM employees
WHERE TIMESTAMPDIFF(YEAR, hire_date, NOW()) >= 40
ORDER BY hire_date ;

SELECT hire_date 
FROM employees
WHERE DATE_ADD(hire_date, INTERVAL 40 YEAR) <= NOW()
ORDER BY hire_date ;


SELECT hire_date 
FROM employees
WHERE YEAR(CURDATE()) - YEAR(hire_date) >= 40
ORDER BY hire_date ;

-- 종강일이 10일 남은 날을 구하기
-- 날짜 형식 기호 %Y %m %d %H %i %s
SELECT STR_TO_DATE('2025-09-17', '%Y-%m-%d') ;


SELECT DATE_SUB(STR_TO_DATE('2025-09-17', '%Y-%m-%d') , INTERVAL 10 DAY) AS 종강10일전;
SELECT DATE_SUB(STR_TO_DATE('2025-09-17', '%Y-%m-%d') , INTERVAL 2 MONTH) AS 종강10일전;
SELECT DATE_SUB(STR_TO_DATE('2025-09-17', '%Y-%m-%d') , INTERVAL 1 YEAR) AS 종강10일전;

-- DATE_ADD(날짜, INTERVAL 값 단위)
DATE_SUB(날짜, INTERVAL 값 단위)
DATEDIFF(날짜1, 날짜2)
STR_TO_DATE(문자열, 형식)


SELECT abs(DATEDIFF(from_date,  to_date)) AS 근속년수
FROM dept_emp
WHERE to_date <> '9999-01-01'
ORDER BY 근속년수 DESC

SELECT DISTINCT(TIMESTAMPDIFF(YEAR, from_date, to_date)) AS 근속년수
FROM dept_emp
WHERE to_date <> '9999-01-01'
ORDER BY 근속년수 DESC

SELECT DISTINCT(TIMESTAMPDIFF(YEAR, from_date, to_date)) AS 근속년수
FROM dept_emp
WHERE YEAR(to_date) <> '9999'
ORDER BY 근속년수 DESC

SELECT * FROM dept_emp