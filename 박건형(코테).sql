-- 1번
select Email as email  -- 문제에 Email이 아니고 email여서 별칭사용함.
	 , Mobile as mobile
     , Names as names
     , Addr as addr -- 이메일, 모바일, 이름, 주소 순서
from membertbl;

-- 2번
select Names as 도서명
	 , Author as 저자
	 , ISBN, Price as 정가 
  from bookstbl 
 order by ISBN; -- 별칭(as) 사용과 ISBN 오름차순 

-- 3번
select Names as 비대여자명
	 , Levels as 등급
     , Addr as 주소
     , null as 대여일  
  from membertbl 
 where Idx not in(select memberIdx from rentaltbl) 
 order by Levels, Names;


-- 4번
SELECT 
COALESCE(b.Names,'--합계--') as 장르, 
concat(format(sum(a.price),0), '원') as 총합계금액
  FROM bookstbl as a, divtbl as b
 where a.Division = b.Division
 group by b.Names with rollup;
	   