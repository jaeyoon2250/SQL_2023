--oders ���̺�
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

--imported_book ���̺�
insert into imported_book VALUES (11, 'Zen Golf', 'pearson', 12000);
insert into imported_book VALUES (12, 'Soccer Skills', 'Human Kinetics', 15000);

SELECT publisher, price FROM book
                        WHERE bookname LIKE 'å��';


SELECT phone FROM customer
            WHERE name='�迬��';
            
SELECT * FROM customer
            WHERE name='�迬��';
            
--book ���̺��� ������� ������ �˻��Ͻÿ�
SELECT bookname, price FROM book;
--book ���̺��� ���ݰ� �������� �˻��Ͻÿ�
SELECT price, bookname FROM book;
--book ���̺��� ������ȣ, ������, ���ǻ�, ������ �˻��Ͻÿ�
SELECT * FROM book;
--book ���̺��� ��� ���ǻ縦 �˻��Ͻÿ�
SELECT publisher FROM book;
--book ���̺��� ��� ���ǻ縦 �˻��Ͻÿ� (�ߺ��� �����ϼ���)
SELECT DISTINCT publisher FROM book;
--book ���̺��� ������ 10000�� �̸��� ������ �˻��Ͻÿ�
SELECT * FROM book
        WHERE price < '10000';
--book ���̺��� ������ 5000�� �̻� 7000�� ������ ������ �˻��Ͻÿ�
SELECT * FROM book
        WHERE price BETWEEN 5000 and 7000;
--book ���̺��� ������ 5000�� �̻� 7000�� ������ ������ �˻��Ͻÿ�(between ��� x)
SELECT * FROM book
        WHERE price >= 5000 and price <= 7000;
        
--book ���̺��� ���ǻ簡 �½�����, �س�, ���������Ͽ콺�� ������ �˻��Ͻÿ�
--�� in �����ڸ� ����Ͻÿ�
SELECT * FROM book
        WHERE publisher in ('�½�����', '�س�', '���������Ͽ콺');
--book ���̺��� ���ǻ簡 �½�����, �س�, ���������Ͽ콺�� ������ �˻��Ͻÿ�
--�� in �����ڸ� ������� ���ÿ�
SELECT * FROM book 
        WHERE book.publisher='�½�����' 
        or book.publisher='�س�' or book.publisher='���������Ͽ콺';
--book ���̺��� ���ǻ簡 �½�����, �س�, ���������Ͽ콺�� �ƴ� ������ �˻��Ͻÿ�
--�� not in �����ڸ� ����Ͻÿ�
SELECT * FROM book
         WHERE publisher NOT IN ('�½�����', '�س�', '���������Ͽ콺');
--book ���̺��� ���ǻ簡 �½�����, �س�, ���������Ͽ콺�� �ƴ� ������ �˻��Ͻÿ�
--�� not in �����ڸ� ������� ���ÿ�
SELECT * FROM book
          WHERE book.publisher<>'�½�����'
        and book.publisher<>'�س�' and book.publisher<>'���������Ͽ콺';  
        
--book ���̺��� ������ �౸�� ���縦 �˻��Ͻÿ�
SELECT * FROM book
        WHERE bookname='�౸�� ���� ����';

SELECT * FROM book
        WHERE bookname LIKE '�౸�� ���� ����';
        
--book ���̺��� ������ �౸��� ���ڿ��� ���Ե� ���� �˻��Ͻÿ�
SELECT * FROM book 
        WHERE bookname like '%�౸%';
        
--book ���̺��� ������ �����̶�� ���ڿ��� ���Ե� ���� �˻��Ͻÿ�
SELECT * FROM book
        WHERE bookname like '%����%';
        
--book ���̺��� ������ �����̶�� ���ڿ��� ������ ���� �˻��Ͻÿ�
SELECT * FROM book
        WHERE bookname like '%����';
        
--book ���̺��� ������ ������� ���ڿ��� ���Ե� ���� �˻��Ͻÿ�
SELECT * FROM book
        WHERE bookname like '%����%';
        
--book ���̺��� ������ '��'�� �տ� ������ 3���ڰ� ���Ե� ���ڿ��� ���� ���� �˻��Ͻÿ�
SELECT * FROM book
        WHERE bookname like '___��%';