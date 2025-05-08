-- Active: 1745889706777@@127.0.0.1@3306@employees
CREATE EVENT update_dept_salary_stats
ON SCHEDULE EVERY 1 WEEK
STARTS '2025-05-08 00:00:00'
DO
  INSERT INTO dept_salary_stats
  SELECT 
    d.dept_no,
    d.dept_name,
    AVG(s.salary) as avg_salary,
    NOW() as calculated_at
  FROM departments d
    JOIN dept_emp de ON d.dept_no = de.dept_no
  JOIN salaries s ON de.emp_no = s.emp_no
  WHERE s.to_date > NOW()
  GROUP BY d.dept_no, d.dept_name;

-- 스케쥴러 활성화
set global event_scheduler = ON;

set global event_scheduler = OFF;



  select * from information_schema.EVENTS
  where `EVENT_SCHEMA` = DATABASE();

  show VARIABLES LIKE 'event_scheduler';
  
  -- 이벤트 비활성화
  ALTER EVENT update_dept_salary_stats DISABLE ;

  -- 이벤트 활성화
  ALTER EVENT update_dept_salary_stats ENABLE ;