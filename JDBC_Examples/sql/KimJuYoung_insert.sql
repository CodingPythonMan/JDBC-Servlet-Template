select table_name
from user_tables;

alter table dept
disable primary key cascade;

create table dept(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13)
);

desc tb_customer;

insert into tb_customer
values('2017042', '강원진', 'M', '19810603', '010-8202-8790',
'wjgang@navi.com', 280300, '20170123132432');

insert into tb_customer
values('2017053', '나경숙', 'W', '19891225', '010-4509-0043',
'ksna#boram.co.kr', 4500, '20170210180930');

insert into tb_customer
values('2017108', '박승대', 'M', '19711430', null,
'sdpark@haso.com', 23450, '20170508203450');

select *
from tb_customer;

create table emp
as
select * from employees;

update emp
set department_id = 30;

update emp
set salary = salary * 1.1;

update emp
set hire_date = sysdate;

select * from emp;

drop table emp;
create table emp
as
select * from employees;

select *
from emp;

update emp
set department_id = 30
where department_id = 10;

select *
from emp;

update emp
set salary = salary * 1.1
where salary >= 3000;

update emp
set hire_date = sysdate
where substr(hire_date, 1, 2) = '07';

select *
from emp;

drop table emp;
create table emp
as
select * from employees;

select *
from emp
where first_name = 'Susan';

update emp
set department_id = 20, job_id = 'FI_MGR'
where first_name = 'Susan';

alter table dept
modify(deptno number(4), dname varchar2(30));

insert into dept
select department_id, department_name, location_id 
from departments;

select *
from dept;

delete from dept;

delete from dept 
where deptno = 30;

create table tb_add_customer(
    customer_cd char(7) primary key, -- 고객코드
    customer_nm varchar2(10) not null, -- 고객명
    mw_flg char(1) not null, -- 성별구분
    birth_day char(8) not null, -- 생일
    phone_number varchar2(16) -- 전화번호
);

insert into tb_add_customer (customer_cd, customer_nm, mw_flg,
birth_day, phone_number) values('2017108', '박승대', 'M', '19711430', '010-2580-9919');
insert into tb_add_customer (customer_cd, customer_nm, mw_flg,
birth_day, phone_number) values('2019302', '전미래', 'W', '19740812', '010-8864-0232');

select * from tb_add_customer;

merge into tb_customer cu
    using tb_add_customer nc
    on (cu.customer_cd = nc.customer_cd)
    when matched then
        update set cu.customer_nm = nc.customer_nm,
                    cu.mw_flg = nc.mw_flg,
                    cu.birth_day = nc.birth_day,
                    cu.phone_number = nc.phone_number
    when not matched then
        insert (cu.customer_cd, cu.customer_nm, 
        cu.mw_flg, cu.birth_day, cu.phone_number, cu.email,
        cu.total_point, cu.reg_dttm)
        values (nc.customer_cd, nc.customer_nm, nc.mw_flg,
        nc.birth_day, nc.phone_number, '',0,to_char(sysdate, 'yyyymmddhhmiss'));

select * from tb_customer;

drop table emp01;

create table emp01(
    empno number(4) not null,
    ename varchar2(10) not null,
    job varchar2(9),
    mgr number(4),
    hiredate date not null,
    sal number(7,2) not null,
    comm number(7,2),
    deptno number(2) not null
);

insert into emp01
values(7369, 'SMITH', 'CLEAK', 7836, '80/12/17', 800, null, 20);
insert into emp01
values(7499, 'ALLEN', 'SALESMAN', 7369, '87/12/20', 1600, 300, 30);
insert into emp01
values(7839, 'KING', 'PRESIDENT', null, '81/02/08', 5000, null, 10);

select *
from emp01;

create table members(
    id varchar2(20) primary key, --회원id
    name varchar2(20) not null, --이름
    regno varchar2(13) not null, --주민등록번호
    hp varchar2(13) not null, --핸드폰번호
    address varchar2(100) not null --주소
);

insert into members
values('roxx19', '김xx', '1231232132', '123-1232-2312', 'adsfasdf'); 
select * from members;
create table books(
    code number(4) primary key,
    title varchar2(50) not null,
    count number(6) not null,
    price number(10) not null,
    publish varchar2(50) not null
);
insert into books
values (1234,'하하하하', 302, 100000, '출판사');
select * from books;

select *
from doctors;

insert into doctors
values(980312, '소아과', '이태정', 'M', '010-333-1340',
'ltj@hanbh.com', '과장');

insert into doctors
values(000601, '내과', '안성기', 'M', '011-222-0987',
'ask@hanbh.com', '과장');
insert into doctors
values(001208, '외과', '김민종', 'M', '010-333-8743',
'kmj@han.com', '과장');
insert into doctors
values(020403, '피부과', '이태서', 'M', '019-777-3764',
'lts@hanbh.com', '과장');
insert into doctors
values(050900, '소아과', '김연아', 'F', '010-555-3746',
'kya@hanbh.com', '전문의');
insert into doctors
values(050101, '내과', '차태현', 'M', '011-222-7643',
'cth@hanbh.com', '전문의');
insert into doctors
values(062019, '소아과', '전지현', 'F', '010-999-1265',
'jjh@hanbh.com', '전문의');
insert into doctors
values(080543, '방사선과', '유재석', 'M', '010-222-1263',
'yjs@hanbh.com', '과장');
insert into doctors
values(091001, '외과', '김병만', 'M', '010-555-3542',
'kbm@hanbh.com', '전문의');

