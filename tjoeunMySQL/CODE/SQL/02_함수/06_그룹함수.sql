-- Active: 1745889706777@@127.0.0.1@3306@aloha

-- 사원 수를 구하시오
SELECT count(*) 
FROM employees

-- 최고 급여, 최저 급여
SELECT max(salary), min(salary) 
from employees

-- 급여 합계, 급여 평균
SELECT sum(salary), avg(salary) 
from employees

-- 그룹 (그룹 기준) 부서별 급여의 합계, 평균, 최고급여, 최저급여
SELECT dept_no
, avg(salary) '평균', sum(salary) '합계'
, max(salary) '최고', min(salary) '최저'
from employees
GROUP BY
    dept_no

-- GROUP_CONCAT()
-- 부서별 사원 이름을 , 로 구분하여 출력
SELECT dept_no
, GROUP_CONCAT(name) '사원이름'
, GROUP_CONCAT(name SEPARATOR ', ') '구분자'
, GROUP_CONCAT(name order by name ) '이름순'
, GROUP_CONCAT(name order by name SEPARATOR ', ') '구분자'
from employees 
GROUP BY dept_no