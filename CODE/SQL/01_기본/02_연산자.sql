-- Active: 1745889706777@@127.0.0.1@3306@aloha
-- employees 스키마


-- 연봉에 1000달러 더해서 출력
select emp_no, salary , salary+ 1000 as '인상예정'  
from salaries ;

-- 연봉에 2배 출력
select emp_no, salary , salary * 2 as '인상예정'  
from salaries ;

-- 월급 출력
select emp_no, salary , salary / 12 as '월급'  , (salary / 12)*1400 as '월급원화'  
from salaries 
order by salary desc
LIMIT 100 ;

-- 2000년 1월 1일 이후 입사
select COUNT(*) from employees 
where hire_date >= '2000-01-01'
order by hire_date desc;

select count(*) from employees 
where first_name = 'marko';

select count(*) from employees 
where first_name <> 'marko';

select count(*) from employees 
where first_name != 'marko';

-- 연봉이 50000이하인 사원번호와 연봉 조회
select emp_no, salary
from salaries 
where salary <= 50000 ;

-- 1995년 이후 입사하고 생년월일이 1960년 미만인 사원
select ROW_NUMBER() OVER () AS 번호, emp_no from employees
where hire_date >= '1995-01-01'
and birth_date < '1960-01-01'
LIMIT 10;


-- 성별이 남자인 사원들의 이름과 'jagoda'인 사원
select * from employees
where gender = 'm'
or first_name = 'dante'
order by gender desc 

-- 부서 이력 테이블에서 
-- 부서 번호가 d001, d002, d003 중 하나인 사원 조회
select * from dept_emp
where dept_no in ('d001', 'd002', 'd003 ');

-- 부서 번호가 d005, d006 아닌 사원 조회
select * from dept_emp
where dept_no not in ('d005', 'd006');

-- 부서가 없는 사원을 조회
SELECT * from dept_emp WHERE dept_no is null;
SELECT * from dept_emp WHERE dept_no is not null;









select * from dept_emp
where dept_no = 'd003' 
and to_date < '1985-12-31'
ORDER BY to_date;

select * 
from employees 
where emp_no in (select emp_no from dept_emp
where dept_no = 'd003' 
and to_date < '1985-12-31'
) 




-- 급여가 80000달러 이상이거나 입사일이 1988년 이전인 사원번호 조회
-- UNION : 두 쿼리를 합집합으로 조회 (중복 조회)
select count(*) from (
select emp_no from salaries where salary >= 80000
UNION
select emp_no from employees WHERE hire_date > '1988-01-01' ) as t ;

select emp_no from salaries where salary >= 80000
UNION all
select emp_no from employees WHERE hire_date > '1988-01-01' ;



/*
  연산자
  - 산술연산자 : +, -, *, /, %
  - 비교연산자 : =, !=, <>, >, <, >=, <=
  - 논리 연산자 : BETWEEN A AND B, NOT, IN, LIKE, IS NULL, AND, ON , UNION, UNION ALL
*/
--연봉이 50000 이상 60000 이하인 사원 번호 조회
SELECT * FROM salaries
WHERE salary >= 50000 AND salary <=60000 ;
SELECT * FROM salaries
WHERE salary BETWEEN 50000 AND 60000;

SELECT * FROM employees WHERE first_name LIKE '_____'

-- LIKE
-- _ : 한 글자 대체
-- % : 공백 또는 한 글자 이상 대체

-- 성이 B로 시작하고 이름이 5글자 인 사원을 조회하시오.
SELECT * FROM employees
WHERE last_name LIKE 'b____%'


-- 이름이 M으로 시작하는 사원을 조회하시오.
SELECT * FROM employees
WHERE first_name LIKE 'm%'

SELECT * FROM employees
WHERE first_name NOT LIKE '%S'

SELECT * FROM employees
WHERE first_name LIKE '%X%'