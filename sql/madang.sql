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
where publisher in ('굿스포츠', '대한미디어');

select *
from book
where publisher not in ('굿스포츠', '대한미디어');

select bookname, publisher
from book
where bookname like '축구의 역사';

select bookname, publisher
from book
where bookname like '%축구%';

select *
from book
where bookname like '_구%';

select *
from book
where bookname like '%축구%' and price >= 20000;

select *
from book
where publisher in ('굿스포츠', '대한미디어');

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
where name like '김%';

select name, address
from customer
where name like '김%아';

select custid, count(*) as 도서수량, sum(saleprice) as 총액
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

select c.name "이름", sum(o.saleprice) "총합계"
from customer c, orders o
where c.custid = o.custid and c.name = '박지성'
group by c.name;

select c.name "이름", count(o.saleprice) "도서의 수"
from customer c, orders o
where c.custid = o.custid and c.name = '박지성'
group by c.name;

select c.name "이름", count(b.publisher) "출판사 수"
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid
and c.name = '박지성'
group by c.name;

select c.name "이름", b.bookname "책 제목", o.saleprice "가격",
b.price - o.saleprice "정가와 판매가격의 차이"
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid
and c.name = '박지성';

select bookname "박지성이 구매하지 않은 책 제목"
from book
minus
select b.bookname
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid
and c.name = '박지성';

select count(*) "도서의 총수"
from book;

select count(distinct publisher) "출판사 수"
from book;

-- 연습문제 2-5 --
select orderid "주문번호", orderdate "주문날짜"
from orders
where orderdate < '20/07/04' or orderdate >'20/07/07';

select name "주문하지 않은 고객의 이름"
from customer
minus
select c.name
from customer c, orders o
where c.custid = o.custid;

select sum(saleprice) "총액", avg(saleprice) "평균금액"
from orders;

select c.name "이름", sum(o.saleprice) "고객별 구매액"
from customer c, orders o
where c.custid = o.custid
group by c.name;

select c.name "이름", b.bookname "구매한 도서"
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
                                where publisher = '대한미디어'));
                                
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

-- 문제12 --
select max("도서의 가격과 판매가격의 차이")
from (select b.price - o.saleprice "도서의 가격과 판매가격의 차이"
        from book b, orders o
        where b.bookid = o.bookid);
        
-- 문제13 --
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