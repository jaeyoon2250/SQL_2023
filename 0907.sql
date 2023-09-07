--��������(Equi Join)
--�������� ���̺��� ������ �� Ư�� �÷��� ���� ���� ��鸸 �˻��� �� ���

--���� ���� �ֹ��� ���� �����͸� ��� ����Ͻÿ�
SELECT * FROM customer, orders
where customer.custid = orders.custid;

--���� ���� �ֹ��� ���� �����͸� ��� ����ȣ������ ����Ͻÿ�
select * from customer, orders
where customer.custid = orders.custid
order by customer.custid desc;

--���� �̸�, �ֹ��� ���� �ǸŰ����� �˻��Ͻÿ�
select name, saleprice from customer c, orders o
where c.custid = o.custid;

--���̸����� �ֹ��� ��� ������ ���Ǹž��� ���ϰ� ���̸������� �����Ͻÿ�
select name, sum(saleprice) from customer c, orders o
where c.custid = o.custid
group by name
order by name;
--sum �� ����Ϸ��� sum ���� �÷��� �׷���̸� ���� �� ����� �� �ִ�

--���� �̸��� �ֹ��� ������ �̸��� ���Ͻÿ�
--3���� ���̺� ���� ��������
select name, bookname from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid
order by name;

--���������� 8000���� ������ �ֹ��� ���̸��� �����̸��� ����Ͻÿ�
select name, bookname from customer c, book b, orders o
where c.custid = o.custid and b.bookid = o.bookid and price = 8000;

--Sub Query
--main Query ���� �ִ� Query
--���������� ���� ��� ���������� �˻��Ͻÿ�
select max(price) from book;

--���������� ���� ��� ������ �̸��� �˻��Ͻÿ�
select bookname from book
where price = 9000;

--���������� ���� �� ������ �̸��� ������ ����Ͻÿ�
select bookname, price from book
where price=(select min(price) from book);

--������ ������ ���� �����̵� �˻��Ͻÿ�
select custid from orders;

--������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
select name from customer
where custid in (select custid from orders);

--������ ������ ���
select name from customer;

--�� ������ ������ å�� ���̵�� �̸��� �˻��Ͻÿ�
select bookid, bookname from book
where publisher = '�� ����';

--�溣���� ������ ������ ������ ���� �̸��� �˻��Ͻÿ�
select name from customer
where custid in (select distinct custid 
                from orders
                where bookid in (select bookid
                                from book
                                where publisher = '�� ����'));


