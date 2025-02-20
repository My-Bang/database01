-- mysql -u 사용자이름 -p 			-- 터미널에서 mysql들어갈때 해당 파일 경로로가서 이 명령어 사용



create database ssgdb;
create user ssg@localhost identified by 'ssg1234';	-- ssgdb 데이터베이스를 사용하는 사용자 'ssg' 사용자 패스워드 'ssg1234' 
grant all privileges on ssgdb. * to ssg@localhost; -- ssg Localhost에게 ssgdb에 대한 모든 접근 권한 부여하겠다.
commit;
grant all privileges on shopdb. * to ssg@localhost;

show databases;
create database shopdb;

create database hr;
create user hr@localhost identified by 'hr';
grant all privileges on hr. * to hr@localhost;


create database sakila;
create user sakila@localhost identified by 'sakila';
grant all privileges on sakila. * to sakila@localhost;