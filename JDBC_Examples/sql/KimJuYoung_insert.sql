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
values('2017042', '������', 'M', '19810603', '010-8202-8790',
'wjgang@navi.com', 280300, '20170123132432');

insert into tb_customer
values('2017053', '�����', 'W', '19891225', '010-4509-0043',
'ksna#boram.co.kr', 4500, '20170210180930');

insert into tb_customer
values('2017108', '�ڽ´�', 'M', '19711430', null,
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
    customer_cd char(7) primary key, -- ���ڵ�
    customer_nm varchar2(10) not null, -- ����
    mw_flg char(1) not null, -- ��������
    birth_day char(8) not null, -- ����
    phone_number varchar2(16) -- ��ȭ��ȣ
);

insert into tb_add_customer (customer_cd, customer_nm, mw_flg,
birth_day, phone_number) values('2017108', '�ڽ´�', 'M', '19711430', '010-2580-9919');
insert into tb_add_customer (customer_cd, customer_nm, mw_flg,
birth_day, phone_number) values('2019302', '���̷�', 'W', '19740812', '010-8864-0232');

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
    id varchar2(20) primary key, --ȸ��id
    name varchar2(20) not null, --�̸�
    regno varchar2(13) not null, --�ֹε�Ϲ�ȣ
    hp varchar2(13) not null, --�ڵ�����ȣ
    address varchar2(100) not null --�ּ�
);

insert into members
values('roxx19', '��xx', '1231232132', '123-1232-2312', 'adsfasdf'); 
select * from members;
create table books(
    code number(4) primary key,
    title varchar2(50) not null,
    count number(6) not null,
    price number(10) not null,
    publish varchar2(50) not null
);
insert into books
values (1234,'��������', 302, 100000, '���ǻ�');
select * from books;

select *
from doctors;

insert into doctors
values(980312, '�Ҿư�', '������', 'M', '010-333-1340',
'ltj@hanbh.com', '����');

insert into doctors
values(000601, '����', '�ȼ���', 'M', '011-222-0987',
'ask@hanbh.com', '����');
insert into doctors
values(001208, '�ܰ�', '�����', 'M', '010-333-8743',
'kmj@han.com', '����');
insert into doctors
values(020403, '�Ǻΰ�', '���¼�', 'M', '019-777-3764',
'lts@hanbh.com', '����');
insert into doctors
values(050900, '�Ҿư�', '�迬��', 'F', '010-555-3746',
'kya@hanbh.com', '������');
insert into doctors
values(050101, '����', '������', 'M', '011-222-7643',
'cth@hanbh.com', '������');
insert into doctors
values(062019, '�Ҿư�', '������', 'F', '010-999-1265',
'jjh@hanbh.com', '������');
insert into doctors
values(080543, '��缱��', '���缮', 'M', '010-222-1263',
'yjs@hanbh.com', '����');
insert into doctors
values(091001, '�ܰ�', '�躴��', 'M', '010-555-3542',
'kbm@hanbh.com', '������');

insert into nurses
values(050302, '�Ҿư�', '������', 'F', '010-555-8751',
'key@hanbh.com', '����ȣ��');
insert into nurses
values(050021, '����', '������', 'F', '016-333-8745',
'ysa@hanbh.com', '����ȣ��');
insert into nurses
values(040089, '�Ǻΰ�', '������', 'M', '010-666-7646',
'sjw@hanbh.com', '����');
insert into nurses
values(070605, '��缱��', '����ȭ', 'F', '010-333-4588',
'yjh@hanbh.com', '����');
insert into nurses
values(070804, '����', '���ϳ�', 'F', '010-222-1340',
'nhn@hanbh.com', '����');
insert into nurses
values(071018, '�Ҿư�', '��ȭ��', 'F', '019-888-4116',
'khk@hanbh.com', '����');
insert into nurses
values(100356, '�Ҿư�', '�̼���', 'M', '010-777-1234',
'lsy@hanbh.com', '��ȣ��');
insert into nurses
values(104145, '�ܰ�', '����', 'M', '010-999-8520',
'kh@hanbh.com', '��ȣ��');
insert into nurses
values(120309, '�Ǻΰ�', '�ڼ���', 'M', '010-777-4996',
'psw@hanbh.com', '��ȣ��');
insert into nurses
values(130211, '�ܰ�', '�̼���', 'F', '010-222-3214',
'lsy2@hanbh.com', '��ȣ��');

