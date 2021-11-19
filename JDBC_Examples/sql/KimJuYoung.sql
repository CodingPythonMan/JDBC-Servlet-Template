select employee_id, first_name, last_name, job_id
from employees
where first_name = 'John';

select *
from employees
where salary >= 5000 and salary <= 10000;

select *
from employees
where employee_id = 134 or employee_id = 201 or employee_id = 107;

select *
from employees
where not job_id = 'FI_MGR';

select employee_id, first_name, last_name, salary
from employees
where salary between 2500 and 4500;

select employee_id, first_name, salary
from employees
where employee_id=177 or employee_id=101 or employee_id=184;

select employee_id, first_name, last_name, salary, commission_pct
from employees
where commission_pct in(0.3, 0.05, 0.1);

select employee_id, first_name
from employees
where not first_name like '%a%';

select first_name, last_name, job_id, employee_id
from employees
where manager_id is null;

select employee_id, first_name, last_name, salary
from employees
order by salary desc;

select employee_id, first_name, last_name, hire_date
from employees
order by hire_date desc;

select employee_id, first_name || ' ' || last_name as Name, salary, job_id, hire_date, manager_id
from employees;

select first_name || ' ' || last_name as Name, job_id, salary, 12 * salary + 100 "Increased Ann_Salary", 12 * (salary + 100) "Increased Salary"
from employees;

select last_name || ': 1 Year Salary = ' || (12 * salary) "1 Year Salary"
from employees;

select distinct department_id , job_id
from employees
where not department_id is null
order by department_id;

select first_name || ' ' || last_name "Name", salary
from employees
where not salary between 7000 and 10000
order by salary;

select first_name
from employees
where first_name like '%e%' or first_name like '%o%';

select first_name || ' ' || last_name "Name", employee_id, hire_date
from employees
where hire_date between '06/05/20' and '07/05/20'
order by hire_date;

select first_name || ' ' || last_name "Name", salary, job_id, commission_pct
from employees
where not commission_pct is null and commission_pct > 0
order by salary desc, commission_pct desc;

select initcap(first_name) || ' ' || initcap(last_name) "Name",
salary, commission_pct, email
from employees
where upper(email) like '%JKING%';

select employee_id, first_name, salary
from employees
where length(first_name) = 6;

select substr('DataBase', 1, 3)
from dual;

select employee_id, first_name, hire_date
from employees
where substr(hire_date, 1 , 2) = '03';

select employee_id, first_name, hire_date
from employees
where hire_date between '03/01/01' and '03/12/31';

select employee_id, first_name, hire_date
from employees
where hire_date > '03/01/01' and hire_date < '03/12/31';

select employee_id, first_name
from employees
where substr(first_name, -1, 1) = 'k';

select employee_id, first_name
from employees
where first_name like '%k';

select trim(leading from '   ABCD  ') LT, 
length(trim(leading from '   ABCD  ')) RT_LEN,
trim(trailing from '   ABCD ') both1,
length(trim(both from '   ABCD  ')) both1,
trim('   ABCD   ') both2, 
length(trim('  ABCD ')) bothlen2
from dual;

select round(12.345, 2), round(34.567, 0),
round(56.789), rcound(78.901, -1)
from dual;

select mod(34, 2), mod(34, 5), mod(34, 7)
from dual;

select employee_id, first_name, job_id
from employees
where mod(employee_id, 2) = 0;

select first_name, sysdate 오늘,
to_char(hire_date, 'YYYY/MM/DD') 입사일,
trunc(months_between(sysdate, hire_date)) 근무달수
from employees
where department_id = 30;

select sysdate, last_day(sysdate)
from dual;

select hire_date, round(hire_date, 'month')
from employees
where department_id = 30;

select hire_date, trunc(hire_date, 'month')
from employees
where department_id = 30;

select sysdate, to_char(sysdate, 'YYYY-MM-DD'), to_char(sysdate, 'DL')
from dual;

select to_char(hire_date, 'yyyy/mm/dd day')
from employees
where department_id = 30;

select to_char(hire_date, 'yyyy"년" mm"월" dd"일" day')
from employees
where department_id = 30;

select to_char(hire_date, 'yyyy/mon/dd dy')
from employees
where department_id = 30;

select to_char(sysdate, 'yyyy/mm/dd, hh24:mi:ss')
from dual;

select first_name, salary, to_char(salary, '$999,999')
from employees 
where department_id = 30;

select first_name, salary, to_char(123456, '999,999,999')
from employees
where department_id = 30;

select first_name, hire_date
from employees
where hire_date = to_date(20051224, 'yyyymmdd');

select trunc(sysdate-to_date('2015/12/24', 'yyyy/mm/dd'))
from dual;

select first_name, salary, to_char(salary, '$999,999')
from employees
where department_id = 30;

select to_number('10,000', '999,999') + to_number('20,000', '999,999')
from dual;

select to_char(salary, '$999,999')
from employees;

select employee_id, first_name, nvl2(manager_id, null,'CEO') "manager_id"
from employees
where manager_id is null;

