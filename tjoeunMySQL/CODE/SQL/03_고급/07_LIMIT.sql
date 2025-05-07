-- Active: 1745889706777@@127.0.0.1@3306@employees
select NOW();
select SYSDATE();
select CURTIME();
select CURDATE();
select CURRENT_DATE();
select CURRENT_TIMESTAMP();
select DATE(NOW());
select TIME(NOW());
select YEAR(NOW());
select MONTH(NOW());
select DAY(NOW());
select HOUR(NOW());
select MINUTE(NOW());
select SECOND(NOW());
select DATE_FORMAT(NOW(), '%Y-%m-%d');
select STR_TO_DATE(NOW(), '%Y-%m-%d');
select DATEDIFF('2025-05-10', '2025-05-01');
select TIMESTAMPDIFF(DAY, '2025-05-01', '2025-05-10');
select ADDDATE(NOW(), INTERVAL 10 DAY);
select SUBDATE(NOW(), INTERVAL 5 DAY);
select LAST_DAY(NOW());
select WEEKDAY(NOW());
select DAYOFYEAR(NOW());
select DAYOFMONTH(NOW());
select DAYOFWEEK(NOW());




select DATE_FORMAT birth_date from employees



SELECT CAST('123' AS UNSIGNED);

SELECT CAST(123.45 AS CHAR);
SELECT CONVERT('2025-05-01', DATE);
SELECT CONVERT('한글' USING utf8);
SELECT BINARY 'abc' = 'ABC';
SELECT CHAR_LENGTH('안녕');
SELECT LENGTH('안녕');
SELECT HEX(255);
SELECT UNHEX('FF');
SELECT BIN(5);
SELECT OCT(10);
SELECT CONV('A', 16, 10);
SELECT FORMAT(12345.6789, 2);


SELECT DATE_FORMAT(NOW(), '%Y-%m-%d');
SELECT STR_TO_DATE('2025-10-10', '%Y-%m-%d');