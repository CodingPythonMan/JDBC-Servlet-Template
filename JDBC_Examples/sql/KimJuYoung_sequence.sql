create sequence emp_seq
start with 0
increment by 1
minvalue 0
nocycle
cache 2;

drop table emp01;

select table_name
from user_tables;

create table emp01
as
select employee_id, first_name, hire_date
from employees
where 1=0;

select *
from emp01;

insert into emp01
values(emp_seq.nextval, 'JULIA', sysdate);

select emp_seq.currval
from dual;

drop table dept01;

create table dept01
as
select department_id, department_name, location_id
from departments where 1=0;

select *
from dept01;

create sequence dept_seq
start with 10
increment by 10
minvalue 0
maxvalue 30;

insert into dept01
values(dept_seq.nextval, 'ÀÎ»ç°ú', 2);

insert into dept01
values(dept_seq.nextval, 'ÃÑ¹«°ú', 42);

insert into dept01
values(dept_seq.nextval, '±³À°ÆÀ', 32);

select *
from dept01;

select sequence_name, min_value, max_value, increment_by, cycle_flag
from user_sequences;

alter sequence dept_seq
maxvalue 100;

insert into dept01
values(dept_seq.nextval, '±â¼úÆÀ', 44);

drop sequence dept_seq;

drop table emp01;

create table emp01
as
select *
from employees;

select table_name, index_name, column_name
from user_ind_columns
where table_name in('EMPLOYEES', 'EMP01');

select *
from emp01
where employee_id=188;

create unique index index_empno_emp
on emp01(employee_id);

select index_name, table_name, uniqueness
from user_indexes
where table_name in ('EMPLOYEES', 'EMP01');

drop index index_empno_emp;

drop table books;
commit;

create table books(
    book_id number(4),
    title varchar2(50),
    publisher varchar2(30),
    year varchar2(10),
    price number(6),
    primary key(book_id)
);

create sequence book_id_seq
start with 1
increment by 1;

insert into books
values(book_id_seq.nextval, 'Operating System Concepts', 'Wiley', '2003', 30700);
insert into books
values(book_id_seq.nextval, 'Head First PHP and MYSQL', 'OReilly', '2009', 58000);
insert into books
values(book_id_seq.nextval, 'C Programming Language', 'Prentice-Hall', '1989', 35000);
insert into books
values(book_id_seq.nextval, 'Head First SQL', 'OReilly', '2007', 43000);

commit;

desc test01_tbl;