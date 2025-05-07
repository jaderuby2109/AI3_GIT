-- Active: 1745889706777@@127.0.0.1@3306@employees
-- Active: 1745889706777@@127.0.0.1@3306@aloha
SELECT dept_no,
          e.emp_no, e.first_name, e.last_name, e.gender,
          m.emp_no mgr_emp_no, 
          m.first_name mgr_first_name, 
          m.last_name mgr_last_name, 
          m.gender mgr_gender
     FROM dept_emp de
     JOIN employees e ON de.emp_no = e.emp_no
     JOIN dept_manager dm ON de.dept_no = dm.dept_no
     JOIN employees m ON dm.emp_no = m.emp_no
     WHERE de.from_date <= CURDATE() AND de.to_date >= CURDATE()
     AND dm.from_date <= CURDATE() AND dm.to_date >= CURDATE()


select YEAR(hire_date) from employees 
GROUP BY YEAR(hire_date)
order by YEAR(hire_date)
;

-- 1. 백업 또는 이름 변경
-- 2. 파티션 테이블 생성
-- 3. 데이터 이관

-- 1. 테이블 이름 변경
rename table employees to employees_backup ;

-- 2. 파티션 테이블 생성
CREATE TABLE `employees_backup` (
  `emp_no` int NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`, `hire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
PARTITION BY RANGE (YEAR(hire_date)) (
    PARTITION p0 VALUES LESS THAN (1990),
    PARTITION p1 VALUES LESS THAN (1995),
    PARTITION p2 VALUES LESS THAN (2000),
    PARTITION p3 VALUES LESS THAN MAXVALUE
)

-- 3. 데이터 이관
insert into employees_backup
select * from employees ;


SELECT * FROM employees_backup PARTITION (p3);

select * 
from information_schema.PARTITIONS
where `TABLE_NAME` = 'employees_backup'


SHOW INDEX FROM dept_emp WHERE Key_name = 'PRIMARY';


SELECT * -- `TABLE_SCHEMA`, `COLUMN_NAME`
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'employees'
  AND TABLE_NAME = 'dept_emp'
  AND CONSTRAINT_NAME = 'PRIMARY'