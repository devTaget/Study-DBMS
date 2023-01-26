CREATE SEQUENCE SEQ_USER;

/*회원번호, 아이디, 이름, 비밀번호, 전화번호, 닉네임, 이메일, 주소, 생년월일, 성별, 추천인 아이디*/
CREATE TABLE TBL_USER(
	USER_ID NUMBER CONSTRAINT PK_USER PRIMARY KEY,
	USER_IDENTIFICATION VARCHAR2(500) UNIQUE NOT NULL,
	USER_NAME VARCHAR2(500) NOT NULL,
	USER_PASSWORD VARCHAR2(500) NOT NULL,
	USER_PHONE VARCHAR2(100) NOT NULL,
	USER_NICKNAME VARCHAR2(500),
	USER_EMAIL VARCHAR2(100) CONSTRAINT UK_USER UNIQUE NOT NULL,
	USER_ADDRESS VARCHAR2(500),
	USER_BIRTH DATE,
	USER_GENDER CHAR(1) DEFAULT 'N' CHECK(USER_GENDER IN('M', 'W', 'N')),
	USER_RECOMMENDER_ID VARCHAR2(500)
);

INSERT INTO TBL_USER
(USER_ID, USER_IDENTIFICATION, USER_NAME, USER_PASSWORD, USER_PHONE, USER_EMAIL, USER_ADDRESS)
VALUES(SEQ_USER.NEXTVAL, 'hds1234', '한동석', '1234', '01012341234', 'hds1234@gmail.com', '경기도 남양주시');

SELECT * FROM TBL_USER;