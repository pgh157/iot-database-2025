# iot-database-2025
iot 개발자 데이터베이스 저장소

## 1일차
- 데이터베이스 시스템
    - 통합된 데이터를 저장해서 운영하면서, 동시에 여러사람이 사용할 수 있도록 하는 시스템
    - 실시간 접근, 계속 변경, 동시 공유가 가능, 내용으로 참조(물리적으로 떨어져 있어도 사용가능)
    
    - DBMS - SQL Server, Oracle, MySQL, MariaDB, MongoDB...

- 데이터베이스 언어
    - SQL - Structured Query Language. 구조화된 질의 언어(프로그래밍언어와 동일)
        - DDL : DB나 테이블 생성, 수정, 삭제 언어
        - DML : 데이터 검색, 삽입, 수정, 삭제 언어
        - DCL : 권한 부여, 해제 제어 언어

- MySQL 설치 (Docker)
    1. 파워셀을 오픈
        ```shell
        > docker -v
        Docker version 27.5.1, build 9f9e405
        ```

    2. MySQL Docker 이미지 다운로드
        ```shell
        > docker pull mysql
        Status: Downloaded newer image for mysql:latest
        docker.io/library/mysql:latest
        ```

    3. MySQL Image 확인
        ```shell
        > docker images
        REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
        mysql        latest    146682692a3a   4 weeks ago   1.09GB
        ```

    4. Docker 컨테이너 생성
        - MYSQL Port 번호는 3306이 기본
        - Oracle Port  1521
        - SQL server 1433
        ```shell
        > docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=12345 -d -p 3306:3306 mysql:latest
        ```

    5. 컨테이너 확인
        ```shell
        > docker ps -a
        CONTAINER ID   IMAGE          COMMAND                   CREATED          STATUS          PORTS
        NAMES
        16fec42319db   mysql:latest   "docker-entrypoint.s…"   20 seconds ago   Up 19 seconds   0.0.0.0:3306->3306/tcp, 33060/tcp   mysql-container
        ```

    6. Docker 컨테이너 시작, 중지, 재시작
        ```shell
        > docker stop mysql-container      # 중지
        > docker start mysql-container     # 시작
        > docker restart mysql-container   # 재시작
        ```

    7. MySQL Docker 컨테이터 접속
        ```shell
        > docker exec -it mysql-container bash # bash: 리눅스의 powershell
        bash-5.1# mysql -u root -p
        Enter password:
        Welcome to the MySQL monitor.  Commands end with ; or \g.
        Your MySQL connection id is 10
        Server version: 9.2.0 MySQL Community Server - GPL

        Copyright (c) 2000, 2025, Oracle and/or its affiliates.

        Oracle is a registered trademark of Oracle Corporation and/or its
        affiliates. Other names may be trademarks of their respective
        owners.

        Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

        mysql> show databases;
        +--------------------+
        | Database           |
        +--------------------+
        | information_schema |
        | mysql              |
        | performance_schema |
        | sys                |
        +--------------------+
        4 rows in set (0.01 sec)
        ```
- Workbench 설치
    - https://dev.mysql.com/downloads/workbench/  MySQL Installer 8.0.41 다운로드설치
    - MySQL Installer에서 Workbench, Sample 만 설치

    - Workbench 실행 후
        1. MySQL Connections + 클릭
    
- 관계 데이터 모델
    - 3단계 DB 구조 : 외부 스키마(실세계와 매핑) -> 개념 스키마(DB논리적 설계) -> 내부 스키마(물리적 설계) -> DB
    - 모델에 쓰이는 용어
        - 릴레이션 - 테이블과 매핑
        - 속성 - 테이블 column
        - 튜플 - 테이블 row
        - 관계 - 릴레이션 간의 부모, 자식 연관
    
    - `무결성 제약조건`
        - 키 - **기본키**, **외래키**, 슈퍼키, 후보키, 대리키, 대체키
        - 개체 무결성 제약조건, 참조 무결성 제약조건, 도메인 무결성 제약조건

- SQL 기초
    - SQL 개요

    ```sql
    -- DML SELECT 문
    SELECT publisher, price
	FROM Book
    WHERE bookname = '축구의 역사'; -- 주석임
    ```

## 2일차
- SQL 기초
    - ...