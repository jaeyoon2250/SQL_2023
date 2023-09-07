--동등조인(Equi Join)
--여러개의 테이블을 연결할 때 특정 컬럼의 값이 같은 행들만 검색할 때 사용

--고객과 고객의 주문에 관한 데이터를 모두 출력하시오
SELECT * FROM customer, orders
where customer.custid = orders.custid;

--고객과 고객의 주문에 관한 데이터를 모두 고객번호순으로 출력하시오
select * from customer, orders
where customer.custid = orders.custid
order by customer.custid desc;

--고객의 이름, 주문한 도서 판매가격을 검색하시오
select name, saleprice from customer c, orders o
where c.custid = o.custid;

--고객이름별로 주문한 모든 도서의 총판매액을 구하고 고객이름순으로 정력하시오
select name, sum(saleprice) from customer c, orders o
where c.custid = o.custid
group by name
order by name;
--sum 을 사용하려면 sum 앞의 컬럼을 그룹바이를 해준 뒤 사용할 수 있다

--고객의 이름과 주문한 도서의 이름을 구하시오
--3개의 테이블에 대한 동등조인
select name, bookname from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid
order by name;

--도서가격이 8000원인 도서를 주문한 고객이름과 도서이름을 출력하시오
select name, bookname from customer c, book b, orders o
where c.custid = o.custid and b.bookid = o.bookid and price = 8000;

--Sub Query
--main Query 내에 있는 Query
--도서가격이 가장 비싼 데이터행을 검색하시오
select max(price) from book;

--도서가격이 가장 비싼 도서의 이름을 검색하시오
select bookname from book
where price = 9000;

--도서가격이 가장 싼 도서의 이름과 가격을 출력하시오
select bookname, price from book
where price=(select min(price) from book);

--도서를 구매한 고객의 고객아이디를 검색하시오
select custid from orders;

--도서를 구매한 적이 있는 고객의 이름을 검색하시오
select name from customer
where custid in (select custid from orders);

--도서를 구매한 사람
select name from customer;

--쥘 베른이 출판한 책의 아이디와 이름을 검색하시오
select bookid, bookname from book
where publisher = '쥘 베른';

--쥘베른이 출판한 도서를 구매한 고객의 이름을 검색하시오
select name from customer
where custid in (select distinct custid 
                from orders
                where bookid in (select bookid
                                from book
                                where publisher = '쥘 베른'));


