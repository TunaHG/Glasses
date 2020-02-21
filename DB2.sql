create user glasses identified by glass
default TABLESPACE mc;

grant connect, resource, dba to glasses;

conn glasses/glass;

drop table member;
create table member(
    MEMBER_ID varchar2(30) primary key,
    PASSWORD varchar2(50),
    NAME varchar2(30),
    PHONE varchar2(30), 
    ALLOWED varchar2(30), 
    HOUSE_ID varchar2(30),
    SELECTTEMP varchar2(10)
);

insert into member values('asdf0185', 'asdf0185', '김하균', '010-9611-7555', 'TRUE', 'admin', '20');
insert into member values('Jzee', 'Jzee', '심재영', '010-1234-5678', 'TRUE', 'admin', '22');
insert into member values('hyunho058', 'hyunho058', '김현호', '010-3333-4444', 'TRUE', '101', '19');
insert into member values('csy7489', 'csy7489', '최시영', '010-5555-6666', 'FALSE', '102', '21');
insert into member values('admin', 'admin', 'tester', '010-5555-6666', 'TRUE', 'admin', '20');

drop sequence board_seq;
create sequence board_seq;

drop table board;
create table board(
    board_no number(5) primary key,
    title varchar2(30),
    contents varchar2(500),
    member_id varchar2(30), 
    form varchar2(30), 
    viewcnt number(5),
    reg_date date
);

insert into board values(board_seq.nextval, '1번공지', '1번게시물', 'asdf0185', 'notice', 0, sysdate);
insert into board values(board_seq.nextval, '2번자유', '2번게시물', 'hyunho058', 'free', 0, sysdate);

drop table HOUSESTATUS;
create table HOUSESTATUS(
    HOUSE_ID varchar2(30),
    temperature varchar2(30)
);

insert into HOUSESTATUS values('101','23');
insert into HOUSESTATUS values('102','22');
insert into HOUSESTATUS values('103','19');
insert into HOUSESTATUS values('104','19');
insert into HOUSESTATUS values('201','18');
insert into HOUSESTATUS values('202','22');
insert into HOUSESTATUS values('203','19');
insert into HOUSESTATUS values('204','21');
insert into HOUSESTATUS values('301','23');
insert into HOUSESTATUS values('302','22');
insert into HOUSESTATUS values('303','18');
insert into HOUSESTATUS values('304','24');
insert into HOUSESTATUS values('401','26');
insert into HOUSESTATUS values('402','23');
insert into HOUSESTATUS values('403','22');
insert into HOUSESTATUS values('404','25');
insert into HOUSESTATUS values('501','20');
insert into HOUSESTATUS values('502','16');
insert into HOUSESTATUS values('503','25');
insert into HOUSESTATUS values('504','18');

set linesize 300;
set pagesize 20;
commit;