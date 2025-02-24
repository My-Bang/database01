-- 1. 운영자적 관점 SQL : 집계(aggregate) -> 집계함수(aggregate function) 제공
-- 집계함수란 테이블의 각 열에 대해 계산하는 함수

-- 1. 고객(customer)이 주문한 도서의 총 판매액을 구해보자
-- 3-15
select sum(saleprice) AS 총매출
from orders;

-- 3-16
select sum(saleprice) AS 총매출
from orders
where custid = 2;

-- 3-17
select sum(saleprice) as Total, avg(saleprice) as average, min(saleprice) as Minimum, max(saleprice) as maximum
from orders;

-- 3-18		count() -> 행의 개수를 셈 count(*) 전체 튜플의 수 반환하는데 Null을 제거하고 반환(그래서 기본키로 주는게 안전)
select count(orderid)
from orders;


-- group by절 사용하면 속성값이 같은 값끼리 그룹을 만들수 있다.
 
select * from customer;

-- 3-19
select custid as 고객아이디, count(bookid) as 도서수량, sum(saleprice) as 총액
from Orders
group by custid;


-- 3-20
select custid, bookid, saleprice from orders order by custid;

select custid, count(bookid) as 도서수량, saleprice, bookid	-- 5)
from orders		-- 1)
where saleprice >= 8000		-- 2)
group by custid			-- 3)
having count(bookid) >=2		-- 4)
order by custid;			-- 6)

select  bookid, sum(saleprice)
from orders
group by bookid;































