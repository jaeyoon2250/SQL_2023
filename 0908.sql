--집합연산자: 합집합(UNION), 차집합(MINUS), 교집합(INTERSECT)
--도서를 주문하지 않은 고객의 이름을 쓰시오
select name from customer
MINUS
select name from customer
where custid in (select distinct custid from orders);

--집합을 사용하지 않고 검색하시오
select name from customer
where custid not in (select distinct custid from orders);

--주문이 있는 고객의 이름과 주소를 보이시오
select name, address from customer
where custid in (select distinct custid from orders);

--동등조인과 중복행 제거한 경우
select DISTINCT name, address from customer c, orders o
where c.custid = o.custid;
--Exists 사용한 경우
select name, address from customer c
where exists (select * from orders o
                        where c.custid = o.custid);


--박지성이 구매한 도서의 출판사 수
select count(distinct publisher) as "출판사 갯수" from book
where bookid in (select bookid from orders
                    where custid=1);
--박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
SELECT bookname, price, price-saleprice
FROM Customer, Orders, Book
WHERE (Customer.custid=Orders.custid) 
AND (Book.bookid=Orders.bookid) 
AND (Customer.name='박지성');

--박지성이 구매하지 않은 도서의 이름
select bookname from book 
where bookid not in (select bookid from orders
                        where custid=1);
--주문하지 않은 고객의 이름(부속질의 사용)
select name from customer
MINUS
select name from customer
where custid in (select distinct custid from orders);

--주문 금액의 총액과 주문의 평균 금액
select sum(saleprice), avg(saleprice) from orders;

--고객의 이름과 고객별 구매액
select name, sum(saleprice) from orders o, customer c
where o.custid = c.custid
group by name;

--고객의 이름과 고객이 구매한 도서목록
SELECT name, bookname
FROM Book, Orders, Customer
WHERE Orders.bookid=Book.bookid AND Orders.custid=Customer.custid;

--도서의 가격(book 테이블)과 판매가격(orders 테이블)의 차이가 가장 많은 주문
select * from orders o, book b
where o.bookid=b.bookid 
and (price-saleprice) = (select max(price - saleprice) from orders, book
                                                where orders.bookid = book.bookid);
                                                
--13)도서 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
select name from customer c, orders o
where  c.custid = o.custid
group by name
having avg(saleprice) > (select avg(saleprice) from orders);


--DDL(data defination language):데이터 정의어
--create table/alter table/drop tabel

--테이블 생성 연습 1
create table newbook1(
    bookid number,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price number
);

--테이블 생성 연습 2
--primary key 설정 방법 1
create table newbook2(
    bookid number,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price number,
    PRIMARY KEY (bookid)
);

--테이블 생성 연습 3
--primary key 설정 방법 2
create table newbook3(
    bookid number primary key,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price number
);

--bookname 컬럼: null값을 가질수 없음
--publisher 컬럼: 동일한 값을 가질수 없음
--price 컬럼: 가격이 입력되어 있지 않으면 기본값을 10000으로하고 입력될 때는 1000초과로 함
--bookname, publisher 컬럼을 복합키로 설정

create table newbook4(
    bookname VARCHAR2 (20) not null,
    publisher VARCHAR2(20) UNIQUE,
    price number DEFAULT 10000 check(price > 1000),
    primary key(bookname, publisher)
);