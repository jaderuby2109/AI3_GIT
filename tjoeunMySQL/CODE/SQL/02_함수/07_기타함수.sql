-- Active: 1745889706777@@127.0.0.1@3306@aloha

-- CASE WHEN 조건 THEN 결과 ELSE 결과 END
-- 조건에 따른 결과를 반환하는 조건문
SELECT
    name,
    dept_no,
    CASE
        WHEN dept_no = '101' THEN '1호실'
        WHEN dept_no = '102' THEN '2호실'
        WHEN dept_no = '103' THEN '3호실'
        WHEN dept_no = '104' THEN '4호실'
        ELSE '5호실'
    END as 교실
FROM employees
-- where 교실 = '1호실' ;






-- IF(조건, 참일 때 값, 거짓일 때 값)
-- 조건에 따라 서로 다른 값을 반환
SELECT
    name,
    dept_no,
    IF(dept_no = '101' , '1호실', '5호실') as '101',
    IF(dept_no = '102' , '2호실', '5호실') as '102',
    IF(dept_no = '103' , '3호실', '5호실') as '103'
FROM employees


-- VERSION()
-- MySQL 서버 버전 정보를 반환

-- DATABASE()
-- 현재 선택된 데이터베이스 이름을 반환

-- USER()
-- 현재 접속한 사용자 정보를 반환
select VERSION(), DATABASE(), USER()