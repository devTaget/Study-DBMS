/*PLAYER 테이블에서 TEAM_ID가 'K01'인 선수*/
SELECT * FROM PLAYER
WHERE TEAM_ID = 'K01';

/*PLAYER 테이블에서 TEAM_ID가 'K01'이 아닌 선수*/
SELECT * FROM PLAYER
WHERE TEAM_ID <> 'K01';

SELECT * FROM PLAYER
WHERE TEAM_ID != 'K01';

SELECT * FROM PLAYER
WHERE TEAM_ID ^= 'K01';

/*PLAYER 테이블에서 WEIGHT가 70이상이고 80이하인 선수*/
SELECT * FROM PLAYER
WHERE WEIGHT >= 70 AND WEIGHT <= 80;

SELECT * FROM PLAYER
WHERE WEIGHT BETWEEN 70 AND 80;

/*PLAYER 테이블에서 TEAM_ID가 'K03'이고 HEIGHT가 180미만인 선수*/
SELECT * FROM PLAYER
WHERE TEAM_ID = 'K03' AND HEIGHT < 180;

/*PLAYER 테이블에서 TEAM_ID가 'K06'이고 NICKNAME이 '제리'인 선수*/
SELECT * FROM PLAYER
WHERE TEAM_ID = 'K06' AND NICKNAME = '제리';

/*PLAYER 테이블에서 HEIGHT가 170이상이고 WEIGHT가 80이상인 선수 이름*/
SELECT * FROM PLAYER
WHERE HEIGHT >= 170 AND WEIGHT >= 80;

/*STADIUM 테이블에서 SEAT_COUNT가 30000 초과이고 41000이하인 경기장*/
SELECT * FROM STADIUM
WHERE SEAT_COUNT > 30000 AND SEAT_COUNT <= 41000;

/*PLAYER 테이블에서 TEAM_ID가 'K02'이거나 'K07'이고 포지션은 'MF'인 선수*/
SELECT * FROM PLAYER
WHERE (TEAM_ID = 'K02' OR TEAM_ID = 'K07') AND "POSITION" = 'MF';

SELECT * FROM PLAYER
WHERE TEAM_ID IN('K02', 'K07') AND "POSITION" = 'MF';

/*PLAYER 테이블에서 TEAM_ID가 'K01'인 선수 이름을 내 이름으로 바꾸기*/
SELECT PLAYER_NAME FROM PLAYER
WHERE TEAM_ID = 'K01';

UPDATE PLAYER
SET PLAYER_NAME = '한동석'
WHERE TEAM_ID = 'K01';

/*PLAYER 테이블에서 POSITION이 'MF'인 선수 삭제하기*/
SELECT * FROM PLAYER
WHERE "POSITION" = 'MF';

DELETE FROM PLAYER
WHERE "POSITION" = 'MF';

/*PLAYER 테이블에서 HEIGHT가 180이상인 선수 삭제하기*/
SELECT * FROM PLAYER
WHERE HEIGHT >= 180;

DELETE FROM PLAYER
WHERE HEIGHT >= 180;

ROLLBACK;

/*PLAYER 테이블에서 NICKNAME이 NULL인 선수 검색*/
SELECT PLAYER_NAME, NVL(NICKNAME, '없음') FROM PLAYER
WHERE NICKNAME IS NULL;

/*PLAYER 테이블에서 POSITION이 NULL인 선수 검색*/
SELECT * FROM PLAYER
WHERE "POSITION" IS NULL;

/*PLAYER 테이블에서 POSITION이 NULL인 선수를 '미정'으로 변경 후 검색*/
SELECT PLAYER_NAME, NVL("POSITION", '미정') FROM PLAYER;

/*PLAYER 테이블에서 NATION이 등록되어 있으면 '등록', 아니면 '미등록'으로 검색*/
SELECT PLAYER_NAME, NVL2(NATION, '등록', '미등록') FROM PLAYER;

/*AS(ALIAS): 별칭*/
/*SELECT절에서는 컬럼명 뒤에 띄어쓰고 작성하거나, AS 뒤에 작성한다.*/
SELECT PLAYER_NAME, NVL(NICKNAME, '없음') AS NICKNAME FROM PLAYER
WHERE NICKNAME IS NULL;

SELECT PLAYER_NAME, NVL("POSITION", '미정') "포지션 여부" FROM PLAYER;

/*선수 이름과 생일 조회*/
SELECT PLAYER_NAME "선수 이름", BIRTH_DATE "선수 생일" FROM PLAYER;

