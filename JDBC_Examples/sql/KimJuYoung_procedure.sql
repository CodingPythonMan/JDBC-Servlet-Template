create or replace procedure empproc
is
    vword varchar2(1);
    vemp employees%rowtype;
    cursor c1(vword varchar2)
    is
    select employee_id, first_name, salary
    from employees
    where first_name like '%' || vword || '%';
begin
    vword := dbms_random.string('U', 1);
    dbms_output.put_line('������ ���� :' || vword);
    open c1(vword);
    dbms_output.put_line('������ȣ / ������ / �޿�');
    dbms_output.put_line('---------------------------------------');
    loop
        fetch c1 into vemp.employee_id, vemp.first_name, vemp.salary;
        if c1%rowcount = 0 then
            dbms_output.put_line('�ش� ������ �������� �ʽ��ϴ�.');
        end if;
        exit when c1%notfound;
        dbms_output.put_line(vemp.employee_id || ' / ' || vemp.first_name || ' / ' || vemp.salary);
    end loop;
end;
/

execute empproc;

select *
from user_source;

create or replace procedure empproc2
(vdeptno in employees.department_id%type)
is
    cursor c1
    is
    select * from employees
    where department_id=vdeptno;
begin
    dbms_output.put_line('������ȣ / ������ / �޿�');
    dbms_output.put_line('--------------------------');
    for vemp in c1 loop
    dbms_output.put_line(vemp.employee_id || ' / ' || vemp.first_name || ' / ' || vemp.salary);
    end loop;
end;
/
show error;

execute empproc2(30);

drop table emp01;

create table emp01
as
select department_id, first_name, salary
from employees;

select department_id, first_name, salary
from emp01
where department_id in(10, 20);

create or replace procedure empproc_inmode
(v_deptno in emp01.department_id%type)
is
begin
    update emp01 set salary = decode(v_deptno, 10, salary*1.1, 20, salary*1.2, salary)
    where department_id = v_deptno;
    commit;
    dbms_output.put_line('������ �Ϸ�Ǿ����ϴ�.');
end empproc_inmode;
/
show error;

execute empproc_inmode(10);
execute empproc_inmode(20);

select department_id, first_name, salary
from emp01
where department_id in(10, 20);

drop table dept01;

create table dept01(
    deptno number(2) primary key,
    dname varchar2(20) not null,
    loc varchar2(13) not null
);

select deptno, dname, loc
from dept01
order by deptno;

insert into dept01
values(10, '�λ��', '����');
insert into dept01
values(20, '�ѹ���', '����');
insert into dept01
values(30, '������', '����');
insert into dept01
values(40, '�����', '��õ');
insert into dept01
values(50, '�ü�������', '����');

alter table dept01
add(credate date default sysdate);

select deptno, dname, loc, credate
from dept01
order by deptno;

create or replace procedure deptproc_inmode
(deptno in dept01.deptno%type,
dname in dept01.dname%type,
loc in dept01.loc%type)
is
begin
    insert into dept01(deptno, dname, loc, credate)
    values(deptno, dname, loc, sysdate);
    commit;
    
    dbms_output.put_line('�μ���ȣ / �μ��� / ������ / �����');
    dbms_output.put_line('----------------------------');
    
    for vdept in (select deptno, dname, loc, credate from dept01 order by deptno) loop
        dbms_output.put_line(vdept.deptno || ' / ' || rpad(vdept.dname, 10) || ' / '
        || vdept.loc || ' / ' || to_char(vdept.credate, 'yyyy-mm-dd'));
    end loop;
end;
/
show error;

execute deptproc_inmode(60, '��ȹ��', '�λ�');

create or replace procedure deptproc_inup
(pdeptno in dept01.deptno%type,
pdname in dept01.dname%type,
ploc in dept01.loc%type)
is
    cnt number := 0;
    vdept dept01%rowtype;
begin
    select count(*) into cnt from dept01 where deptno = pdeptno;
    if cnt = 0 then
        insert into dept01(deptno, dname, loc, credate)
        values(pdeptno, pdname, ploc, sysdate);
    else
        update dept01
        set dname = pdname, loc = ploc, credate = sysdate
        where deptno = pdeptno;
    end if;
    commit;
    
    dbms_output.put_line('�μ���ȣ / �μ��� / ������ / �����');
    dbms_output.put_line('---------------------------');
    select deptno, dname, loc, credate into vdept
    from dept01 where deptno = pdeptno;
    dbms_output.put_line(vdept.deptno || ' / ' || rpad(vdept.dname, 10) || ' / '
    || vdept.loc || ' / ' || to_char(vdept.credate, 'yyyy-mm-dd'));
end;
/
show error;

