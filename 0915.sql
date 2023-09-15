--DDL(Data Defination Language): ������ ���Ǿ�


--������(newcustomer table)
--custid, name, address, phone
create table newcustomer(
    custid number primary key,
    name VARCHAR2(40), 
    --varchar �� varchar2 �� ���̴� ��������� �������� ä���, �� ���� ä����� ���̰� �ִ�
    address VARCHAR2(40),
    phone VARCHAR2(30)
);

--orderid(primary key), custid(not null, newcustomer custid �����ؼ� �ܷ�Ű, �������), 
--bookid(not null, newbook1 bookid �����ؼ� �ܷ�Ű, �������), 
--saleprice
--orderdate(date��)
create table NewOrders(
    orderid NUMBER PRIMARY KEY,
    custid NUMBER NOT NULL,
    bookid NUMBER NOT NULL,
    saleprice NUMBER,
    orderdate date,
    FOREIGN KEY(custid) REFERENCES newcustomer(custid) on DELETE cascade,
    FOREIGN KEY(bookid) REFERENCES newbook3(bookid) on DELETE cascade
);

--Alter ��
--�̹� ������ ���̺��� ������ ������ �� ���
--add(�߰�), drop(����), modify(����)

--������ newbook1 ���̺��� �����ϰ� �� ���̺� �ۼ�
drop table newbook1;

create table newbook1(
    bookid number,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price number
);

--isbn �÷� �߰�
alter table newbook1
add isbn VARCHAR2(13);
--isbn �÷��� �ڷ��� ����
alter table newbook1
modify isbn number;
--isbn �÷� ����
alter table newbook1
drop COLUMN isbn;

--bookname �÷��� varchar2(30) not null �������� ����
alter table newbook1
modify bookname VARCHAR2(30) not null;

--bookid �÷��� not null �������� �߰�
alter table newbook1
modify bookid number not null;
--bookid �÷��� �⺻Ű �߰�
alter table newbook1
add primary key(bookid);

--���̺� ����
drop table neworders;
drop table newcustomer;
drop table newbook4;
drop table newbook3;
drop table newbook2;


--DML(select, insert(�����ͻ���), update(�����ͼ���), delete(�����ͻ���))
--insert 1��: �Ӽ�����Ʈ ����
insert into book
    values(11, '��ȣƼ��', '����ȣ�״������̴�', 12000);
    
--insert 2��: �Ӽ�(�÷�)����Ʈ ���
insert into book(bookid, bookname, publisher, price)
values(12, '���ӿ���������', '����å', 8000);

--insert 3��: �÷��� ������ ����
insert into book(bookid, price, publisher, bookname)
values(13, 28000, '���ڳ���', '���� ����');
--���̺� ������ ���� �ʿ�� ������, ��õ� �÷��� ������ �� ������Ѵ�

--insert 4��: Ư�� �÷��� ���� ����
insert into book(bookid, price, bookname)
values(14, 10000, '��ħ���');

--���̺� ������ ���� �ٸ� ���̺��� �������� �����ϴ� ���

update imported_book
set bookid=15
where bookid=11;

update imported_book
set bookid=16
where bookid=12;

insert into book(bookid, bookname, price, publisher)
select bookid, bookname, price, publisher
from imported_book;

--update: ������ ����
--����ȣ�� 5���� ���� �ּҸ� ���ѹα� �λ����� �����Ͻÿ�.
select * from customer;

update customer 
set address='���ѹα� �λ�'
where custid=5;

--�ڼ��� ���� �ּҸ� �迬�� ���� �ּҿ� �����ϰ� �����Ͻÿ�
update customer 
set address=(select address 
            from customer
            where name='�迬��')
where name='�ڼ���';

--�ڼ��� ���� ��ȭ��ȣ�� �迬�� ���� ��ȭ��ȣ�� �����ϰ� �����Ͻÿ�
update customer 
set phone=(select phone 
            from customer
            where name='�迬��')
where name='�ڼ���';

--��� ���� �����ϼ���
delete from customer;


--�������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
select name from customer
where name=(select publisher from book
                where 
--�ΰ� �̻��� ���δٸ� ���ǻ翡�� ������ ������ ���� �̸�
--��ü ���� 30%�̻��� ������ ����
