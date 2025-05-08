-- Active: 1745889706777@@127.0.0.1@3306@aloha

select ROW_NUMBER() over (
        PARTITION BY
            dept_no
        order by salary desc
    ) '순번', name, dept_no, salary
from employees

select name, dept_no, salary, RANK() over (
        PARTITION BY
            dept_no
        order by salary desc
    ) '순위'
from employees

SELECT
    name,
    dept_no,
    SUM(salary) OVER (
        PARTITION BY
            dept_no
    ) AS dept_count1,
    SUM(salary) OVER (
        ORDER BY dept_no
    ) AS dept_count2,
    SUM(salary) OVER (
        PARTITION BY
            dept_no
        ORDER BY salary
    ) AS dept_count3
FROM employees;

SELECT * FROM employees

SELECT name, salary, NTILE(4) OVER (
        ORDER BY salary DESC
    ) AS quartile
FROM employees
ORDER BY salary;

SELECT name, LAG(salary, 1) OVER (
        ORDER BY NAME
    ) AS 앞, salary, LEAD(salary, 1) OVER (
        ORDER BY NAME
    ) AS 뒤
FROM employees
ORDER BY NAME;

SELECT name, salary, LAST_VALUE(salary) OVER (
        PARTITION BY
            dept_no
        ORDER BY
            salary DESC 
        ROWS BETWEEN UNBOUNDED PRECEDING
            AND UNBOUNDED FOLLOWING
    ) AS lowest_salary
    , LAST_VALUE(salary) OVER (
        PARTITION BY
            dept_no
        ORDER BY
            salary DESC 
    ) AS lowest_salary
FROM employees;