-- Active: 1745889706777@@127.0.0.1@3306@aloha
select * from test.employees;

WITH RECURSIVE
    org_chart AS (
        SELECT
            id,
            name,
            manager_id,
            1 AS level,
            name AS path
        FROM test.employees
        WHERE
            manager_id IS NULL
        UNION ALL
        SELECT e.id, e.name, e.manager_id, oc.level + 1, CONCAT(oc.path, ' > ', e.name)
        FROM test.employees e
            JOIN org_chart oc ON e.manager_id = oc.id
    )
SELECT *
FROM org_chart
ORDER BY path;

WITH
    sales_total AS (
        SELECT emp_id, SUM(amount) AS total_sales
        FROM sales
        GROUP BY
            emp_id
    ),
    top_sellers AS (
        SELECT emp_id
        FROM sales_total
        WHERE
            total_sales > 10000
    )
SELECT e.name, s.total_sales
FROM employees e
    JOIN sales_total s ON e.id = s.emp_id
WHERE
    e.id IN (
        SELECT emp_id
        FROM top_sellers
    );