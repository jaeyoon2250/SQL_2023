--절댓값을 구하는 함수
select abs(-15) from dual;

--소수점 첫째자리에서 올림처리하는 함수
select ceil(15.7) from dual;

--파라미터 n(라디안으로 표현되는 각도)의 코사인값으로 반환하는 함수
select cos(3.14159) from dual;

--소수점 첫째자리에서 내림처리하는 함수
select floor(15.7) from dual;

--LOG(m, n)에서 밑을 m으로 한 n의 로그 값을 반환하는 함수
select log(10,100) from dual;

--나머지값을 반환하는 함수
select mod(11,4) from dual;

--거듭제곱값을 반환하는 함수
select power(3,2) from dual;

--반올림 값을 반환하는 함수
select round(15.7) from dual;

--숫자부호를 확인 후 반환하는 함수
select sign(-15) from dual;

--소수점 이하 값을 제거해주는 함수(15.7,3 인 경우 15.7 로 값을 반환(,뒤에 값은 몇번째 자릿수부터 제거할건지 설정))
select trunc(15.7) from dual;

--아스키코드값으로 값을 반환하는 함수
select chr(67) from dual;

--문자열을 연결해주는 함수
select concat('HAPPY','Birthday') from dual;

--문자열을 소문자로 반환하는 함수
select lower('Birthday') from dual;

--왼쪽에 패딩 추가 lpad : (문자열, 전체문자열길이, 채워넣을문자)
select lpad('Page 1', 15, '*.') from dual;

--문자열의 왼쪽(좌측) 공백  제거, 문자 왼쪽 반복적인 문자를 제거. LTRIM("문자열", "옵션") 
select ltrim('Page 1','ae') from dual;

--문자열 내에서 특정 문자/문자열을 새로운 문자/문자열로 대체. REPLACE("문자열", "제거할 문자", "대체할 문자")
select replace('JACK', 'J', 'BL') from dual;

--오른쪽에 패딩 추가 rpad : (문자열, 전체문자열길이, 채워넣을문자)
select rpad('Page 1', 15, '*.') from dual;

--문자열의 오른쪽(우측) 공백  제거, 문자 오른쪽 반복적인 문자를 제거. RTRIM("문자열", "옵션") 
select rtrim('Page 1', 'ae') from dual;

--특정 문자/문자열 추출. SUBSTR("문자열", "시작위치", "길이")
select substr('ABCDEFG',3,4) from dual;

--문자열의 우측 좌측 모두의 공백  제거, 문자 양쪽 반복적인 문자를 제거. TRIM("문자열", "옵션") 
select trim(LEADING 0 FROM '00AA00') from dual;

--문자열을 대문자로 반환하는 함수
select upper('Birthday') from dual;

--문자를 아스키코드 번호로 반환하는 함수
select ascii('A') from dual;

-- 1. 'CORPORATE FLOOR' 문자열에서 'OR'을 3번째 위치부터 찾고, 두 번째로 발견된 위치를 반환.
select instr('CORPORATE FLOOR','OR',3,2) from dual;

-- 2. 문자열 'Birthday'의 길이를 반환.
select length('Birthday') from dual;

-- 3. '14/05/21' 날짜를 날짜 형식으로 변환하고 1개월을 더한 날짜를 반환.
select add_months(TO_DATE('14/05/21', 'yy/mm/dd'),1) from dual;

-- 4. 현재 월의 마지막 날짜를 반환.
select last_day(sysdate) from dual;

-- 5. 다음 목요일의 날짜를 반환.
select next_day(sysdate, 'Thu') from dual;

-- 6. 현재 날짜를 반올림한 값을 반환.
select round(sysdate) from dual;

-- 7. 현재 날짜와 시간을 반환.
select sysdate from dual;

-- 8. 현재 날짜를 문자열로 변환하여 반환.
select to_char(sysdate) from dual;

-- 9. 숫자 123을 문자열로 변환하여 반환.
select to_char(123) from dual;

-- 10. 문자열을 'DD MM YYYY' 형식으로 해석하여 날짜로 변환.
select to_date('12 05 2014', 'DD MM YYYY') from dual;

-- 11. 문자열 '12.3'을 숫자로 변환.
select to_number('12.3') from dual;

-- 12. 값 1을 기준으로 조건을 비교하고, 일치하는 경우 'aa'를 반환.
select decode(1,1,'aa','bb') from dual;

-- 13. 두 값(123, 345)을 비교하고, 다를 경우 첫 번째 값(123)을 반환.
select nullif(123,345) from dual;

-- 14. 첫 번째 값이 NULL이므로 두 번째 값(123)을 반환.
select nvl(null, 123) from dual;



