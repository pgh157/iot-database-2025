-- 1번
select Email, Mobile, Names, Addr -- 이메일, 모바일, 이름, 주소 순서
from membertbl;

-- 2번
select Names as 도서명, Author as 저자, ISBN, Price as 정가 from bookstbl order by ISBN; -- 별칭(as) 사용과 ISBN 오름차순 

-- 3번
select * from rentaltbl;

-- 4번
select * from divtbl;
	   