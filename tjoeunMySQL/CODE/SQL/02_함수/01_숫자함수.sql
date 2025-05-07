-- dual  
-- 연산이나 테이블이 없는 결과값을 출력하기 위한 임시 테이블
select 1 + 1 from dual ;


-- 숫자 함수
select CEIL(12.45),  CEIL(-12.45) from dual ;
select FLOOR(12.55),  FLOOR(-12.55) from dual ;
-- round (값, 자리수) : 지정한 값을, 해당 자리수에서 반올림하는 함수

-- 0.54를 소수점 아래 첫째 자리에서 반올림하시오.
select round(0.54, 0) from dual ;

-- 0.54를 소수점 아래 둘째 자리에서 반올림하시오.
select round(0.54, 1) from dual ;

-- 125.67를 일의 자리에서 반올림하시오.
select round(125.67, -1) from dual ;

-- 125.67를 십의 자리에서 반올림하시오.
select round(125.67, -2) from dual ;

select ROUND(12.55),ROUND(12.45),  ROUND(-12.45),  ROUND(-12.55) from dual ;

-- 3을 8로 나눈 나머지
select 3 % 8, mod(3 , 8) from dual

-- 30을 4로 나눈 나머지
select mod(30 , 4) from dual

-- 2의 10제곱
select pow(2 , 10) from dual

-- 2의 31제곱
select pow(2 , 31) from dual

-- 9의 제곱근
select SQRT(9) 

-- 100의 제곱근
select SQRT(100) 

-- 절삭
-- TRUNCATE(실수, 자리수)
-- : 해당 수를 절삭하는 함수
select TRUNCATE(123.45, -2);  -- 십의 자리 절삭
select TRUNCATE(123.45, -1);  -- 일의 자리 절삭
select TRUNCATE(123.45, 0);  -- 소수점 아래 절삭
select TRUNCATE(123.45, 1);  -- 소수점 아래 둘째 자리 절삭
select TRUNCATE(123.45, 2);  -- 소수점 아래 셋째 자리 절삭

-- 절댓값
select abs(-20)

-- 랜덤
select TRUNCATE((RAND() * 45) +1, 0)

