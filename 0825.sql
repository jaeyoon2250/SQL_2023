--�������� Book ���̺�
create table Book(
    bookid NUMBER(2) primary key, --number(?) ? �� ���� �ڸ���
    bookname VARCHAR2(40),  --���� ���̴� byte�� ����
    publisher VARCHAR2(40),
    price NUMBER(8)
);

--���Ե��� Imported_Book ���̺�

create table Imported_Book(
    bookid NUMBER(2), --number(?) ? �� ���� �ڸ���
    bookname VARCHAR2(40),  --���� ���̴� byte�� ����
    publisher VARCHAR2(40),
    price NUMBER(8)
);

--������ Customer ���̺�
create table Customer(
    custid NUMBER(2) primary key,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

--�ֹ����� Orders ���̺�
create table Orders(
    orderid NUMBER(2) primary key,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);

-- Book ���̺� 10���� ���� ������ �߰��ϼ���
insert into Book VALUES(1, '�౸�� ����', '�½�����', 7000);
insert into Book VALUES(2, '�ź��� ��', '�� ����', 9000);
insert into Book VALUES(3, '���� 2����', '�� ����', 8000);
insert into Book VALUES(4, '����2���� 2', '�� ����', 8000);
insert into Book VALUES(5, 'SANSO', '������', 7000);
insert into Book VALUES(6, '���̳��� ����ħ', '���̳�', 6000);
insert into Book VALUES(7, '�����ϴٴ� ����', '����Ŭ ����', 9000);
insert into Book VALUES(8, '80�ϰ��� ��������', '�� ����', 8000);
insert into Book VALUES(9, 'å��', '���ѹ�', 5000);
insert into Book VALUES(10, '15�ҳ� ǥ����', '�� ����', 7000);

--Customer ���̺� ������ 5���� �߰��ϼ���
insert into customer VALUES(1, '������', '��ü����', 010-0707-0707);
insert into customer VALUES(2, '�迬��', '���� ���۱� �漮��', 010-0657-0777);
insert into customer VALUES(3, '�߽ż�', '��õ������ ������', 032-507-0707);
insert into customer VALUES(4, '�ڼ���', '���������� ������', 042-777-0707);
insert into customer VALUES(5, '��̶�', '���� ��걸 ������', 02-007-0707);