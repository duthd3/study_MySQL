DROP DATABASE IF EXISTS naver_db;
CREATE DATABASE naver_db;

USE naver_db;
DROP TABLE IF EXISTS member;
CREATE TABLE member -- 회원 테이블
(	mem_id	CHAR(8),
	mem_name VARCHAR(10),
    mem_number TINYINT,
    addr	CHAR(2),
    phone1	CHAR(3),
    phone2	CHAR(8),
    height TINYINT UNSIGNED,
    debut_date	DATE
);

DROP TABLE IF EXISTS member;
CREATE TABLE member -- 회원 테이블
(	mem_id	CHAR(8) NOT NULL,
	mem_name VARCHAR(10) NOT NULL,
    mem_number TINYINT NOT NULL,
    addr	CHAR(2) NOT NULL,
    phone1	CHAR(3) NULL,
    phone2	CHAR(8) NULL,
    height TINYINT UNSIGNED NULL,
    debut_date	DATE NULL
);

DROP TABLE IF EXISTS member;
CREATE TABLE member -- 회원 테이블
(	mem_id	CHAR(8) NOT NULL PRIMARY KEY,
	mem_name VARCHAR(10) NOT NULL,
    mem_number TINYINT NOT NULL,
    addr	CHAR(2) NOT NULL,
    phone1	CHAR(3) NULL,
    phone2	CHAR(8) NULL,
    height TINYINT UNSIGNED NULL,
    debut_date	DATE NULL
);

DROP TABLE IF EXISTS buy;
CREATE TABLE buy
(	num	INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	mem_id CHAR(8) NOT NULL,
    prod_name CHAR(6) NOT NULL,
    group_name CHAR(4) NULL,
    price INT UNSIGNED NOT NULL,
    amount SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY(mem_id) REFERENCES member(mem_id)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015-10-19');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', '163', '2016-8-8');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015-1-15');

INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);

USE naver_db;
DROP TABLE IF EXISTS buy, member;
CREATE TABLE member
(	mem_id CHAR(8) NOT NULL PRIMARY KEY,
	mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL
);
DESCRIBE member;
DROP TABLE IF EXISTS member;
CREATE TABLE member
(	mem_id CHAR(8) NOT NULL,
	mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL,
    PRIMARY KEY(mem_id)
);

DROP TABLE IF EXISTS member;
CREATE TABLE member
(	mem_id CHAR(8) NOT NULL,
	mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL
);
ALTER TABLE member
	ADD CONSTRAINT
    PRIMARY KEY(mem_id);
CREATE TABLE buy
(
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    mem_id CHAR(8) NOT NULL,
    prod_name CHAR(6) NOT NULL,
    FOREIGN KEY(mem_id) REFERENCES member(mem_id)
);

INSERT INTO member VALUES('BLK', '블랙핑크', 163);
INSERT INTO buy VALUES(NULL, 'BLK', '지갑');
INSERT INTO buy VALUES(NULL, 'BLK', '맥북');

SELECT M.mem_id, M.mem_name, B.prod_name
	FROM buy B
		INNER JOIN member M
        ON B.mem_id = M.mem_id;
UPDATE member SET mem_id = 'PINK' WHERE mem_id = 'BLK';