/*PLAYER 테이블에서 BACK_NO를 "등 번호"로, NICKNAME을 "선수 별명"으로 변경하여 검색*/
SELECT PLAYER_NAME, BACK_NO "등 번호", NICKNAME AS "선수 별명" FROM PLAYER;

/*위 결과에서 NICKNAME이 NULL일 경우 "없음"으로 변경*/
SELECT PLAYER_NAME, BACK_NO "등 번호", NVL(NICKNAME, '없음') AS "선수 별명" FROM PLAYER;

/*CONCATENATION: 연결, ||*/

/*PLAYER_NAME의 별명은 NICKNAME이다.*/
SELECT PLAYER_NAME || '의 별명은 ' || NICKNAME || '이다.' AS 자기소개 FROM PLAYER;

/*PLAYER_NAME의 영어이름은 E_PLAYER_NAME이다.*/
SELECT PLAYER_NAME || '의 영어이름은 ' || E_PLAYER_NAME || '이다.' 자기소개 FROM PLAYER;

/*PLAYER_NAME의 포지션은 POSITION입니다.*/
SELECT PLAYER_NAME || '의 포지션은 ' || NVL("POSITION", '미정') || '입니다.' "포지션 소개" FROM PLAYER;

/*LIKE : 포함된 문자열 값을 찾고, 문자의 개수도 제한을 줄 수 있다.*/
/*
 * [컬럼명] LIKE '';
 * 
 * %: 모든 것
 * _: 글자 수
 * 
 * 예) 
 * '%A'   : A로 끝나는 모든 값
 * 'A%'   : A로 시작하는 모든 값
 * '%A%': A가 포함된 모든 값
 * 'A__': A로 시작하고 3글자인 값   
 * '_A'   : A로 끝나고 2글자인 값
 * */

/*TEAM 테이블에서 '천마'로 끝나는 팀 이름 찾기*/
SELECT * FROM TEAM
WHERE TEAM_NAME LIKE '%천마';

/*PLAYER 테이블에서 김씨 찾기*/
SELECT * FROM PLAYER
WHERE PLAYER_NAME LIKE '김%';

/*PLAYER 테이블에서 김씨 두 자 찾기*/
SELECT * FROM PLAYER
WHERE PLAYER_NAME LIKE '김_';

/*PLAYER 테이블에서 김씨와 이씨 찾기*/
SELECT * FROM PLAYER
WHERE PLAYER_NAME LIKE '김%' OR PLAYER_NAME LIKE '이%'; 

/*PLAYER 테이블에서 이씨가 아닌 사람 찾기(NOT)*/
SELECT * FROM PLAYER
WHERE PLAYER_NAME NOT LIKE '이%';

SELECT * FROM PLAYER
WHERE NOT PLAYER_NAME LIKE '이%'; 

/*집계 함수: 결과는 무조건 1개*/
/*
 * ※ NULL은 포함시키지 않는다.
 * ※ WHERE절에서 사용 불가.
 * 
 * 
 * 평균   : AVG()
 * 최대값   : MAX()
 * 최소값   : MIN()
 * 총 합   : SUM()
 * 개수   : COUNT()
 * 
 * */

SELECT AVG(HEIGHT), MAX(HEIGHT), MIN(HEIGHT), SUM(HEIGHT), COUNT(HEIGHT) FROM PLAYER;

/*PLAYER 테이블에서 HEIGHT로 총 선수 명수 검색*/
SELECT COUNT(NVL(HEIGHT, 0)) "총 인원" FROM PLAYER;

/*정렬*/
/*
 * ORDER BY 컬럼명, ... ASC   : 오름 차순
 * ORDER BY 컬럼명, ... DESC   : 내림 차순
 * 
 * */

/*키 순 정렬*/
SELECT PLAYER_NAME, HEIGHT, WEIGHT FROM PLAYER
WHERE HEIGHT IS NOT NULL
ORDER BY HEIGHT DESC, WEIGHT;

/*
 * GROUP BY: ~별 (예: 포지션 별 평균 키)
 * 
 * GROUP BY 컬럼명 HAVING 조건식
 * ※ WHERE절에 우선적으로 처리할 조건식을 작성해야 속도가 빠르다.
 * ※ HAVING절에서는 집계함수 사용 가능
 * 
 * */
/*PLAYER 테이블에서 포지션 종류 검색*/
SELECT "POSITION", COUNT("POSITION") FROM PLAYER
WHERE "POSITION" IS NOT NULL
GROUP BY "POSITION";

