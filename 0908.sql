--���տ�����: ������(UNION), ������(MINUS), ������(INTERSECT)
--������ �ֹ����� ���� ���� �̸��� ���ÿ�
select name from customer
MINUS
select name from customer
where custid in (select distinct custid from orders);

--������ ������� �ʰ� �˻��Ͻÿ�
select name from customer
where custid not in (select distinct custid from orders);

--�ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�
select name, address from customer
where custid in (select distinct custid from orders);

--�������ΰ� �ߺ��� ������ ���
select DISTINCT name, address from customer c, orders o
where c.custid = o.custid;
--Exists ����� ���
select name, address from customer c
where exists (select * from orders o
                        where c.custid = o.custid);


--�������� ������ ������ ���ǻ� ��
select count(distinct publisher) as "���ǻ� ����" from book
where bookid in (select bookid from orders
                    where custid=1);
--�������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
SELECT bookname, price, price-saleprice
FROM Customer, Orders, Book
WHERE (Customer.custid=Orders.custid) 
AND (Book.bookid=Orders.bookid) 
AND (Customer.name='������');

--�������� �������� ���� ������ �̸�
select bookname from book 
where bookid not in (select bookid from orders
                        where custid=1);
--�ֹ����� ���� ���� �̸�(�μ����� ���)
select name from customer
MINUS
select name from customer
where custid in (select distinct custid from orders);

--�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select sum(saleprice), avg(saleprice) from orders;

--���� �̸��� ���� ���ž�
select name, sum(saleprice) from orders o, customer c
where o.custid = c.custid
group by name;

--���� �̸��� ���� ������ �������
SELECT name, bookname
FROM Book, Orders, Customer
WHERE Orders.bookid=Book.bookid AND Orders.custid=Customer.custid;

--������ ����(book ���̺�)�� �ǸŰ���(orders ���̺�)�� ���̰� ���� ���� �ֹ�
select * from orders o, book b
where o.bookid=b.bookid 
and (price-saleprice) = (select max(price - saleprice) from orders, book
                                                where orders.bookid = book.bookid);
                                                
--13)���� �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
select name from customer c, orders o
where  c.custid = o.custid
group by name
having avg(saleprice) > (select avg(saleprice) from orders);


--DDL(data defination language):������ ���Ǿ�
--create table/alter table/drop tabel

--���̺� ���� ���� 1
create table newbook1(
    bookid number,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price number
);

--���̺� ���� ���� 2
--primary key ���� ��� 1
create table newbook2(
    bookid number,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price number,
    PRIMARY KEY (bookid)
);

--���̺� ���� ���� 3
--primary key ���� ��� 2
create table newbook3(
    bookid number primary key,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price number
);

--bookname �÷�: null���� ������ ����
--publisher �÷�: ������ ���� ������ ����
--price �÷�: ������ �ԷµǾ� ���� ������ �⺻���� 10000�����ϰ� �Էµ� ���� 1000�ʰ��� ��
--bookname, publisher �÷��� ����Ű�� ����

create table newbook4(
    bookname VARCHAR2 (20) not null,
    publisher VARCHAR2(20) UNIQUE,
    price number DEFAULT 10000 check(price > 1000),
    primary key(bookname, publisher)
);