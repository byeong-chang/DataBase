# DataBase

### 데이터 분석 과정

- 데이터 수집 → 데이터 전처리 → 모델링 → 평가 및 배포
- 데이터 수집
    - 외부 데이터(정형/반정형/비정형)
    - 내부 데이터
        - DBMS  = orcle , mysql 과 같은 database를 관리할 수 있는 system
            - RDBMS가 가장 효율적이라는 이론이 밝혀짐
            - 정형화된 데이터를 다룸

database = 하나의 컴퓨터안에 저장될 수 없는 큰 데이터를 다루는 범주

자료구조 = 하나의 application 단위에서 수행하는데 필요로 하는 데이터 용량(범위)를 다루는 범주

### RDBMS 제품군

- Oracle, MySQL, MSSQL…

### 네트워크

: 두 대상간의 데이터 교환

- 프로토콜 = 네트워크를 통해 데이터가 교환되려면 쌍방간의 규약을 지켜야 한다.
- Oracle 프로토콜 = TCP/IP를 사용하기로 함.
- DB client 역시 오라클 서버에 원하는 데이터 처리를 하려면 TCP/IP 규약에 맞춰 데이터 전송을 해야한다.
- tcp/ip 규약은 정확한 전송을 위해 데이터 전송전에 Connection을 통해 통신가능 여부를 확인 후, 데이터 전송이 이루어진다.

Oracle Database SE = 전역데이터

![image](https://user-images.githubusercontent.com/43203949/226564806-809b91a6-036a-47e1-858f-5faf441c7432.png)

### db 명령어 모음집

sqlplus
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql
show user

-1. 유저생성(비밀번호생성)
--CREATE USER[유저 이름]IDENRIFIED BY[비밀번호]
CREATE USER dba_user IDENTIFIED BY pass;
CREATE USER web_user IDENTIFIED BY pass;
CREATE USER user002 IDENTIFIED BY pass3;
--생성 유저 확인
--유저가 바꿔줄수 있는거는 소문자로 그외에 원래 있는거나 명령어는 대문자
SELECT USERNAME FROM DBA_USERS;
--2. 비밀번호 변경
--ALTER USER [유저이름] IDENTIFIED BY [변경할 비밀번호];
ALTER USER web_user IDENTIFIED BY pass;
--3. 유저 삭제
--DROP USER[유저이름]
DROP USER dab_user;
DROP USER user002;
--4. 권한 부여
--GRANT[권한]TO[대상 유저]
GRANT CONNECT,RESOURCE,DBA TO web_user;
GRANT CREATE TABLE, CREATE VIEW TO web_user;
GRANT CONNECT,DBA TO dba_user;
--5. 권한 회수
--REVOKE[권한]FROM[대상유저]
REVOKE DBA FROM web_user;
--CREATE,ALTER,DROP

### 데이터에 이상이 발생하면 데이터 무결성이 지켜질 수 없음.
