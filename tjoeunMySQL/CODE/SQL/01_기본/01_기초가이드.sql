-- Active: 1745889706777@@127.0.0.1@3306@test

----- 계정 생성
CREATE USER 'test'@'localhost' 
IDENTIFIED BY '123456';

----- 권한 부여
-- GRANT 권한 ON 데이터베이스명.테이블명 TO '사용자명'@'호스트';
-- ALL PRIVILEGES     모든 권한 부여
-- WITH GRANT OPTION  권한 부여 가능
GRANT ALL PRIVILEGES 
ON *.* 
TO 'test'@'localhost' 
WITH GRANT OPTION;

----- 데이터베이스(스키마) 생성
-- CREATE DATABASE 데이터베이스명;
-- 식별자가 키워드(예약어)와 같은 경우 `이름` 형태로 정의 할 수 있다.
CREATE DATABASE `test`;

----- 테이블 생성
-- CREATE TABLE 테이블명 (
--     컬럼명1 데이터타입 [NULL/NOT NULL] [DEFAULT 기본값] [제약조건] [COMMENT '주석'],
--     컬럼명2 데이터타입 [NULL/NOT NULL] [DEFAULT 기본값] [제약조건] [COMMENT '주석'],
--     컬럼명3 데이터타입 [NULL/NOT NULL] [DEFAULT 기본값] [제약조건] [COMMENT '주석'],
--     ...
-- ) COMMENT='테이블 설명';
-- AUTO_INCREMENT 자동증가 옵션 : PRIMARY KEY에 사용할 수 있는 옵션
-- 데이터베이스에서는 대소문자 구분이 없어서 스테이크 케이스 (_); 언더스코어 케이스를 사용한다.
-- 데이터 타입
-- 제약 조건
CREATE TABLE `board` (
    `no`         INT          AUTO_INCREMENT PRIMARY KEY  COMMENT '번호' , 
    `id`         VARCHAR(64)  UNIQUE                      COMMENT '아이디' ,
    `title`      VARCHAR(100) NOT NULL                    COMMENT '제목' ,
    `writer`     VARCHAR(45)  NOT NULL                    COMMENT '작성자' ,
    `content`    TEXT                                     COMMENT '내용' ,
    `created_at` TIMESTAMP    NOT NULL DEFAULT now()      COMMENT '등록일자' ,
    `updated_at` TIMESTAMP    NOT NULL DEFAULT now()      COMMENT '수정일자'
) COMMENT '게시판';

----- 테이블 수정
-- 컬럼 추가
-- ALTER TABLE 테이블명 ADD COLUMN 새로운열 데이터타입;
ALTER TABLE board
ADD COLUMN `views` INT NOT NULL DEFAULT 0 COMMENT '조회수';

-- 컬럼 삭제
-- ALTER TABLE 테이블명 DROP COLUMN 삭제할열;
ALTER TABLE board DROP COLUMN views;

-- 테이블 구조 확인
DESC board;


----- 테이블 데이터 전체 삭제
-- 되돌리기 불가
TRUNCATE TABLE board ;

----- 테이블 삭제
DROP TABLE IF EXISTS `board` ;


----- 데이터 추가
INSERT INTO board (no, id, title, writer, content, created_at, updated_at)
VALUES (1, UUID(), '제목01', '작성자01', '내용01', now(), now()) ;
INSERT INTO board (id, title, writer, content)
VALUES (UUID(), '제목02', '작성자02', '내용02') ;

-- 모든 컬럼 생략 시, 모든 값을 다 지정해야 한다. -> 테이블 생성시 컬럼 순서
INSERT INTO board
VALUES (3, UUID(), '제목03', '작성자03', '내용03', now(), now(), 0) ;

----- 데이터 조회
-- SELECT *
-- FROM 테이블명
-- WHERE 조건
-- GROUP BY 그룹기준컬럼 HAVING 그룹 조건  
-- ORDER BY 정렬기준컬럼 [ASC | DESC]      -- ASC :오름차순, DESC 내림차순

SELECT * FROM board ;
SELECT * FROM board WHERE title = '제목01' ;
SELECT * FROM board ORDER BY created_at DESC ;

----- 데이터 수정
-- UPDATE 테이블명
-- SET 컬럼명1 = '수정할 값' ,컬럼명2 = '수정할 값' ,...
-- WHERE 조건
UPDATE board
SET title = "수정01", updated_at = now()
WHERE no = 1 ;


----- 데이터 삭제
-- DELETE FROM 테이블명
-- WHERE 조건;
DELETE FROM board
WHERE no = 1 ;


----- TCL 실습 : 트랜젝션
-- 트랜젝션 시작
START TRANSACTION ;

-- 게시글 데이터 추가
INSERT INTO board (id, title, writer, content)
VALUES (UUID(), '제목001', '작성자001', '입력하려던 글') ;
INSERT INTO board (id, title, writer, content)
VALUES (UUID(), '제목002', '작성자002', '잘못된 글') ;

ROLLBACK ;   -- 트랜젝션 수행 변경 사항 취소

START TRANSACTION ;

INSERT INTO board (id, title, writer, content)
VALUES (UUID(), '제목001', '작성자001', '입력하려던 글') ;

COMMIT ;     -- 트랜젝션 수행 변경 사항 적용