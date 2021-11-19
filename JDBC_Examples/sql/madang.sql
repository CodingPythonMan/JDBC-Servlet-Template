select bookname, price
from book;

select price, bookname
from book;

select bookid, bookname, publisher, price
from book;

select *
from book;

select publisher
from book;

select distinct publisher
from book;

select *
from book
where price < 20000;

select *
from book
where price between 10000 and 20000;

select *
from book
where price >= 10000 and price <= 20000;

select *
from book
where publisher in ('�½�����', '���ѹ̵��');

select *
from book
where publisher not in ('�½�����', '���ѹ̵��');

select bookname, publisher
from book
where bookname like '�౸�� ����';

select bookname, publisher
from book
where bookname like '%�౸%';

select *
from book
where bookname like '_��%';

select *
from book
where bookname like '%�౸%' and price >= 20000;

select *
from book
where publisher in ('�½�����', '���ѹ̵��');

select *
from book
order by bookname;

select *
from book
order by price, bookname;

select *
from book
order by price desc, publisher asc;

select bookname
from book
where bookid = 1;

select bookname
from book
where price >= 20000;

select name, address
from customer;

select orderid
from orders
where orderdate between '20/07/04' and '20/07/07';

select name, address
from customer
where name like '��%';

select name, address
from customer
where name like '��%��';

select custid, count(*) as ��������, sum(saleprice) as �Ѿ�
from orders
group by custid;

select *
from customer, orders
where customer.custid = orders.custid
order by customer.custid;

select name, saleprice
from customer, orders
where customer.custid = orders.custid;

select name, sum(saleprice)
from customer, orders
where customer.custid = orders.custid
group by customer.name
order by customer.name;

select c.name, b.bookname
from customer c, orders o, book b
where c.custid = o.custid and  o.bookid = b.bookid;

select c.name, saleprice
from customer c left outer join orders o
on c.custid = o.custid;

select c.name "�̸�", sum(o.saleprice) "���հ�"
from customer c, orders o
where c.custid = o.custid and c.name = '������'
group by c.name;

select c.name "�̸�", count(o.saleprice) "������ ��"
from customer c, orders o
where c.custid = o.custid and c.name = '������'
group by c.name;

select c.name "�̸�", count(b.publisher) "���ǻ� ��"
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid
and c.name = '������'
group by c.name;

select c.name "�̸�", b.bookname "å ����", o.saleprice "����",
b.price - o.saleprice "������ �ǸŰ����� ����"
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid
and c.name = '������';

select bookname "�������� �������� ���� å ����"
from book
minus
select b.bookname
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid
and c.name = '������';

select count(*) "������ �Ѽ�"
from book;

select count(distinct publisher) "���ǻ� ��"
from book;

-- �������� 2-5 --
select orderid "�ֹ���ȣ", orderdate "�ֹ���¥"
from orders
where orderdate < '20/07/04' or orderdate >'20/07/07';

select name "�ֹ����� ���� ���� �̸�"
from customer
minus
select c.name
from customer c, orders o
where c.custid = o.custid;

select sum(saleprice) "�Ѿ�", avg(saleprice) "��ձݾ�"
from orders;

select c.name "�̸�", sum(o.saleprice) "���� ���ž�"
from customer c, orders o
where c.custid = o.custid
group by c.name;

select c.name "�̸�", b.bookname "������ ����"
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid;

select bookname
from book
where price = (select max(price)
                from book);
                
select name
from customer
where custid in(select custid
                from orders
                where bookid in(select bookid
                                from book  
                                where publisher = '���ѹ̵��'));
                                
select b1.bookname
from book b1
where b1.price > (select avg(b2.price)
                    from book b2
                    where b2.publisher = b1.publisher);
                    
select name, address
from customer cs
where exists (select *
                from orders od
                where cs.custid = od.custid);

-- ����12 --
select max("������ ���ݰ� �ǸŰ����� ����")
from (select b.price - o.saleprice "������ ���ݰ� �ǸŰ����� ����"
        from book b, orders o
        where b.bookid = o.bookid);
        
-- ����13 --
select name
from customer
where custid in (select custid
                from orders
                group by custid
                having avg(saleprice) > (select avg(saleprice)
                                            from orders));

select custid
from orders
group by custid
having avg(saleprice) > 11800;