select *
from nurses;

select *
from patients;

insert into patients
values(2345, 050302, 980312, '�Ȼ��', 'M', '232345', '����',
'010-555-7845', 'ask@ab.com', 'ȸ���');

insert into patients
values(3545, 040089, 020403, '�輺��', 'M', '543545', '����',
'010-333-7812', 'ksr@bb.com', '�ڿ���');
insert into patients
values(3424, 070605, 080543, '������', 'M', '433424', '�λ�',
'019-888-4859', 'lgg@ab.com', 'ȸ���');
insert into patients
values(7675, 100356, 050900, '�ֱ���', 'M', '677675', '����',
'010-222-4847', 'cks@cc.com', 'ȸ���');
insert into patients
values(4533, 070804, 000601, '���Ѱ�', 'M', '744533', '����',
'010-777-9630', 'jhk@ab.com', '����');
insert into patients
values(5546, 120309, 070576, '������', 'M', '765546', '�뱸',
'016-777-0214', 'ywh@cc.com', '�ڿ���');
insert into patients
values(4543, 070804, 050101, '������', 'M', '454543', '�λ�',
'010-555-4187', 'cjj@bb.com', 'ȸ���');
insert into patients
values(9768, 130211, 091001, '������', 'F', '119768', '����',
'010-888-3675', 'ljh@ab.com', '����');
insert into patients
values(4234, 130211, 091001, '������', 'F', '234234', '����',
'010-999-6541', 'onm@cc.com', '�л�');
insert into patients
values(7643, 071018, 062019, '�ۼ���', 'M', '987643', '����',
'010-222-5874', 'ssm@bb.com', '�л�');

select *
from treatments;

insert into treatments
values(130516023, 2345, 980312, '����, ����', '2013/05/16');
insert into treatments
values(130628100, 3545, 020403, '�Ǻ� Ʈ���� ġ��', '2013-06-28');

insert into treatments
values(131205056, 3424, 080543, '�� ��ũ�� MRI �Կ�', '2013-12-05');
insert into treatments
values(131218024, 7675, 050900, '���̿�', '2013-12-18');
insert into treatments
values(131224012, 4533, 000601, '�忰', '2013-12-24');
insert into treatments
values(140103001, 5546, 070576, '���帧 ġ��', '2014-01-03');
insert into treatments
values(140109026, 4543, 050101, '����', '2014-01-09');
insert into treatments
values(140226102, 9768, 091001, 'ȭ�� ġ��', '2014-02-26');
insert into treatments
values(140303003, 4234, 091001, '������ �ܻ� ġ��', '2014-03-03');
insert into treatments
values(140308087, 7643, 062019, '�忰', '2014-03-08');

select *
from charts;

insert into charts
values('p_130516023', 130516023, 980312, 2345, 050302, '���� �ֻ� �� �� ó��');
insert into charts
values('p_130628100', 130628100, 020403, 3545, 040089, '�Ǻ� ���� ���� �ֻ�');
insert into charts
values('r_131205056', 131205056, 080543, 3424, 070605, '�ֻ� ó��');
insert into charts
values('p_131218024', 131218024, 050900, 7675, 100356, '�Ӽ� û�� �� �� ó��');
insert into charts
values('i_131224012', 131224012, 000601, 4533, 070804, '�忰 �Կ� ġ��');
insert into charts
values('d_140103001', 140103001, 070576, 5546, 120309, '���帧 ġ��� ó��');
insert into charts
values('i_140109026', 140109026, 050101, 4543, 070804, '�����ð�');
insert into charts
values('s_140226102', 140226102, 091001, 9768, 130211, 'ȭ�� ũ���� ó��');
insert into charts
values('s_140303003', 140303003, 091001, 4234, 130211, '�Կ� ġ��');
insert into charts
values('p_140308087', 140308087, 062019, 7643, 071018, '�忰 �Կ� ġ��');

update doctors
set major_treat = '�Ҿư�'
where doc_name = 'ȫ�浿';

select *
from doctors;

delete from nurses
where nur_name = '������';

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