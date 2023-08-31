--도서정보 Book 테이블
create table Book(
    bookid NUMBER(2) primary key, --number(?) ? 는 숫자 자릿수
    bookname VARCHAR2(40),  --글자 길이는 byte가 기준
    publisher VARCHAR2(40),
    price NUMBER(8)
);

--수입도서 Imported_Book 테이블

create table Imported_Book(
    bookid NUMBER(2), --number(?) ? 는 숫자 자릿수
    bookname VARCHAR2(40),  --글자 길이는 byte가 기준
    publisher VARCHAR2(40),
    price NUMBER(8)
);

--고객정보 Customer 테이블
create table Customer(
    custid NUMBER(2) primary key,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

--주문정보 Orders 테이블
create table Orders(
    orderid NUMBER(2) primary key,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);

-- Book 테이블에 10권의 도서 정보를 추가하세여
insert into Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
insert into Book VALUES(2, '신비의 섬', '쥘 베른', 9000);
insert into Book VALUES(3, '해저 2만리', '쥘 베른', 8000);
insert into Book VALUES(4, '해저2만리 2', '쥘 베른', 8000);
insert into Book VALUES(5, 'SANSO', '빈지노', 7000);
insert into Book VALUES(6, '세이노의 가르침', '세이노', 6000);
insert into Book VALUES(7, '공정하다는 착각', '마이클 샌델', 9000);
insert into Book VALUES(8, '80일간의 세계일주', '쥘 베른', 8000);
insert into Book VALUES(9, '책섬', '김한민', 5000);
insert into Book VALUES(10, '15소년 표류기', '쥘 베른', 7000);

--Customer 테이블에 고객정보 5개를 추가하세여
insert into customer VALUES(1, '박지성', '맨체스터', 010-0707-0707);
insert into customer VALUES(2, '김연아', '서울 동작구 흑석동', 010-0657-0777);
insert into customer VALUES(3, '추신수', '인천광역시 연수구', 032-507-0707);
insert into customer VALUES(4, '박세리', '대전광역시 유성구', 042-777-0707);
insert into customer VALUES(5, '장미란', '서울 용산구 보광동', 02-007-0707);