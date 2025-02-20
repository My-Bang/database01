use ssgdb;
-- ssgdb 데이터베이스의 모든 테이블 이름 리스트를 출력하라
show tables;
-- book테이블의 bookname, publisher 컬럼의 정보를 출력하라
select  bookname, publisher from book;
-- book 테이블의 전체 정보를 출력하라
select * from book;

select bookname, publisher, price
from book
where  price <=10000;

-- Oracle, Mysql, MariaDB, PostgreeSQL 관계형 데이터베이스 시스템(RDBMS)




-- book 테이블의 구조
describe book;
desc book;

create database shopdb;


-- shopdb
create database shopdb;
use shopdb;
CREATE TABLE memberTBL (
  memberID varchar(8) not null,
  memberName VARCHAR(10) not null,
  memberAddress VARCHAR(20)
 -- primary key(memberID)
  );
  
  CREATE TABLE productTBL (
  productName varchar(4) not null,
  cost int not null,
  makeDate date
   -- primary key(productID)
  );

desc producttbl;

-- 테이블 수정(productID 새로운 컬럼 추가)
alter table productTBL ADD COLUMN productID int not null unique;

-- 테이블 수정 (productID 컬럼 삭제)
alter table productTBL drop column productID;

alter table productTBL change column cost price int;

-- productName 컬럼 앞에 productID 컬럼을 추가
alter table productTBL add column  productID int not null first;

-- 테이블에 지정 컬럼 뒤에 추가
alter table productTBL add column descript varchar(100) not null after price;

-- 컬럼 타입 변경
alter table productTBL modify column price smallint;

use ssgdb;

select bookname, price
from book;

select price, bookname
from book;

select bookid, bookname, publisher, price
from book;

select publisher
from book;

select DISTINCT publisher
from book;

select *
from book
where price < 20000;

select *
from book
where price between 10000 AND 20000;


select *
from book
where publisher IN('굿스포츠', '대한미디어');

select *
from book
where publisher NOT IN('굿스포츠', '대한미디어');


-- 문자열의 패턴을 비교할 때 LIKE 연산자 사용 일부 문자가 포함된 문자를 검색 %
select bookname, publisher
from book
where bookname LIKE('축구의 역사');


-- 3-8
select bookname, publisher
from book
where bookname LIKE '%축구%';

-- 3-9
select *
from book
where bookname LIKE '_구%';

-- 3-10
select *
from book
where bookname LIKE '%축구%' AND price >= 20000;

-- 3-11
select *
from book
where publisher IN ('굿스포츠' , '대한미디어');

-- 3-12 order by 컬럼 오름차순(asc) 내림차순(desc)
select *
from book
order by bookname;

-- 3-13 order by 절을 사용하면 특정순서를 지정하여 출력할 수 있다.
select *
from book
order by price, bookname;


-- 3-14
select *
from book
order by price desc, publisher asc;

-- 3-15
select sum(saleprice) AS 총매출
from orders;




