insert into nurses
values(050302, '소아과', '김은영', 'F', '010-555-8751',
'key@hanbh.com', '수간호사');
insert into nurses
values(050021, '내과', '윤성애', 'F', '016-333-8745',
'ysa@hanbh.com', '수간호사');
insert into nurses
values(040089, '피부과', '신지원', 'M', '010-666-7646',
'sjw@hanbh.com', '주임');
insert into nurses
values(070605, '방사선과', '유정화', 'F', '010-333-4588',
'yjh@hanbh.com', '주임');
insert into nurses
values(070804, '내과', '라하나', 'F', '010-222-1340',
'nhn@hanbh.com', '주임');
insert into nurses
values(071018, '소아과', '김화경', 'F', '019-888-4116',
'khk@hanbh.com', '주임');
insert into nurses
values(100356, '소아과', '이선용', 'M', '010-777-1234',
'lsy@hanbh.com', '간호사');
insert into nurses
values(104145, '외과', '김현', 'M', '010-999-8520',
'kh@hanbh.com', '간호사');
insert into nurses
values(120309, '피부과', '박성완', 'M', '010-777-4996',
'psw@hanbh.com', '간호사');
insert into nurses
values(130211, '외과', '이서연', 'F', '010-222-3214',
'lsy2@hanbh.com', '간호사');

select *
from nurses;

select *
from patients;

insert into patients
values(2345, 050302, 980312, '안상건', 'M', '232345', '서울',
'010-555-7845', 'ask@ab.com', '회사원');

insert into patients
values(3545, 040089, 020403, '김성룡', 'M', '543545', '서울',
'010-333-7812', 'ksr@bb.com', '자영업');
insert into patients
values(3424, 070605, 080543, '이종진', 'M', '433424', '부산',
'019-888-4859', 'lgg@ab.com', '회사원');
insert into patients
values(7675, 100356, 050900, '최광석', 'M', '677675', '당진',
'010-222-4847', 'cks@cc.com', '회사원');
insert into patients
values(4533, 070804, 000601, '정한경', 'M', '744533', '강릉',
'010-777-9630', 'jhk@ab.com', '교수');
insert into patients
values(5546, 120309, 070576, '유원현', 'M', '765546', '대구',
'016-777-0214', 'ywh@cc.com', '자영업');
insert into patients
values(4543, 070804, 050101, '최재정', 'M', '454543', '부산',
'010-555-4187', 'cjj@bb.com', '회사원');
insert into patients
values(9768, 130211, 091001, '이진희', 'F', '119768', '서울',
'010-888-3675', 'ljh@ab.com', '교수');
insert into patients
values(4234, 130211, 091001, '오나미', 'F', '234234', '속초',
'010-999-6541', 'onm@cc.com', '학생');
insert into patients
values(7643, 071018, 062019, '송성묵', 'M', '987643', '서울',
'010-222-5874', 'ssm@bb.com', '학생');

select *
from treatments;

insert into treatments
values(130516023, 2345, 980312, '감기, 몸살', '2013/05/16');
insert into treatments
values(130628100, 3545, 020403, '피부 트러블 치료', '2013-06-28');

insert into treatments
values(131205056, 3424, 080543, '목 디스크로 MRI 촬영', '2013-12-05');
insert into treatments
values(131218024, 7675, 050900, '중이염', '2013-12-18');
insert into treatments
values(131224012, 4533, 000601, '장염', '2013-12-24');
insert into treatments
values(140103001, 5546, 070576, '여드름 치료', '2014-01-03');
insert into treatments
values(140109026, 4543, 050101, '위염', '2014-01-09');
insert into treatments
values(140226102, 9768, 091001, '화상 치료', '2014-02-26');
insert into treatments
values(140303003, 4234, 091001, '교통사고 외상 치료', '2014-03-03');
insert into treatments
values(140308087, 7643, 062019, '장염', '2014-03-08');

select *
from charts;

insert into charts
values('p_130516023', 130516023, 980312, 2345, 050302, '감기 주사 및 약 처방');
insert into charts
values('p_130628100', 130628100, 020403, 3545, 040089, '피부 감염 방지 주사');
insert into charts
values('r_131205056', 131205056, 080543, 3424, 070605, '주사 처방');
insert into charts
values('p_131218024', 131218024, 050900, 7675, 100356, '귓속 청소 및 약 처방');
insert into charts
values('i_131224012', 131224012, 000601, 4533, 070804, '장염 입원 치료');
insert into charts
values('d_140103001', 140103001, 070576, 5546, 120309, '여드름 치료약 처방');
insert into charts
values('i_140109026', 140109026, 050101, 4543, 070804, '위내시경');
insert into charts
values('s_140226102', 140226102, 091001, 9768, 130211, '화상 크림약 처방');
insert into charts
values('s_140303003', 140303003, 091001, 4234, 130211, '입원 치료');
insert into charts
values('p_140308087', 140308087, 062019, 7643, 071018, '장염 입원 치료');

update doctors
set major_treat = '소아과'
where doc_name = '홍길동';

select *
from doctors;

delete from nurses
where nur_name = '김은영';

drop table dept02;

create table dept02
as select *
from departments;

select *
from dept02;

drop table dept02;

commit;

create table dept02
as select *
from departments;

delete from dept02;
rollback;

create table dept02
as select *
from departments;

delete from dept02
where department_id = 40;
commit;

delete from dept02
where department_id = 30;

savepoint c1;

delete from dept02
where department_id = 20;

savepoint c2;

delete from dept02
where department_id = 10;

select * from dept02;

rollback to c2;
rollback;