-- 두 개 이상의 테이블을 이용한 SQL질의 방법
-- 박지성 고객이 주문한 도서의 총 구매액은 38000
-- Join은 한 테이블의 행을 다른 테이블의 행에 연결하여 두 개 이상의 테이블을 결합하는 연산

select * from customer , orders;
select count(custid) from customer; -- 5명
select count(orderid) from orders; -- 10건
-- 5 X 10 = 50 (조건이 없는 테이블간의 조인을 Cross Join)

-- 고객과 고객의 주문에 관한 데이터를 모두 출력하시오(동등조인 equi join)
select * 
from customer , orders
where customer.custid = orders.custid
order by customer.custid;

-- 3-23
select c.name, o.saleprice
from customer c , orders o
where c.custid = o.custid;

-- 3-24
select c.name, sum(saleprice)
from customer c , orders o
where c.custid = o.custid
group by c.name
order by c.name;

-- 3-25
select c.name, b.bookname
from customer c , book b, orders o
where c.custid = o.custid and b.bookid = o.bookid;

-- 3-26
select c.name, b.bookname
from customer c , book b, orders o
where c.custid = o.custid and b.bookid = o.bookid and b.price = 20000;


-- 3-27 외부조인(outer join)
select c.name, o.saleprice
from customer c left outer join orders o 
on c.custid = o.custid;

-- 3-28 서브쿼리(부속질의 = 중첩질의)
select bookname
from book
where price = (select max(price) from book);
-- subquery 결과는 테이블로 반환됨
-- 단일행 - 단일열( 1 x 1 )		연산자 =
-- 다중행 - 단일열( n x 1 )		연산자 in 
-- 단일행 - 다중열( 1 x n )
-- 다중행 - 다중열( n x n ) 

-- 도서를 구매한 적이 있는 고객의 이름을 출력하세요
select custid from orders;

select name
from customer
where custid in (select custid from orders);



select name
from customer
where custid in (select custid from orders where bookid in (select bookid from book where publisher = '대한미디어'));


SELECT * FROM ssgdb.book;
SELECT * FROM ssgdb.orders;
SELECT * FROM ssgdb.customer;

-- 부속질의 간에는 상하관계가 있다. 먼저 하위부속질의를 실행하고, 그 결과를 이용하여 상위 부속 질의를 실행한다.

-- 상관 부속질의(correlated subquery) 상위 부속질의와 하위 부속질의 가 독립적이지 않고 서로 관련을 맺고 있다.

select * from book where publisher = '굿스포츠';
select publisher, avg(price) from book group by publisher;

select b1.bookname, b1.price
from book b1
where b1.price > 
(select avg(b2.price) from book b2 where b2.publisher = b1.publisher);





