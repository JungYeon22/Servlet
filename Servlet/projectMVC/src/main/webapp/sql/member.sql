create table member( 
name varchar2(30) not null,	-- 이름
id varchar2(30) primary key, -- 기본키, unique, not null, 무결성 제약 조건 
pwd varchar2(30) not null,
gender varchar2(3), 
email1 varchar2(20), 
email2 varchar2(20),
tel1 varchar2(10),
tel2 varchar2(10),
tel3 varchar2(10), 
zipcode varchar2(10), 
addr1 varchar2(100), 
addr2 varchar2(100), 
logtime date);


-- MySQL 
create table member( 
name varchar(30) not null,	-- 이름
id varchar(30) primary key, -- 기본키, unique, not null, 무결성 제약 조건 
pwd varchar(30) not null,
gender varchar(3), 
email1 varchar(20), 
email2 varchar(20),
tel1 varchar(10),
tel2 varchar(10),
tel3 varchar(10), 
zipcode varchar(10), 
addr1 varchar(100), 
addr2 varchar(100), 
logtime date);