SELECT * FROM book
        WHERE bookname like '%����%' and price >= 7000;
        
--book ���̺��� ���ǻ簡 �½����� �Ǵ� ��ũ�ν��� ������ �˻��Ͻÿ�
SELECT * FROM book
        WHERE publisher='�½�����' or publisher='��ũ�ν�';
        
--���� ������ in �����ڸ� ����Ͽ� ������ ������
SELECT * FROM book
        WHERE publisher in ('�½�����', '������');
        
--book ���̺��� ����������� �˻��Ͻÿ�
SELECT * FROM book ORDER BY bookname;

--book ���̺��� ���ݼ����� �˻��ϰ� ���� �����̸� �̸������� �˻��Ͻÿ�
SELECT * FROM book ORDER BY price, bookname;

--DESC : ��������, ASC : ��������
--book ���̺��� ������ ������������ �˻��ϰ�, ���� ������ ���ٸ� ���ǻ� ������ �˻��Ͻÿ�
SELECT * FROM book ORDER BY price DESC, publisher ASC;

SELECT * FROM orders;
--orders ���̺��� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�
SELECT sum(saleprice) as ���Ǳ� from orders;

--orders ���̺��� ����ȣ�� 1�� ���� �ֹ��� �� �Ǹž��� �˻��Ͻÿ�
select sum(saleprice) as ���Ǳ� 
from orders
where custid=1;

--orders ���̺��� �Ǹž��� �հ�, ���, �ּҰ�, �ִ밪�� ���Ͻÿ�
select sum(saleprice) as ���Ǹűݾ�,
    avg (saleprice) as �Ǹűݾ����,
    min (saleprice) as ������,
    max (saleprice) as �ְ�
    from orders;

--orders ���̺��� �Ǹ��� ������ ������ ���Ͻÿ�
select count(*) from orders;

--orders ���̺��� ���������� 13000�� �̻��� ������ ������ ���Ͻÿ�
select count(*) from orders where saleprice >= 6000;

--orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ������ ���Ͻÿ�
select count(*) from orders where custid in(1, 3);

--orders ���̺��� ���� �ֹ��� ������ ������ ���հ踦 ���Ͻÿ�
--�׷�ȭ �� ���� group by ���
select count(*) �ֹ�����, sum(saleprice) �ֹ��Ѿ� from orders
group by custid
order by custid;

--orders ���̺��� �ǸŰ����� 6000�� �̻��� ������ ������ ���� ���� ���� �ֹ� ������ �� ������ ���Ͻð�
--�� 2���̻� ������ ���� ����Ͻÿ�
select custid, count(*) as ��������  from orders
where saleprice >= 6000
group by custid
having count(*) >= 2
order by custid;


--��������
--������ȣ�� 1�� ������ �̸� 
select bookname from book
where bookid=1;
--������ 5000�� �̻��� ������ �̸�
select bookname from book
where price >= 5000;
--�������� �� ���ž�(�������� ����ȣ�� 1)
select sum(saleprice) as "�� ���ž�" from orders
where custid=1;
--�������� ������ ������ ��
select count(*) as "���ŵ��� ����" from orders
where custid=1;
--���缭�� ������ �� ����
select count(*) as "���� �� ����" from orders;
--���缭���� ������ ����ϴ� ���ǻ��� �� ����
select count(distinct publisher) as "���ǻ� �� ����" from book;
--��� ���� �̸�, �ּ�
select name, address from customer;
--2023�� 1�� ~ 2�� ���̿� �ֹ� ���� ������ �ֹ���ȣ
select orderid from orders
where orderdate BETWEEN TO_DATE('2023-01-01', 'yyyy-mm-dd') AND TO_DATE('2023-02-28', 'yyyy-mm-dd');
--2023�� 1�� ~ 2�� ���̿� �ֹ� ���� ������ ������ ������ �ֹ���ȣ
select orderid from orders
where NOT orderdate BETWEEN TO_DATE('2023-01-01', 'yyyy-mm-dd') AND TO_DATE('2023-02-28', 'yyyy-mm-dd');
--���� '��'���� ���� �̸��� �ּ�
select name, address from customer
where name like '��%';
--���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
select name, address from customer
where name like '��_��';