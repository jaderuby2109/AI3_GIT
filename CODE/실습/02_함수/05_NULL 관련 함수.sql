-- Active: 1745889706777@@127.0.0.1@3306@aloha

-- IFNULL(표현식1, 표현식2)
-- 표현식1이 NULL이면 표현식2를 반환
SELECT salary 
, salary * 12 AS '급여'
, commission_pct '커미션비율'
, salary * (IFNULL(commission_pct, 0)) AS '커미션'
, salary * 12 * (1 + IFNULL(commission_pct, 0)) AS '최종 급여'
, bonus
, salary * 12 * (1 + IFNULL(commission_pct, 0)) + IFNULL(bonus, 0) AS '보너스 추가 급여'
FROM employees

update employees
set salary = salary / 10
, bonus = bonus / 10


-- NULLIF(A, B)
-- A 와 B 가 같으면 NULL 반환, 다르면 A
select emp_no, salary , nullif(salary, 350)
from employees


-- COALESCE(값1, 값2, ..., 값n)
-- NULL이 아닌 첫 번째 값을 반환
-- 사원이 1년동안 받는 기본급 외의 수당을 출력
-- 단, 커미션과 보너스가 둘 다 있는 경우는 커미션만 출력
SELECT emp_no
, name
,COALESCE((salary*commission_pct)*12, bonus, 0) AS '수당'
,COALESCE((salary*commission_pct)*12 + IFNULL(bonus,0), bonus, 0) AS '수당'
from employees


-- 사원이 1년동안 받는 기본급 외의 수당을 출력
SELECT emp_no
, name
, IFNULL((commission_pct*salary)*12,0) + IFNULL(bonus,0) as 수당
, COALESCE((commission_pct*salary)*12, bonus, 0) as 수당
from employees
