select *
from book;

insert into book (bookid, bookname, publisher, price)
values (11,'������ ����','�Ѽ����м���', 90000);

insert into book
values (12, '������ ����', '�Ѽ����м���', 90000);

insert into book(bookid, bookname, price, publisher)
values (13, '������ ����', 90000, '�Ѽ����м���');

insert into book(bookid, bookname, publisher)
values (14, '������ ����', '�Ѽ����м���');

insert into book(bookid, bookname, price, publisher)
    select bookid, bookname, price, publisher
    from imported_book;

select *
from book;

update customer
set address = '���ѹα� �λ�'
where custid = 5;

select *
from customer;

update customer
set address = (select address
                from customer
                where name='�迬��')
where name = '�ڼ���';

delete from customer
where custid=5;

select *
from customer;
