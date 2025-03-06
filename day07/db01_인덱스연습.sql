-- 기존테이블삭제
DROP TABLE IF EXISTS NewBook;

-- 테이블 생성
CREATE TABLE NewBook(
	bookid		INTEGER AUTO_INCREMENT PRIMARY key,
    bookname	VARCHAR(100),
    publisher	VARCHAR(100),
    price INTEGER
);

-- 500만건 더미데이터 생성
SET SESSION cte_max_recursion_depth = 5000000;

-- 더미데이터 생성
insert into NewBook (bookname, publisher, price)
with RECURSIVE cte(n) as
(
	SELECT 1
    union all
    SELECT n+1 from cte where n < 5000000

)
select concat('Book', lpad(n, 7, '0')) -- Book5000000
	 , concat('Cmp', lpad(n, 7, '0')) -- Comp5000000
     , floor(3000 + rand() * 30000) as price -- 책가격 3000 ~ 33000
  from cte;
  
-- 데이터 확인
select count(*) from NewBook;

-- 가격을 7개 정도 검색할수 있는 쿼리 작성
SELECT * from NewBook
 WHERE price in(8377, 14567, 24500, 33000, 5600, 6700, 15000);
 
-- 인덱스 생성
CREATE INDEX idx_book on NewBook(price);