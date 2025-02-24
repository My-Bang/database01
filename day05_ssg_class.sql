-- 데이터 조작어(DML): select, delete, update, insert
-- 데이터 정의어(DDL): create,drop, alter

-- test database를 생성하여 ssg@localhost 계정이 객체에 대한 모든 권한을 처리할 수 있도록
use testdb;

-- tset_create_table 테이블을 생성하시오, 컬럼은 col_1 int, col_2 varchar(50), col_3 datetime 이다.

create table test_create_table(col_1 int, col_2 varchar(50), col_3 datetime);

-- test_create_table 에 1,'testSQL', '2024-01-01' 데이터를 입력하세요
insert into test_create_table(col_1, col_2, col_3) values(1,'testSQL', '2024-01-01');
insert into test_create_table(col_1, col_2, col_3) values(1,'testSQL', now());

-- 위와 같음
insert into test_create_table values(5,'testSQL', now());


insert into test_create_table(col_1) values(1);

-- 입력된 데이터 혹인하세요 
SELECT * FROM test_create_table;
rollback;

commit;

-- 여러 데이터를 한번에 삽입 
insert into test_create_table
values(8,'testSQL', '2024-01-01'),(9,'testSQL', now()),(10,'testSQL', now());

-- test_create_table 의 cal_1의 컬럼 속성을 변경 col_1의 속성을 int => smallint  not null 속성 추가

alter table test_create_table modify col_1 smallint not null;
desc test_create_table;


-- update 문으로 데이터 수정
-- update 테이블 이름 set 열1, 열2, 열3 (where [열 = 조건]); 
update test_create_table set clo_2 = 'testSQL_UPDATE' where col_1 = 8; 

-- commit 시에는 반영된 데이터 값을 되돌릴 수 없다.
-- DML 작업시 특히 DELETE 작업시 commit작업은 신중히, 취소시 rollback 하면 한단계 취소 

-- delete from 테이블 이름 where 열 = 조건;

delete from test_create_table;
commit;
rollback;
SELECT * FROM test_create_table;
-- -----------------------------------------
create table NewBook(
bookid integer, 
bookname varchar(20), 
publisher varchar(20), 
price integer, 
primary key(bookid));

SELECT * FROM NewBook;
desc NewBook;

alter table NewBook modify bookname varchar(20) not null;
alter table NewBook modify publisher varchar(20) unique;
alter table NewBook modify price integer default 10000 check(price >1000);
ALTER TABLE NewBook DROP PRIMARY KEY;
ALTER TABLE NewBook ADD PRIMARY KEY (bookname, publisher);
 alter table NewBook add isbn varchar(13);
 alter table NewBook modify isbn integer;
 alter table NewBook drop COLUMN isbn;
 alter table NewBook modify bookid varchar(20) not null;
 alter table NewBook add primary key(bookid);
 alter table NewBook modify bookid integer;
 
create table NEWCUSTOMER(
custid integer primary key,
name varchar(40),
address varchar(40),
phone varchar(30)
);
SELECT * FROM NEWCUSTOMER;


create table NewOrders(
orderid integer,
custid integer not null,
bookid integer not null,
saleprice integer,
orderdate date,
primary key(orderid),
foreign key(custid) references newcustomer(custid),
foreign key(bookid) references newbook(bookid)
);


SELECT * FROM NewOrders;


drop table newbook;
drop table newcustomer;

-- foreign key(관계 해제) => 테이블을 기준, 데이터베이스 기준 외래키 확인 
select * from information_schema.table_constraints where table_name = 'NewOrders';
alter table NewOrders drop foreign key neworders_ibfk_1;
alter table NewOrders drop foreign key neworders_ibfk_2;

alter table NewOrders add constraint fk_bookid foreign key(bookid) references newbook(bookid) on delete cascade;
alter table NewOrders add constraint fk_custid foreign key(custid) references NEWCUSTOMER(custid) on delete cascade;

select * from newcustomer;
insert into newcustomer
values(1, 'sss','korea','010-0000-0000');
update newcustomer set custid = 2 where custid = 1;

delete from newcustomer where custid = 2;
commit;
rollback;

-- newbook 테이블 책 한권 저장
desc newbook;
select * from newbook;
insert into newbook
values(1, '한 눈으로 보는 세계사','민음사', 15000);

insert into newbook
values(2, '동아시아사', '민음사', 10000);

-- neworders 테이블에 custid 1인 고객이 bookid 1인 책을 주문 했다. 해당 데이터를 입력
desc neworders;
select * from neworders;



-- neworders 테이블에 orderid 에 auto_increment 속성을 추가
alter table neworders modify orderid int not null auto_increment;
insert into neworders values(null, 1,1,9000,now());

update neworders set bookid = 2 where custid = 1;

delete from neworders where custid=2;