select department_id, decode(department_id, 10,
'Administration', 20, 'Marketing', 30, 'Purchasing', 40,
'Human Resources', 50, 'Shipping', 60, 'IT') as departments
from employees
order by department_id;

select first_name, department_id,
case when department_id=10 then 'Administration'
when department_id=20 then 'Marketing'
when department_id=30 then 'Purchasing'
when department_id=40 then 'Human Resources'
when department_id=50 then 'Shipping'
when department_id=60 then 'IT'
end department_name
from employees
order by department_id;

select employee_id, first_name, job_id, case
when department_id = 20 then salary*1.05
when department_id = 30 then salary*1.1
when department_id = 40 then salary*1.15
when department_id = 60 then salary*1.2
end "Increased Salary"
from employees
where department_id in(20,30,40,60);

select greatest(1,4,2,5,3,9), least(1,4,2,5,3,9)
from dual;

select employee_id, last_name || ' ' || first_name "Name",
salary, round(salary*1.123) "Increased Salary"
from employees
where department_id = 60;

select initcap(last_name) || ' ' || initcap(first_name) ||
' is a ' || upper(job_id) "Employee JOBs"
from employees;

select first_name, salary, commission_pct,
nvl2(commission_pct, salary+(salary*nvl(commission_pct, 0)), salary)
total_sal
from employees;

select first_name || ' ' || last_name "Name", salary,
nvl2(commission_pct, 'Salary+commission', 'Salary only') "Commission check",
nvl2(commission_pct, 12*salary*(1+commission_pct), 12*salary) "Year Salary"
from employees;

select  to_char(hire_date, 'mm') "월",
count(to_char(hire_date, 'mm')) "월별 입사 사원"
from employees
group by to_char(hire_date, 'mm')
order by to_char(hire_date, 'mm');

select
sum(case when to_char(hire_date, 'mm') = '01'
then count(*) else 0 end) "1 Month",
sum(case when to_char(hire_date, 'mm') = '02'
then count(*) else 0 end) "2 Month",
sum(case when to_char(hire_date, 'mm') = '03'
then count(*) else 0 end) "3 Month",
sum(case when to_char(hire_date, 'mm') = '04'
then count(*) else 0 end) "4 Month",
sum(case when to_char(hire_date, 'mm') = '05'
then count(*) else 0 end) "5 Month",
sum(case when to_char(hire_date, 'mm') = '06'
then count(*) else 0 end) "6 Month",
sum(case when to_char(hire_date, 'mm') = '07'
then count(*) else 0 end) "7 Month",
sum(case when to_char(hire_date, 'mm') = '08'
then count(*) else 0 end) "8 Month",
sum(case when to_char(hire_date, 'mm') = '09'
then count(*) else 0 end) "9 Month",
sum(case when to_char(hire_date, 'mm') = '10'
then count(*) else 0 end) "10 Month",
sum(case when to_char(hire_date, 'mm') = '11'
then count(*) else 0 end) "11 Month",
sum(case when to_char(hire_date, 'mm') = '12'
then count(*) else 0 end) "12 Month"
from employees
group by to_char(hire_date, 'mm');

select count(distinct job_id)
from employees
where job_id is not null;

select department_id "부서", count(employee_id) "직원 수",
count(commission_pct) "커미션 받는 직원 수"
from employees
where department_id is not null
group by department_id
order by department_id;

select job_id, department_id, count(*),
sum(salary) from employees
group by rollup(job_id, department_id)
order by job_id;

select department_id, job_id, count(*),
sum(salary) from employees
group by cube(department_id, job_id);

select department_id, job_id,
to_char(sum(salary), '$999,999.00') as "Salary SUM",
count(employee_id) as "COUNT EMPs"
from employees
group by department_id, job_id
order by department_id;

select department_id, job_id,
to_char(sum(salary), '$999,999.00') as "Salary SUM",
count(employee_id) as "COUNT EMPs"
from employees
group by rollup(department_id, job_id)
order by department_id;

create table exp_goods_asia(
    country varchar2(10),
    seq number,
    goods varchar2(80)
);

insert into exp_goods_asia values('한국', 1, '원유제외 석유류');
insert into exp_goods_asia values('한국', 2, '자동차');
insert into exp_goods_asia values('한국', 3, '전자집적회로');
insert into exp_goods_asia values('한국', 4, '선박');
insert into exp_goods_asia values('한국', 5, 'LCD');
insert into exp_goods_asia values('한국', 6, '자동차부품');
insert into exp_goods_asia values('한국', 7, '휴대전화');
insert into exp_goods_asia values('한국', 8, '환식탄화수소');
insert into exp_goods_asia values('한국', 9, '무선송신기 디스플레이 부속품');
insert into exp_goods_asia values('한국', 10, '철 또는 비합금강');

insert into exp_goods_asia values('일본', 1, '자동차');
insert into exp_goods_asia values('일본', 2, '자동차부품');
insert into exp_goods_asia values('일본', 3, '전자집적회로');
insert into exp_goods_asia values('일본', 4, '선박');
insert into exp_goods_asia values('일본', 5, '반도체웨이퍼');
insert into exp_goods_asia values('일본', 6, '화물차');
insert into exp_goods_asia values('일본', 7, '원유제외 석유류');
insert into exp_goods_asia values('일본', 8, '건설기계');
insert into exp_goods_asia values('일본', 9, '다이오드, 트랜지스터');
insert into exp_goods_asia values('일본', 10, '기계류');

