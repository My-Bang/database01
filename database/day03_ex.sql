-- 연습문제
-- 1-1
select bookname
from book
where bookid = 1;

-- 1-2
select bookname
from book
where price >= 20000;

-- 1-3
select sum(saleprice)
from orders
where custid = 1;

-- 1-4
select count(bookid)
from orders
where custid = 1;

-- 2-1
select count(bookid)
from book;

-- 2-2
select distinct count(publisher)
from book;

-- 2-3
select name, address
from customer;

-- 2-4 
select orderid
from orders
where orderdate between str_to_date('2024/07/04', '%Y/%m/%d') and str_to_date('2024/07/07', '%Y/%m/%d')
order by  orderdate;

-- 2-5
select orderid
from orders
where orderdate not between str_to_date('2024/07/04', '%Y/%m/%d') and str_to_date('2024/07/07', '%Y/%m/%d')
order by  orderdate;


-- 2-6
select name, address
from customer
where name like '김%';


-- 2-7
select name, address
from customer
group by name
having name like '김%아';












