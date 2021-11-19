-- 문제1번 --
select *
from employees
where manager_id = (select employee_id
                    from employees
                    where manager_id is null);

-- 문제 2번 --
select first_name || ' ' || last_name "이름",
job_id "업무 명"
from employees
where job_id in (select job_id
                from employees
                where department_id = (select department_id
                                        from departments
                                        where initcap(department_name) = 'Accounting'));
                        
select employee_id, first_name, job_id, salary, nvl(commission_pct, 0) commission_pct,
        to_char(hire_date, 'yyyy.mm.dd') hire_date
from employees
where department_id = (select department_id
                        from employees
                        where first_name = 'Guy');
                        
select first_name, salary
from employees
where salary > (select avg(salary)
                from employees);
                
select first_name, job_id, salary
from employees
where salary in (select salary
                from employees
                where first_name in('Susan', 'Lex')) 
and (first_name <> 'Susan' and first_name <> 'Lex');

select first_name, salary
from employees
where salary > all(select salary
                    from employees
                    where department_id = 30);
                    
select first_name, salary
from employees
where salary > any(select salary
                    from employees
                    where department_id = 110);

select *
from departments
where exists(select *
            from employees
            where department_id = 10);
            
-- 문제3 --
select first_name, salary
from employees
where salary > (select min(salary)
                from employees
                where job_id = 'ST_MAN')
and employee_id <> 20;

-- 문제4번 --
select *
from employees
where (job_id, salary) in (select job_id, salary
                            from employees
                            where first_name = 'Valli')
and first_name <> 'Valli';

-- 문제5번 --
select e.department_id, e.first_name, e.salary,
d.department_id, round(d.d_salary, 1) as D_SALARY
from employees e, (select department_id, avg(salary) D_SALARY
                    from employees
                    group by department_id) d
where e.department_id = d.department_id and e.salary > d.d_salary
order by d.d_salary;

select first_name || ' ' || last_name "Name", job_id, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'Tucker');
                
-- 문제1번 --
select first_name || ' ' || last_name "Name", e1.job_id, e1.salary,
hire_date
from employees e1, (select job_id, min(salary) salary
                    from employees
                    group by job_id) e2
where e1.salary > e2.salary and e1.job_id = e2.job_id;

-- 문제2번 --
select first_name || ' ' || last_name "Name", e.salary, e.department_id, e.job_id
from employees e, (select department_id, avg(salary) salary
                    from employees
                    group by department_id) d
where e.salary > d.salary and e.department_id = d.department_id;

-- 문제3번 --
select employee_id, first_name || ' ' || last_name "Name", job_id, hire_date
from employees
where department_id = (select department_id
                        from departments
                        where location_id = (select location_id
                                                from locations
                                                where city like 'O%'));
                                                
-- 문제4번 --
select first_name || ' ' || last_name "Name", job_id, e.salary, e.department_id, round(d.salary, 1) "Department Avg Salary"
from employees e, (select department_id, avg(salary) salary
                    from employees
                    group by department_id) d
where e.department_id = d.department_id(+);

create table emp01(
    EMPNO number(4),
    ENAME varchar2(20),
    SAL number(7,2)
);

alter table emp01
add(credate date);

alter table emp01
modify(job varchar2(30));

alter table emp01
rename column credate to regdate;

alter table emp01
drop column job;

desc emp01;
drop table emp01;

select * from recyclebin;
purge recyclebin;

drop table employees02;
flashback table employees02 to before drop;

rename employees02 to employee01;
truncate table employee01;

create table tb_customer(
    customer_cd char(7) primary key, --고객코드
    customer_nm varchar2(10) not null, --고객명
    mw_flg char(1) not null, --성별구분
    birth_day char(8) not null, --생일
    phone_number varchar2(16), -- 전화번호
    email varchar2(30), --email
    total_point number(10), --누적포인트
    reg_dttm char(14 byte) --등록일
);
select *
from tb_customer;