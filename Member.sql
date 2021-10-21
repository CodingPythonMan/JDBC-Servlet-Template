create table t_member(
    id varchar2(10) primary key,
    pwd varchar2(10),
    name varchar2(50),
    email varchar2(50),
    joinDate date default sysdate
);

drop table t_member;

--회원 정보 추가
insert into t_member
values('hong', '1212', '홍길동', 'hong@gmail.com', sysdate);

insert into t_member
values('lee', '1212', '이순신', 'lee@test.com', sysdate);

insert into t_member
values('kim', '1212', '김유신', 'kim@jweb.com', sysdate);
commit;

select * from t_member;

create table join_member(
    id varchar2(20) primary key,
    pwd varchar2(50) not null,
    name varchar2(30) not null,
    nickName varchar2(40) not null,
    email varchar2(50) not null,
    route varchar2(40) not null,
    homePhone varchar2(30) not null,
    phone varchar2(30) not null,
    birthday date not null,
    postNum varchar2(10) not null,
    address varchar2(100) not null,
    kakaoMessage boolean not null,
    mailing boolean not null,
    smsReceiving boolean not null,
    infoOpen boolean not null
);