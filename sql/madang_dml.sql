select *
from book;

insert into book (bookid, bookname, publisher, price)
values (11,'스포츠 의학','한솔의학서적', 90000);

insert into book
values (12, '스포츠 의학', '한솔의학서적', 90000);

insert into book(bookid, bookname, price, publisher)
values (13, '스포츠 의학', 90000, '한솔의학서적');

insert into book(bookid, bookname, publisher)
values (14, '스포츠 의학', '한솔의학서적');

insert into book(bookid, bookname, price, publisher)
    select bookid, bookname, price, publisher
    from imported_book;

select *
from book;

update customer
set address = '대한민국 부산'
where custid = 5;

select *
from customer;

update customer
set address = (select address
                from customer
                where name='김연아')
where name = '박세리';

delete from customer
where custid=5;

select *
from customer;
