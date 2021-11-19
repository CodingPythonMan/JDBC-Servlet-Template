select *
from employees, departments;

select first_name, department_name
from employees, departments
where employees.department_id = departments.department_id;

select e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id and e.first_name='Susan';

create table salarygrade(
    grade number,
    minsalary number,
    maxsalary number
);

insert into salarygrade(grade, minsalary, maxsalary) values(1,2000,3000);
insert into salarygrade(grade, minsalary, maxsalary) values(2,3001,4500);
insert into salarygrade(grade, minsalary, maxsalary) values(3,4501,6000);
insert into salarygrade(grade, minsalary, maxsalary) values(4,6001,8000);
insert into salarygrade(grade, minsalary, maxsalary) values(5,8001,10000);
insert into salarygrade(grade, minsalary, maxsalary) values(6,10001,13000);
insert into salarygrade(grade, minsalary, maxsalary) values(7,13001,20000);
insert into salarygrade(grade, minsalary, maxsalary) values(8,20001,30000);

commit;

select e.first_name, e.salary, s.grade
from employees e, salarygrade s
where e.salary between s.minsalary and s.maxsalary;

select e.first_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

select employee_id, first_name, hire_date, department_id
from employees
where hire_date >= '2007/01/01' and hire_date <= '2007/06/30';

select employee_id, first_name, hire_date, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+)
and hire_date >= '2007/01/01' and hire_date <= '2007/06/30';

select employee_id, first_name, manager_id
from employees;

select work.first_name "사원명", manager.first_name "매니저명"
from employees work, employees manager
where work.manager_id = manager.employee_id;

select rpad(work.first_name, 11, ' ') || '의 매니저는 ' || manager.first_name || '이다.' "그 사원의 매니저"
from employees work, employees manager
where work.manager_id = manager.employee_id;

-- 204p (11) --
select last_name "이름", job_id "직급", hire_date "시작 날짜"
from employees
where initcap(last_name) like 'Matos' or
initcap(last_name) like 'Taylor'
order by hire_date;

-- 204p (12) --
select last_name "이름", hire_date "고용날짜"
from employees
where hire_date between '1994/01/01' and '1994/12/31';

-- 204p (13) --
select e.last_name "이름", e.job_id "직급", e.salary "월급"
from employees e, jobs j
where (upper(j.job_title) = 'SALES REPRESENTATIVE' or
upper(j.job_title) = 'STOCK CLERK') and j.job_id = e.job_id
minus
select last_name, job_id, salary
from employees
where salary in(2500, 3500, 7000);

-- 204p (14) --
select count(distinct manager_id) "Number of Managers"
from employees;

-- 204p (15) --
select manager_id, min(salary) "Lowestpaid"
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by min(salary) desc;`

-- 205p (16) --
select e.last_name "Employee", count(e.employee_id) "Emp#",
m.last_name "Manager", m.employee_id "Mgr#"
from employees e, employees m
where e.manager_id = m.employee_id
group by m.employee_id;

-- 예제1 --
select '(주)Bit', e.first_name || ' ' || e.last_name "Name",
e.job_id, d.department_name, l.city
from employees e join departments d
on (e.department_id = d.department_id)
join locations l
on(d.location_id = l.location_id)
and l.city = 'Oxford';

-- 문제1 --
select e.first_name || ' ' || e.last_name "이름",
e.hire_date "입사일"
from employees e, departments d
where initcap(d.department_name) = 'Sales' and
e.department_id = d.department_id;

-- 문제2 --
select e.first_name || ' ' || e.last_name "이름",
d.department_name "부서명"
from employees e, departments d
where e.commission_pct is not null 
and d.department_id = e.department_id;

-- 문제3 --
select e2.first_name || ' ' || e2.last_name "이름",
e1.department_id "부서번호"
from employees e1, employees e2
where e1.first_name = 'Guy' and e1.department_id = e2.department_id 
and e2.first_name <> 'Guy';

-- 문제1 Ansi --
select d.department_name "부서명", count(e.employee_id) "사원 수"
from employees e join departments d
    on (e.department_id = d.department_id)
group by d.department_name
having count(e.employee_id) >= 5
order by count(*) desc;

-- 문제1 --
select d.department_name "부서명", count(e.employee_id) "사원 수"
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name
having count(e.employee_id) >= 5
order by count(employee_id) desc;

-- 문제2 --
select e.first_name || ' ' || e.last_name "Name",
e.job_id "업무", d.department_name, e.hire_date, e.salary,
s.grade "급여등급"
from employees e, departments d, salarygrade s
where e.salary between s.minsalary and s.maxsalary
and d.department_id(+) = e.department_id;

-- 문제3 --
select w.first_name || ' ' || w.last_name ||
' report to ' || upper(m.first_name || ' ' || m.last_name)
"Report to Someone"
from employees w, employees m
where w.manager_id = m.employee_id
union
select upper(first_name || ' ' || last_name) ||
' does not report '
from employees
where manager_id is null;