execute deptproc_inup(60, '��ȹ��', '����');
execute deptproc_inup(70, '������', '����');

-- 10p
create or replace procedure empproc_outmode(
    vempno in employees.employee_id%type,
    vename out employees.first_name%type,
    vsal out employees.salary%type,
    vjob out employees.job_id%type
)
is
begin
    select first_name, salary, job_id into vename, vsal, vjob
    from employees
    where employee_id = vempno;
end;
/

declare
    vemp employees%rowtype;
begin
    empproc_outmode(200, vemp.first_name, vemp.salary, vemp.job_id);
    dbms_output.put_line('������ :' || vemp.first_name);
    dbms_output.put_line('�� �� :' || vemp.salary);
    dbms_output.put_line('�� �� :' || vemp.job_id);
end;
/

variable vename varchar2(10)
variable vsal number
variable vjob varchar2(9)

-- ����� ������ ���� �޾ƿ��� ���ؼ��� ���ν��� ȣ��� ���� �տ� ':'�� �����δ�.
execute empproc_outmode(200, :vename, :vsal, :vjob);
print vename
print vsal
print vjob;

create or replace procedure proc_inoutmode
(v_sal in out varchar2)
is
begin
    v_sal := '$' || substr(v_sal, -9, 3) || ',' || substr(v_sal, -6, 3) || ',' || substr(v_sal, -3, 3);
end proc_inoutmode;
/

declare
    strnum varchar2(20) := '123456789';
begin
    proc_inoutmode(strnum);
    dbms_output.put_line('STRNUM = ' || strnum);
end;

-- 14p pakage
create or replace package emppack
is
    procedure empproc;
    procedure empproc2(vdeptno in employees.department_id%type);
end;
/

create or replace package body emppack
is
    procedure empproc
    is
        vword varchar2(1);
        vemp employees%rowtype;
        cursor c1(vword varchar2)
        is
        select employee_id, first_name, salary
        from employees
        where first_name like '%' || vword || '%';
    begin
        vword := dbms_random.string('U', 1);
        dbms_output.put_line('������ ���� :' || vword);
        
        open c1(vword);
        dbms_output.put_line('������ȣ / ������ / �޿�');
        dbms_output.put_line('-----------------------------');
        
        loop
            fetch c1 into vemp.employee_id, vemp.first_name, vemp.salary;
            if c1%rowcount = 0 then
                dbms_output.put_line('�ش� ������ �������� �ʽ��ϴ�');
            end if;
            exit when c1%notfound;
            dbms_output.put_line(vemp.employee_id || ' / ' || vemp.first_name || ' / ' || vemp.salary);
        end loop;
    end;
    
    procedure empproc2(vdeptno in employees.department_id%type)
    is
        cursor c1
        is
        select * from employees where department_id=vdeptno;
    begin
        dbms_output.put_line('������ȣ / ������ / �޿�');
        dbms_output.put_line('-------------------------------');
        for vemp in c1 loop
            dbms_output.put_line(vemp.employee_id || ' / ' || vemp.first_name || ' / ' || vemp.salary);
        end loop;
    end;
end;
/
    
execute emppack.empproc;
execute emppack.empproc2(10);

drop table emp02;

create table emp02
as
select employee_id, first_name, hire_date
from employees;

-- �������(Retire_date) �÷� �߰�
alter table emp02
add(retire_date date);

-- ��Ű�� �����
create or replace package emp02_pkg is
    -- ����� �޾� �̸��� ��ȯ�ϴ� �Լ�
    function fn_get_emp02_name(vempno in number)
    return varchar2;
    
    -- �ű� ���� �Է�
    procedure new_emp02_proc
    (vename in emp02.first_name%type, vhiredate emp02.hire_date%type);
    
    -- ��� ���� ó��
    procedure retire_emp02_proc(vempno in emp02.employee_id%type);
end emp02_pkg;
/

