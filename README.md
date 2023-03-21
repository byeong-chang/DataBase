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

# 1장 데이터베이스 시스템

### 데이터베이스 개념

- DB = 조직에 필요한 정보를 얻기 위해 논리적으로 연관된 데이터를 모아 구조적으로 통합해 놓은 것
- DBMS = 사용자와 데이터베이스를 연결시켜주는 소프트웨어
- DBMS 서버의 목적 = 데이터의 일관성 유지 ,복구 ,동시 접근 제어 등
- 데이터 모델 = 데이터가 저장되는 기법에 관한 내용
- DB시스템은 주로 변경과 검색 작업을 수행함. 변경이란 변한 데이터 값을 반영하기 위한 삽입, 삭제, 수정 등의 작업을 말함.

### 데이터베이스 특징

1. real time accessibility = 사용자가 데이터를 요청하면 수 초 내에 결과를 서비스해야한다.
2. Continuous change = 데이터베이스에 저장된 내용은 어느 한 순간의 상태를 나타내지만 , 데이터 값은 시간에 따라 항상 바뀐다. 데이터베이스는 insert, delete, update 등의 작업을 통하여 바뀐 데이터 값을 저장한다
3. Cocurrent sharing = 데이터베이스는 서로 다른 업무 또는 여러 사용자에게 동시에 공유된다. 동시는 병행이라고도 하며, 데이터베이스에 접근하는 프로글매이 여러개 있다는 의미이다.
4. Reference by content = 데이터베이스에 저장된 데이터는 데이터의 물리적인 위치가 아니라 데이터 값에 따라 참조된다.

### 정보통신 기술의 발전에 따른 성장

![image](https://user-images.githubusercontent.com/43203949/226575465-5e174f5b-faa7-4f2f-b7df-58f792106913.png)

### 데이터 저장 방식

1. 데이터를 프로그램 내부에 저장하는 방법

![image](https://user-images.githubusercontent.com/43203949/226575428-518457c7-ad43-4606-adba-e3a0aca8aed5.png)

1. 파일 시스템을 사용하는 방법

![image](https://user-images.githubusercontent.com/43203949/226575394-9a2e8f7d-a088-47b8-b834-a7177c098dd1.png)

1. DBMS를 사용하는 방법 

![image](https://user-images.githubusercontent.com/43203949/226575367-c7db70c9-de19-44fc-a7b5-db145a5b92d6.png)

### 파일 시스템과 DBMS의 차이

![image](https://user-images.githubusercontent.com/43203949/226575330-3634ac8d-ebab-4dcb-a1c7-a549d2bc359f.png)

### DBMS의 장점

1. 데이터를 공유하기 때문에 중복 가능성이 낮음
2. 중복 제거로 데이터의 일관성이 유지됨
3. 데이터 정의와 프로그램의 독립성 유지가능함
4. 데이터 복구, 보안, 동시성 제어, 데이터 관리 기능 등을 수행
5. 짧은 시간에 큰 프로그램을 개발할 수 있음
6. 데이터 무결성 유지 , 데이터 표준 준수에 용이함

### 데이터베이스 시스템의 구성

![image](https://user-images.githubusercontent.com/43203949/226575310-4e6fa97c-af60-40b0-9342-d25baeadd150.png)

## 데이터베이스 언어

### SQL

- 데이터 정의어(DDL, Data Definition Language) : 데이터의 구조를 정의하고, 데이터 구조에 대한 삭제 및 변경 기능
- 데이터 조작어(DML, Data Manipulation Language) : 데이터를 조작하는 소프트웨어(응용 프로그램)가 요청하는 데이터의 삽입, 수정, 삭제 작업을 지원하거나 사용자가 조회하는 데이터 혹은 응용 프로그램의 데이터를 추출.
- 데이터 제어어(DCL, Data Control Language) : 데이터베이스 사용자를 생성하고 모니터링하며 접근을 제어함, 백업과 회복, 동시성 제어 등의 기능을 지원

## 데이터 모델

여러 데이터 모델이 존재하지만 Relational data model이 대부분의 DBMS 프로그램들이 채택한 모델이다.

- 속성 값을 사용하여 데이터 간의 관계를 표현함.

![image](https://user-images.githubusercontent.com/43203949/226575260-f97c0725-681c-4f82-9095-de39b44924ab.png)


## 3단계 데이터베이스 구조

![image](https://user-images.githubusercontent.com/43203949/226575201-3973c77e-1f7a-49e0-b2dd-d72e23513626.png)

### 외부 스키마

- 일반 사용자나 응용 프로그래머가 접근하는 계층으로 전체 데이터베이스 중에서 하나의 논리적인 부분을 의미함.
- 여러 개의 외부 스키마가 있을 수 있음
- 서브 스키마라고도 하며, 뷰의 개념임


수강 등록 담당                                                  시간표 담당 부tj
![image](https://user-images.githubusercontent.com/43203949/226574905-c5fe182b-cb2c-42e4-8b82-2a865856412a.png)

### 개념 스키마

- 전체 데이터베이스의 정의를 의미
- 통합 조직별로 하나만 존재하며 DBA가 관리함
- 하나의 데이터베이스에는 하나의 개념 스키마가 있음

![image](https://user-images.githubusercontent.com/43203949/226574807-e9c642f5-8006-4d4f-b3e3-82290d19a597.png)

### 내부 스키마

- 물리적 저장 장치에 데이터베이스가 실제로 저장되는 방법의 표현
- 내부 스키마는 하나
- 인덱스, 데이터 레코드의 배치 방법, 데이터 압축 등에 관한 사항이 포함됨.

![image](https://user-images.githubusercontent.com/43203949/226574776-dc9d2162-f308-4e2e-871c-4e2c0939dd7f.png)

### 외부 / 개념 매핑

- 사용자의 외부 스키마와 개념 스키마 간의 매핑(사상)
- 외부 스키마의 데이터가 개념 스키마의 어느 부분에 해당되는지 대응시킴

### 개념 / 내부 매핑

- 개념 스키마의 데이터가 내부 스키마의 물리적 장치 어디에 어떤 방법으로 저장되는지 대응시킴.

### 논리적 데이터 독립성

- 외부 단계(외부 스키마)와 개념 단계(개념 스키마) 사이의 독립성
- 개념 스키마가 변경되어도 외부 스키마에는 영향을 미치지 않도록 지원
- 논리적 구조가 변경되어도 응용 프로그램에는 영향이 없도록 하는 개념
- 개념 스키마의 테이블을 생성하거나 변경하여도 외부 스키마가 직접 다루는 테이블이 아니면 영향이 없음

### 수강신청 데이터베이스의 3단계 구조

![image](https://user-images.githubusercontent.com/43203949/226574741-5c54d848-b6be-4cd7-aa72-623d255bbe18.png)

### 물리적 데이터 독립성

- 개념 단계(개념 스키마)와 내부 단계(내부 스키마) 사이의 독립성
- 저장장치 구조 변경과 같이 내부 스키마가 변경되어도 개념 스키마에 영향을 미치치 않도록 지원
- 성능 개선을 위하여 물리적 저장 장치를 재구성할 경우 개념 스키마나 응용 프로그램 같은 외부 스키마에 영향이 없음.
- 물리적 독립성은 논리적 독립성보다 구현하기 쉬움.

# 2장 관계 데이터 모델