commit;

select goods
from exp_goods_asia
where country = '한국'
union
select goods
from exp_goods_asia
where country = '일본';

select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;

select employee_id, job_id, null as "Start Date", null as "End Date"
from employees
where employee_id = 176
union
select employee_id, job_id, start_date, end_date
from job_history
where employee_id = 176;

select goods
from exp_goods_asia
where country = '한국'
union all
select goods
from exp_goods_asia
where country = '일본';

select employee_id, job_id, null as "Start Date", null as "End Date"
from employees
union
select employee_id, job_id, start_date, end_date
from job_history
order by employee_id;

select goods
from exp_goods_asia
where country='한국'
intersect
select goods
from exp_goods_asia
where country='일본';

select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

select goods
from exp_goods_asia
where country='한국'
minus
select goods
from exp_goods_asia
where country='일본';

select employee_id
from employees
minus
select employee_id
from job_history;

select department_id, job_id, count(*), sum(salary)
from employees
group by grouping sets(department_id, job_id)
order by department_id;

select round(max(salary*(commission_pct+1)), -1) "가장 많은 경우",
round(min(salary*(commission_pct+1)), -1) "가장 적은 경우",
round(avg(salary*(commission_pct+1)), -1) "평균"
from employees;

select round(max(nvl2(commission_pct, salary*(commission_pct+1), salary)), 1) "가장 많은 경우",
round(min(nvl2(commission_pct, salary*(commission_pct+1), salary)), 1) "가장 적은 경우",
round(avg(nvl2(commission_pct, salary*(commission_pct+1), salary)), 1) "평균"
from employees;

select to_char(hire_date, 'yyyy') "H_YEAR", count(employee_id) "사원수",
min(salary) "최소급여", max(salary) "최대급여", round(avg(salary), 2) "급여의 평균", sum(salary) "급여의 합"
from employees
group by to_char(hire_date, 'yyyy')
order by to_char(hire_date, 'yyyy');

select count(*) "TOTAL",
count(case when to_char(hire_date, 'yyyy') = '2001' then 1 end) "2001년도",
count(case when to_char(hire_date, 'yyyy') = '2002' then 1 end) "2002년도",
count(case when to_char(hire_date, 'yyyy') = '2003' then 1 end) "2003년도",
count(case when to_char(hire_date, 'yyyy') = '2004' then 1 end) "2004년도",
count(case when to_char(hire_date, 'yyyy') = '2005' then 1 end) "2005년도",
count(case when to_char(hire_date, 'yyyy') = '2006' then 1 end) "2006년도",
count(case when to_char(hire_date, 'yyyy') = '2007' then 1 end) "2007년도",
count(case when to_char(hire_date, 'yyyy') = '2008' then 1 end) "2008년도"
from employees;

select job_id,
sum(case when department_id = 10 then salary else 0 end) "DEPTNO 10",
sum(case when department_id = 20 then salary else 0 end) "DEPTNO 20",
sum(case when department_id = 30 then salary else 0 end) "DEPTNO 30",
sum(case when department_id = 40 then salary else 0 end) "DEPTNO 40",
sum(case when department_id = 50 then salary else 0 end) "DEPTNO 50",
sum(case when department_id = 60 then salary else 0 end) "DEPTNO 60",
sum(case when department_id = 70 then salary else 0 end) "DEPTNO 70",
sum(case when department_id = 80 then salary else 0 end) "DEPTNO 80",
sum(case when department_id = 90 then salary else 0 end) "DEPTNO 90",
sum(case when department_id = 100 then salary else 0 end) "DEPTNO 100",
sum(case when department_id = 110 then salary else 0 end) "DEPTNO 110",
sum(salary) "SUM"
from employees
group by job_id;

select department_id, job_id,
to_char(sum(salary), '$999,999.00') as "Salary SUM",
count(employee_id) as "COUNT EMPs"
from employees
group by cube(department_id, job_id)
order by department_id;

select department_id, job_id,
to_char(sum(salary), '$999,999.00') as "Salary SUM",
count(employee_id) as "COUNT EMPs"
from employees
group by grouping sets(department_id, job_id) -- grouping sets
order by department_id;

select nvl2(department_id, to_char(department_id, '999,999'), '(ALL-DEPTS)') "DEPT", 
nvl2(job_id, job_id, '(ALL-JOBS)') "JOBS",
to_char(sum(salary), '$999,999') as "Salary SUM",
count(employee_id) as "COUNT EMPs"
from employees
group by grouping sets(department_id, job_id)
order by department_id;

select nvl2(department_id, to_char(department_id, '999,999'), '(ALL-DEPTS)'),
to_char(sum(salary), '$999,999') as "Salary SUM",
count(employee_id) as "COUNT EMPs"
from employees
group by department_id
order by department_id;