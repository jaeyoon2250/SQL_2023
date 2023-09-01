SELECT * FROM book
        WHERE bookname like '%과학%' and price >= 7000;
        
--book 테이블에서 출판사가 굿스포츠 또는 어크로스인 도서를 검색하시오
SELECT * FROM book
        WHERE publisher='굿스포츠' or publisher='어크로스';
        
--위의 문제를 in 연산자를 사용하여 수정해 보세요
SELECT * FROM book
        WHERE publisher in ('굿스포츠', '빈지노');
        
--book 테이블에서 도서명순으로 검색하시오
SELECT * FROM book ORDER BY bookname;

--book 테이블에서 가격순으로 검색하고 같은 가격이면 이름순으로 검색하시오
SELECT * FROM book ORDER BY price, bookname;

--DESC : 내림차순, ASC : 오름차순
--book 테이블에서 가격을 내림차순으로 검색하고, 만약 가격이 같다면 출판사 순으로 검색하시오
SELECT * FROM book ORDER BY price DESC, publisher ASC;

SELECT * FROM orders;
--orders 테이블에서 고객이 주문한 도서의 총 판매액을 구하시오
SELECT sum(saleprice) as 총판금 from orders;

--orders 테이블에서 고객번호가 1인 고객이 주문한 총 판매액을 검색하시오
select sum(saleprice) as 총판금 
from orders
where custid=1;

--orders 테이블에서 판매액의 합계, 평균, 최소값, 최대값을 구하시오
select sum(saleprice) as 총판매금액,
    avg (saleprice) as 판매금액평균,
    min (saleprice) as 최저가,
    max (saleprice) as 최고가
    from orders;

--orders 테이블에서 판매한 도서의 개수를 구하시오
select count(*) from orders;

--orders 테이블에서 도서가격이 13000원 이상인 도서의 개수를 구하시오
select count(*) from orders where saleprice >= 6000;

--orders 테이블에서 고객번호가 1 또는 3인 고객의 주문 개수를 구하시오
select count(*) from orders where custid in(1, 3);

--orders 테이블에서 고객별 주문한 도서의 개수와 총합계를 구하시오
--그룹화 할 때는 group by 사용
select count(*) 주문수량, sum(saleprice) 주문총액 from orders
group by custid
order by custid;

--orders 테이블에서 판매가격이 6000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량을 구하시고
--단 2번이상 구매한 고객만 출력하시오
select custid, count(*) as 도서수량  from orders
where saleprice >= 6000
group by custid
having count(*) >= 2
order by custid;


--연습문제
--도서번호가 1인 도서의 이름 
select bookname from book
where bookid=1;
--가격이 5000원 이상인 도서의 이름
select bookname from book
where price >= 5000;
--박지성의 총 구매액(박지성의 고객번호는 1)
select sum(saleprice) as "총 구매액" from orders
where custid=1;
--박지성이 구매한 도서의 수
select count(*) as "구매도서 수량" from orders
where custid=1;
--마당서점 도서의 총 개수
select count(*) as "도서 총 개수" from orders;
--마당서점에 도서를 출고하는 출판사의 총 개수
select count(distinct publisher) as "출판사 총 개수" from book;
--모든 고객의 이름, 주소
select name, address from customer;
--2023년 1월 ~ 2월 사이에 주문 받은 도서의 주문번호
select orderid from orders
where orderdate BETWEEN TO_DATE('2023-01-01', 'yyyy-mm-dd') AND TO_DATE('2023-02-28', 'yyyy-mm-dd');
--2023년 1월 ~ 2월 사이에 주문 받은 도서를 제외한 도서의 주문번호
select orderid from orders
where NOT orderdate BETWEEN TO_DATE('2023-01-01', 'yyyy-mm-dd') AND TO_DATE('2023-02-28', 'yyyy-mm-dd');
--성이 '김'씨인 고객의 이름과 주소
select name, address from customer
where name like '김%';
--성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
select name, address from customer
where name like '김_아';