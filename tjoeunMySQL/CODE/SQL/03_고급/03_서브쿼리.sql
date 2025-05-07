-- Active: 1745889706777@@127.0.0.1@3306@aloha
-- 단일행, 다중행

-- 전체 사원 중 가장 높은 급여를 받는 사원 조회
USE EMPLOYEES;

SELECT EMP_NO, (
        SELECT FIRST_NAME
        FROM EMPLOYEES E
        WHERE
            E.EMP_NO = S.EMP_NO
    ) AS 이름, SALARY 급여
FROM SALARIES S
WHERE
    SALARY = (
        SELECT MAX(SALARY)
        FROM SALARIES
    )

USE ALOHA;

SELECT *
FROM EMPLOYEES
WHERE
    EMP_NO IN (
        SELECT EMP_NO
        FROM DEPARTMENT
        WHERE
            DEPT_NO = 103
    )

-- 부서가 있는 사원만 
SELECT *
FROM EMPLOYEES e
WHERE
    EXISTS (
        SELECT dept_no
        FROM DEPARTMENT d
        WHERE
            d.dept_no = e.dept_no
    )

-- 부서가 없는 사원만 
SELECT *
FROM EMPLOYEES e
WHERE
    not EXISTS (
        SELECT dept_no
        FROM DEPARTMENT d
        WHERE
            d.dept_no = e.dept_no
    )

-- 부서 번호 102인 부서의 최소 급여보다 높은 급여를 받는 사원 조회
-- 부서 번호 103인 부서의 최대 급여보다 높은 급여를 받는 사원 조회
-- 최솟값보다 큰거
SELECT * FROM employees
WHERE salary > ANY
(SELECT salary FROM employees WHERE dept_no = 102)

-- 최솟값보다 작은거
SELECT * FROM employees
WHERE salary < ANY
(SELECT salary FROM employees WHERE dept_no = 102)

-- 최댓값보다 큰거
SELECT * FROM employees
WHERE salary > ALL
(SELECT salary FROM employees WHERE dept_no = 102)

-- 최댓값보다 작은거
SELECT * FROM employees
WHERE salary < ALL
(SELECT salary FROM employees WHERE dept_no = 102)

SELECT * FROM employees
WHERE salary > 
(SELECT MIN(salary) FROM employees WHERE dept_no = 102)

SELECT * FROM employees
WHERE salary >
(SELECT MAX(salary) FROM employees WHERE dept_no = 102)




SELECT salary FROM employees ORDER BY salary

SELECT MAX(salary), MIN(salary) FROM employees WHERE dept_no = 102

USE EMPLOYEES;