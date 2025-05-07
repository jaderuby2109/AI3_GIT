-- Active: 1745889706777@@127.0.0.1@3306@employees
-- OUT 파라미터 활용
-- EMP_NO 사원 번호를 IN 파라미터로 입력하고,
-- 해당 사원의 최근 발령 일자와 급여를 반환하는 프로시저를 정의하시오.
-- OUT : 발령일자, 급여

DROP PROCEDURE IF EXISTS GET_LAST_DATE_AND_SALARY;
DELIMITER //

CREATE PROCEDURE GET_LAST_DATE_AND_SALARY(
  IN P_EMP_NO INT,
  OUT P_LAST_DATE DATE,
  OUT P_LAST_SALARY INT
)
BEGIN

  -- 최근 발령일자 조회
  SELECT FROM_DATE
  INTO P_LAST_DATE
  FROM DEPT_EMP
  WHERE EMP_NO = P_EMP_NO
  ORDER BY FROM_DATE DESC
  LIMIT 1;

  -- 최근 급여 조회
  SELECT SALARY
  INTO P_LAST_SALARY
  FROM SALARIES
  WHERE EMP_NO = P_EMP_NO
  ORDER BY FROM_DATE DESC
  LIMIT 1;

END //

DELIMITER ;

-- 프로시저 호출
-- OUT 파라미터를 받을 변수 선언
set @last_date = null ;
set @last_salary = null ;

-- 호출
call `GET_LAST_DATE_AND_SALARY`(10080, @last_date, @last_salary);

-- 결과 확인
SELECT @last_date as '최근 발령일자'
     , @last_salary as '최근 급여';
