--oders 테이블
insert into orders VALUES (1, 1, 1, 7000, TO_DATE('2023-01-10', 'yyyy-mm-dd'));
insert into orders VALUES (2, 1, 9, 5000, TO_DATE('2023-01-16', 'yyyy-mm-dd'));
insert into orders VALUES (3, 2, 6, 6000, TO_DATE('2023-01-05', 'yyyy-mm-dd'));
insert into orders VALUES (4, 2, 9, 5000, TO_DATE('2023-01-18', 'yyyy-mm-dd'));
insert into orders VALUES (5, 2, 10, 7000, TO_DATE('2023-02-03', 'yyyy-mm-dd'));
insert into orders VALUES (6, 3, 9, 5000, TO_DATE('2023-02-10', 'yyyy-mm-dd'));
insert into orders VALUES (7, 4, 9, 5000, TO_DATE('2023-02-14', 'yyyy-mm-dd'));
insert into orders VALUES (8, 5, 2, 9000, TO_DATE('2023-02-19', 'yyyy-mm-dd'));
insert into orders VALUES (9, 5, 3, 8000, TO_DATE('2023-02-27', 'yyyy-mm-dd'));
insert into orders VALUES (10, 5, 9, 5000, TO_DATE('2023-03-08', 'yyyy-mm-dd'));

--imported_book 테이블
insert into imported_book VALUES (11, 'Zen Golf', 'pearson', 12000);
insert into imported_book VALUES (12, 'Soccer Skills', 'Human Kinetics', 15000);

SELECT publisher, price FROM book
                        WHERE bookname LIKE '책섬';


SELECT phone FROM customer
            WHERE name='김연아';
            
SELECT * FROM customer
            WHERE name='김연아';
            
--book 테이블에서 도서명과 가격을 검색하시오
SELECT bookname, price FROM book;
--book 테이블에서 가격과 도서명을 검색하시오
SELECT price, bookname FROM book;
--book 테이블에서 도서번호, 도서명, 출판사, 가격을 검색하시오
SELECT * FROM book;
--book 테이블에서 모든 출판사를 검색하시오
SELECT publisher FROM book;
--book 테이블에서 모든 출판사를 검색하시오 (중복을 제거하세요)
SELECT DISTINCT publisher FROM book;
--book 테이블에서 가격이 10000원 미만인 도서를 검색하시오
SELECT * FROM book
        WHERE price < '10000';
--book 테이블에서 가격이 5000원 이상 7000원 이하인 도서를 검색하시오
SELECT * FROM book
        WHERE price BETWEEN 5000 and 7000;
--book 테이블에서 가격이 5000원 이상 7000원 이하인 도서를 검색하시오(between 사용 x)
SELECT * FROM book
        WHERE price >= 5000 and price <= 7000;
        
--book 테이블에서 출판사가 굿스포츠, 해냄, 웅진지식하우스인 도서를 검색하시오
--단 in 연산자를 사용하시오
SELECT * FROM book
        WHERE publisher in ('굿스포츠', '해냄', '웅진지식하우스');
--book 테이블에서 출판사가 굿스포츠, 해냄, 웅진지식하우스인 도서를 검색하시오
--단 in 연산자를 사용하지 마시오
SELECT * FROM book 
        WHERE book.publisher='굿스포츠' 
        or book.publisher='해냄' or book.publisher='웅진지식하우스';
--book 테이블에서 출판사가 굿스포츠, 해냄, 웅진지식하우스가 아닌 도서를 검색하시오
--단 not in 연산자를 사용하시오
SELECT * FROM book
         WHERE publisher NOT IN ('굿스포츠', '해냄', '웅진지식하우스');
--book 테이블에서 출판사가 굿스포츠, 해냄, 웅진지식하우스가 아닌 도서를 검색하시오
--단 not in 연산자를 사용하지 마시오
SELECT * FROM book
          WHERE book.publisher<>'굿스포츠'
        and book.publisher<>'해냄' and book.publisher<>'웅진지식하우스';  
        
--book 테이블에서 도서명에 축구의 역사를 검색하시오
SELECT * FROM book
        WHERE bookname='축구의 과학 역사';

SELECT * FROM book
        WHERE bookname LIKE '축구의 과학 역사';
        
--book 테이블에서 도서명에 축구라는 문자열이 포함된 행을 검색하시오
SELECT * FROM book 
        WHERE bookname like '%축구%';
        
--book 테이블에서 도서명에 과학이라는 문자열이 포함된 행을 검색하시오
SELECT * FROM book
        WHERE bookname like '%과학%';
        
--book 테이블에서 도서명에 과학이라는 문자열로 끝나는 행을 검색하시오
SELECT * FROM book
        WHERE bookname like '%과학';
        
--book 테이블에서 도서명에 만리라는 문자열이 포함된 행을 검색하시오
SELECT * FROM book
        WHERE bookname like '%만리%';
        
--book 테이블에서 도서명에 '의'자 앞에 임의의 3글자가 포함된 문자열을 갖는 행을 검색하시오
SELECT * FROM book
        WHERE bookname like '___의%';