DROP TABLE IF EXISTS buy;
CREATE TABLE buy
(	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	mem_id CHAR(8) NOT NULL,
    prod_name CHAR(6) NOT NULL
);
ALTER TABLE buy
	ADD CONSTRAINT
	FOREIGN KEY(mem_id) REFERENCES member(mem_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;
INSERT INTO buy VALUES(NULL, 'BLK', '지갑');
INSERT INTO buy VALUES(NULL, 'BLK', '맥북');

UPDATE member SET mem_id = 'PINK' WHERE mem_id = 'BLK';

SELECT M.mem_id, M.mem_name, B.prod_name
	FROM buy B
		INNER JOIN member M
        ON B.mem_id = M.mem_id;

DELETE FROM member WHERE mem_id = 'PINK';
SELECT * FROM buy;

DROP TABLE IF EXISTS buy, member;
CREATE TABLE member
(	mem_id CHAR(8) NOT NULL PRIMARY KEY,
	mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL,
    email CHAR(30) NULL UNIQUE
);

INSERT INTO member VALUES('BLK', '블랙핑크', 163, 'pink@gmail.com');
INSERT INTO member VALUES('TWC', '트와이스', 167, NULL);
INSERT INTO member VALUEs('APN', '에이핑크', 164, 'pink@gmail.com');

DROP TABLE IF EXISTS member;
CREATE TABLE member
(	mem_id	CHAR(8) NOT NULL PRIMARY KEY,
	mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL CHECK(height>=100),
    phone1 CHAR(3) NULL
);

INSERT INTO member VALUES('BLK', '블랙핑크', 163, NULL);
INSERT INTO member VALUES('TWC', '트와이스', 99, NULL);

ALTER TABLE member
	ADD CONSTRAINT
    CHECK (phone1 IN('02', '031', '032', '054', '055', '061'));
INSERT INTO member VALUES('TWC', '트와이스', 167, '02');
INSERT INTO member VALUES('OMY', '오마이걸', 167, '010');

DROP TABLE IF EXISTS member;
CREATE TABLE member
(	mem_id	CHAR(8) NOT NULL PRIMARY KEY,
	mem_name VARCHAR(10) NOT NULL,
    height	TINYINT UNSIGNED NULL DEFAULT 160,
    phone1 CHAR(3) NULL
);

ALTER TABLE member
	ALTER COLUMN phone1 SET DEFAULT '02';
INSERT INTO member VALUES('RED', '레드벨벳', 161, '054');
INSERT INTO member VALUEs('SPC', '우주소녀', default, default);
SELECT * FROM member;

USE market_db;
SELECT mem_id, mem_name, addr FROM member;

CREATE VIEW v_member
AS
	SELECT mem_id, mem_name, addr FROM member;
    
SELECT * FROM v_member;

SELECT mem_name, addr FROM v_member
		WHERE addr IN ('서울', '경기');

CREATE VIEW v_memberbuy
AS
	SELECT B.mem_id, M.mem_name, B.prod_name, M.addr,
		CONCAT(M.phone1, M.phone2) '연락처'
	FROM buy B
		INNER JOIN member M
        ON B.mem_id = M.mem_id;

SELECT * FROM v_memberbuy
	WHERE mem_name = '블랙핑크';

CREATE VIEW v_viewtest1
AS
	SELECT B.mem_id 'Member ID', M.mem_name AS 'Member Name',
			B.prod_name "Product Name",
			CONCAT(M.phone1, M.phone2) AS "Office Phone"
		FROM buy B
			INNER JOIN member M
            ON B.mem_id = M.mem_id;
SELECT DISTINCT `Member ID`, `Member Name` From v_viewtest1;

DROP VIEW v_viewtest1;

CREATE OR REPLACE VIEW v_viewtest2
AS	
	SELECT mem_id, mem_name, addr From member;
DESCRIBE v_viewtest2;

DESCRIBE member;

SHOW CREATE VIEW v_viewtest2;

UPDATE v_member SET addr ='부산' WHERE mem_id='BLK';
SELECT * FROM v_member;

CREATE VIEW v_height167
AS
	SELECT * FROM member WHERE height >= 167;
SELECT * FROM v_height167;

ALTER VIEW v_height167
AS
	SELECT * FROM member WHERE height >= 167
		WITH CHECK OPTION;

INSERT INTO v_height167 VALUES('TOB', '텔레토비', 4, '영국', NULL, NULL, 140, '1995.10.11');

USE market_db;
DROP VIEW IF EXISTS v_member;
CREATE VIEW v_member
AS
	SELECT mem_id, mem_name, addr FROM member;
SELECT * FROM v_member;

SELECT mem_name, addr FROM v_member
	WHERE addr IN('서울', '경기');
    
SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, CONCAT(M.phone1, M.phone2) '연락처'
	FROM buy B
		INNER JOIN member M
        ON B.mem_id = M.mem_id;

DROP VIEW IF EXISTS v_memberbuy;

CREATE VIEW v_memberbuy
AS 
	SELECT B.mem_id, M.mem_name, B.prod_name, M.addr,
		CONCAT(M.phone1, M.phone2) '연락처'
        FROM buy B
			INNER JOIN member M
            ON B.mem_id = M.mem_id;
SELECT * FROM v_memberbuy WHERE mem_name = '블랙핑크';

CREATE VIEW v_viewtest1
AS
	SELECT B.mem_id 'Member ID', M.mem_name AS 'Member Name', B.prod_name "Product Name",
		CONCAT(M.phone1, M.phone2) AS "Office Phone"
	FROM buy B
		INNER JOIN member M
        ON B.mem_id = M.mem_id;
SELECT DISTINCT `Member ID`, `Member Name` FROM v_viewtest1;

DROP VIEW IF EXISTS v_viewtest2;


CREATE OR REPLACE VIEW v_viewtest2
AS
	SELECT mem_id, mem_name, addr FROM member;
DESCRIBE v_viewtest2;
DESCRIBE member;

UPDATE v_member SET addr = '용인' WHERE mem_id = 'BLK';
SELECT * FROM member;

DROP VIEW IF EXISTS v_height167;

CREATE VIEW v_height167
AS
	SELECT * FROM member WHERE height >=167;
SELECT * FROM v_height167;

ALTER VIEW v_height167
AS
	SELECT * FROM member WHERE height >=167
		WITH CHECK OPTION;
INSERT INTO v_height167 VALUES('TOB', '텔레토비', 4, '영국', NULL, NULL, 140, '1995-01-01');
DROP TABLE IF EXISTS buy, member;
SELECT * FROM v_height167;
