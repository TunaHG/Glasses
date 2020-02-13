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
    HOUSE_ID varchar2(30)
);

insert into member values('asdf0185', 'asdf0185', '김하균', '010-9611-7555', 'TRUE', 'admin');
insert into member values('Jzee', 'Jzee', '심재영', '010-1234-5678', 'TRUE', 'admin');
insert into member values('hyunho058', 'hyunho058', '김현호', '010-3333-4444', 'TRUE', '101');
insert into member values('csy7489', 'csy7489', '최시영', '010-5555-6666', 'FALSE', '102');

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
    temperature number(5),
    reg_date date
);

insert into HOUSESTATUS values('101', 20, sysdate);
insert into HOUSESTATUS values('102', 22, sysdate);

set linesize 300;
set pagesize 20;