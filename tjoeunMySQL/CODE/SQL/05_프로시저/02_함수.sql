
DROP FUNCTION IF EXISTS calculate_month_salary;
DELIMITER //

CREATE FUNCTION calculate_month_salary(p_emp_no INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC   -- 동일한 입력에 대해 항상 동일한 출력 반환
READS SQL DATA  -- READ ONLY
BEGIN
    DECLARE month_salary DECIMAL(10,2);
    
    SELECT salary / 12
    INTO month_salary
    FROM salaries
    WHERE emp_no = p_emp_no
    and from_date < CURDATE()
    AND to_date > CURDATE()
    ORDER BY from_date DESC
    LIMIT 1
    ;
    
    RETURN month_salary;
END //

DELIMITER ;

SELECT emp_no, first_name, gender
, calculate_month_salary(emp_no)
from employees
LIMIT 20;




-- 사원의 근무 기간(년) 계산 함수
DELIMITER //

CREATE FUNCTION calculate_years_of_service(p_emp_no INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE years INT;
    
    SELECT TIMESTAMPDIFF(YEAR, hire_date, CURDATE())
    INTO years
    FROM employees
    WHERE emp_no = p_emp_no;
    
    RETURN years;
END //

DELIMITER ;


-- 부서 이름 조회 함수
DELIMITER //

CREATE FUNCTION get_department_name(p_dept_no CHAR(4))
RETURNS VARCHAR(40)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE p_dept_name VARCHAR(40);
    
    SELECT dept_name
    INTO p_dept_name
    FROM departments
    WHERE dept_no = p_dept_no;
    
    RETURN p_dept_name;
END //

DELIMITER ;



select * from (
SELECT e.emp_no, e.first_name, e.gender
, calculate_month_salary(e.emp_no) as '월급'
, calculate_years_of_service(e.emp_no) as '근속년수'
, get_department_name(d.dept_no) as '부서명'
from employees e
left join dept_emp d
on e.emp_no = d.emp_no
) a order by 근속년수
-- order by num
LIMIT 20;