/*PLAYER 테이블에서 몸무게가 80이상인 선수들의 평균 키가 180이상인 포지션 검색*/
SELECT "POSITION", MIN(WEIGHT), AVG(HEIGHT) FROM PLAYER
WHERE WEIGHT >= 80
GROUP BY "POSITION"
HAVING AVG(HEIGHT) >= 180;

/*EMPLOYEES 테이블에서 JOB_ID별 평균 SALARY가 10000미만인 JOB_ID 검색, JOB_ID 알파벳순 정렬*/
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) < 10000
ORDER BY JOB_ID;

/*
 * SUB QUERY
 * 
 * FROM절: IN LINE VIEW
 * SELECT절: SCALAR SUB QUERY
 * WHERE절: SUB QUERY
 * 
 * */

/*PLAYER 테이블에서 TEAM_ID가 'K01'인 선수 중 POSITION이 'GK'인 선수*/
SELECT * FROM
(
   SELECT * FROM PLAYER
   WHERE TEAM_ID = 'K01'
)
WHERE "POSITION" = 'GK';

/*정남일 선수가 소속된 팀의 선수들 조회*/
SELECT * FROM PLAYER
WHERE TEAM_ID = (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '정남일');

/*PLAYER 테이블에서 전체 평균 키와 포지션별 평균 키 구하기*/
SELECT "POSITION", AVG(HEIGHT) AS "포지션별 평균 키", (SELECT AVG(HEIGHT) FROM PLAYER) "전체 평균 키"
FROM PLAYER
WHERE "POSITION" IS NOT NULL
GROUP BY "POSITION";

/*경기장 중 경기 일정이 20120501~20120502 사이에 있는 경기장 전체 정보 조회*/
SELECT * FROM STADIUM
WHERE STADIUM_ID IN
(
   SELECT STADIUM_ID FROM SCHEDULE
   WHERE SCHE_DATE BETWEEN '20120501' AND '20120502'
);

/*EMPLOYEES 테이블에서 평균 급여보다 낮은 사원들의 급여를 20% 인상*/
SELECT * FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

UPDATE EMPLOYEES
SET SALARY = SALARY * 1.2
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'Bruce';

/*PLAYER 테이블에서 NICKNAME이 NULL인 선수들을 정태민 선수의 닉네임으로 바꾸기*/
UPDATE PLAYER
SET NICKNAME = (SELECT NICKNAME FROM PLAYER WHERE PLAYER_NAME = '정태민')
WHERE NICKNAME IS NULL;

SELECT * FROM PLAYER;

/*PLAYER 테이블에서 평균 키보다 큰 선수들 삭제*/
DELETE FROM PLAYER
WHERE HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER);

SELECT AVG(HEIGHT) FROM PLAYER;
SELECT MAX(HEIGHT) FROM PLAYER;

/*JOIN*/
/*
 * 여러 테이블에 흩어져 있는 정보 중
 * 사용자가 필요한 정보만 가져와서 가상의 테이블처럼 만들고 결과를 보여주는 것.
 * 정규화를 통해 조회 테이블이 너무 많이 쪼개져 있으면 작업이 불편하기 때문에
 * 입력, 수정, 삭제의 성능을 향상시키기 위해서 JOIN을 통해 합친 후 사용한다.
 * 
 * */

/*EMP 테이블 사원번호로 DEPT 테이블의 지역 검색*/
SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT ENAME, LOC 
FROM DEPT D JOIN EMP E
ON D.DEPTNO = E.DEPTNO;

/*PLAYER 테이블에서 송종국 선수가 속한 팀의 전화번호 검색하기*/
SELECT P.TEAM_ID, PLAYER_NAME, TEL
FROM TEAM T INNER JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID AND PLAYER_NAME = '송종국'; 

/*JOBS 테이블에서 JOB_ID로 직원들의 JOB_TITLE, EMAIL, 성, 이름 검색*/
/*EMP 테이블의 SAL을 SALGRADE 테이블의 등급으로 나누기*/
/*EMPLOYEES 테이블에서 HIREDATE가 2003~2005년까지인 사원의 정보와 부서명 검색*/
/*JOB_TITLE 중 'Manager'라는 문자열이 포함된 직업들의 평균 연봉을 JOB_TITLE별로 검색*/
/*EMP 테이블에서 ENAME에 L이 있는 사원들의 DNAME과 LOC 검색*/
/*축구 선수들 중에서 각 팀별로 키가 가장 큰 선수들 전체 정보 검색*/
/*EMP 테이블에서 사원의 이름과 매니저 이름을 검색*/
