--고객의 이름과 전화번호를 출력하시오.(단 전화번호가 없는 고객은 '연락처없음'으로 출력하시오
select name 이름, phone 전화번호 from customer;
select name 이름, nvl(phone, '연락처 없음') 전화번호 from customer;

--고객목록에서 순번, 고객번호, 이름, 전화번호를 앞의 두명만 출력하시오
select rownum 순번, custid, name, phone from customer
where rownum <= 2;

--mybook 테이블 생성
create table mybook(
    bookid number not null primary key,
    price number
);

--데이터 행 삽입
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

--mybook 테이블의 데이터값 모두 출력
select * from mybook;

--null 값이 0으로 출력됨
select bookid, nvl(price,0) from mybook;

--price 값이 null 인 3번만 출력됨
select * from mybook
where price is null;

--price 값에 100씩 더해져서 출력됨, null값엔 변화 없음
select bookid, price+100 from mybook;

--bookid >= 4 이기 때문에 4이하로만 구성된 mybook 테이블의 값들이 출력되지 않음
select sum(price), avg(price), count(*) from mybook
where bookid >= 4;

--전체 데이터값은 3개이고, price 데이터값은 2개이므로 3 2 가 출력된다
select count(*), count(price) from mybook;

--null 값을 제외한 1번과 2번의 price의 합(30000)과 평균(15000)이 출력된다 
select sum(price), avg(price) from mybook;


--book 테이블의 데이터값 모두 출력
select * from book;

--5번째 값까지 book 테이블의 데이터값 모두 출력
select * from book 
where rownum <= 5;

--5번째 값까지 book 테이블의 데이터값 가격순으로 모두 출력
select * from book 
where rownum <= 5
order by price;

--book 테이블의 데이터값을 가격순으로 정렬 후 5번째 값까지 출력
select * from (select * from book order by price)book
where rownum <= 5;

--5번째 값까지 book 테이블의 데이터값 가격순으로 모두 출력
select * from (select * from book where rownum <= 5)book
order by price;

--5번째 값까지 book 테이블의 데이터값 가격순으로 모두 출력
select * from (select * from book where rownum <= 5 order by price)book;


--평균 판매금액 이하의 주문에 대해 주문번호와 판매금액을 출력하시오
select orderid 주문번호, saleprice 판매금액 from orders;

select avg(saleprice) from orders;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice <= (select avg(saleprice) from orders);

--각 고객의 평균판매금액보다 큰 금액의 주문 내역에대해서만 주문번호, 고객번호, 판매금액을 출력하시오
select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders;

select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid=so.custid);

--서울에 거주하는 고객에게 판매한 도서의 총판매금액을 출력하시오
select sum(saleprice) 총판매금액 from orders;
--서울에 거주하는 사람의 고객번호
select custid from customer
where address like '%서울%';

select sum(saleprice) 총판매금액 from orders
where custid in(select custid from customer
where address like '%서울%');

--서울에 거주하지 않는 고객에게 판매한 도서의 총판매금액을 출력하시오
select sum(saleprice) 총판매금액 from orders
where custid not in(select custid from customer
where address like '%서울%');


--3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오.
select orderid 주문번호, saleprice 판매금액 from orders;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice > all(select saleprice from orders where custid=3);

select saleprice from orders where custid=3;

--서울에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.(단 exist 연산자 사용)
select sum(saleprice) 총판매금액 from orders mo
where exists(
    select * from customer c
    where address like '%서울%' and mo.custid=c.custid);
    
--고객별 판매금액의 합계를 출력하시오.(고객번호, 판매합계)
select custid 고객번호, sum(saleprice) 판매합계 from orders
group by custid;

--고객별 판매금액의 합계를 출력하시오.(고객명, 판매합계)
select (select name from customer c
        where c.custid=o.custid)고객명, sum(saleprice) 판매합계 from orders o, customer c
group by o.custid;

--주문목록에 책이름을 저장할 수 있는 컬럼을 추가하시오
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid=o.bookid);

--고객번호가 2이하인 고객번호와 이름을 출력하시오.
select custid 고객번호, name 이름 from customer
where custid <= 2;

--고객번호가 2이하인 고객의 판매금액을 출력하시오.(고객이름과 고객별 판매 총액)
select name 고객명, sum(saleprice) 판매총액
from (select custid, name from customer
            where custid <= 2) c, orders o
where c.custid=o.custid
group by name;

--고객번호, 주소, 총판매액이 고객번호별로 묶어서출력되게 하는 수행문
select custid,(select address from customer cs where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;