-- ��Ű�� ����
create or replace package body emp02_pkg is
    -- ���� ��ȣ�� �޾� �̸��� ��ȯ�ϴ� �Լ�
    function fn_get_emp02_name(vempno in number)
    return varchar2
    is
        vename emp02.first_name%type;
    begin
        -- �������� �����´�.
        select first_name
            into vename
            from employees
            where employee_id =  vempno;
        -- ������ ��ȯ
        return nvl(vename, '�ش� ���� ����');
    end fn_get_emp02_name;
    
    -- �ű� ���� �Է�
    procedure new_emp02_proc
    (vename in emp02.first_name%type, vhiredate in emp02.hire_date%type)
    is
        vempno emp02.employee_id%type;
    begin
        -- �űԻ���� ��� = �ִ� ��� + 1
        select nvl(max(employee_id), 0) + 1
        into vempno
        from employees;
        
        insert into emp02(employee_id, first_name, hire_date)
        values(vempno, vename, nvl(vhiredate, sysdate));
        commit;
        
        exception when others then
        dbms_output.put_line(sqlerrm);
        rollback;
    end new_emp02_proc;
    
    -- ��� ���� ó��
    procedure retire_emp02_proc(vempno in emp02.employee_id%type)
    is
        cnt number := 0;
        e_no_data exception;
    begin
        -- ����� ������ �������̺��� �������� �ʰ� �ϴ� �������(retire_date)�� null���� �����Ѵ�.
        update emp02 set retire_date = sysdate
        where employee_id = vempno and retire_date is null;
        
        -- update �� �Ǽ��� �����´�.
        cnt := sql%rowcount;
        
        -- ���ŵ� �Ǽ��� ������ ����� ����ó��
        if cnt = 0 then
            raise e_no_data;
        end if;
        commit;
        
        exception
            when e_no_data then
                dbms_output.put_line(vempno || '�� �ش�Ǵ� ���ó���� ������ �����ϴ�!');
                rollback;
            when others then
                dbms_output.put_line(sqlerrm);
                rollback;
    end retire_emp02_proc;
end emp02_pkg;
/

select emp02_pkg.fn_get_emp02_name(200) from dual;

execute emp02_pkg.new_emp02_proc('Roberts', '2021-01-01');

select *
from emp02
where first_name = 'Roberts';

execute emp02_pkg.retire_emp02_proc(198);

select *
from emp02;

desc dba_objects;

select object_name from DBA_OBJECTS
where object_type = 'PACKAGE' and object_name like 'DBMS_%'
order by object_name;

drop table emp01;

create table emp01(
    empno number(4) primary key,
    ename varchar2(20),
    job varchar2(50)
);

create or replace trigger emp_trg01
after insert
on emp01
begin
    dbms_output.put_line('���Ի���� �Ի��߽��ϴ�.');
end;
/

insert into emp01(empno, ename, job)
values(1, 'ȫ�浿', '�濵������(��ȹ/����)');

create table sal01(
    salno number(4),
    sal number,
    empno number(4),
    constraint sal01_pk primary key(salno),
    constraint sal01_fk foreign key(empno) references emp01(empno)
);

create sequence sal01_seq
start with 0
increment by 1
minvalue 0
maxvalue 100000
nocycle
cache 2;

create or replace trigger emp_trg02
after insert
on emp01
for each row
begin
    insert into sal01(salno, sal, empno)
    values(sal01_seq.nextval, 2000000, :new.empno);
end;
/

delete from emp01 where empno = 1;
insert into emp01(empno, ename, job) values(1, '��ö��', '�濵������(����/����)');

select *
from emp01;

select *
from sal01;

insert into emp01 values(2, '�̸���', '�濵������(�λ�)');

create or replace trigger emp_trg03
after delete on emp01
for each row
begin
    delete from sal01 where empno=:old.empno;
end;
/

delete from emp01 where empno=2;

create table product(
    pcode char(6), -- ��ǰ�ڵ�
    pname varchar2(12) not null, -- ��ǰ��
    pcompany varchar(12), -- ������
    pprice number(8), -- ����
    stock number default 0, -- ������
    constraint product_pk primary key(pcode)
);

create table receiving(
    rno number(6), -- �԰��ȣ
    pcode char(6), -- ��ǰ�ڵ�
    rdate date default sysdate, -- �԰�¥
    rqty number(6), -- �԰����
    rprice number(8), -- �԰���
    ramount number(8), -- �԰�ܰ�
    constraint receiving_pk primary key(rno),
    constraint receiving_fk foreign key(pcode) references product(pcode)
);

alter table receiving
rename column rpice to rprice;

insert into product(pcode, pname, pcompany, pprice)
values('A00001', '��Ź��', 'LG', 1500000);
insert into product(pcode, pname, pcompany, pprice)
values('A00002', '��ǻ��', 'LG', 1000000);
insert into product(pcode, pname, pcompany, pprice)
values('A00003', '�����', '�Ｚ', 4500000);

select * from product;

create or replace trigger trg_in
after insert on receiving
for each row
begin
    update product
    set stock = stock + :new.rqty -- ������ = ������ + �԰����
    where pcode = :new.pcode;
end;
/

insert into receiving(rno, pcode, rqty, rprice, ramount)
values(1, 'A00001', 5, 850000, 950000);

insert into receiving(rno, pcode, rqty, rprice, ramount)
values(2, 'A00002', 10, 680000, 780000);

insert into receiving(rno, pcode, rqty, rprice, ramount)
values(3, 'A00003', 10, 250000, 300000);

select *
from receiving;