--�������� ������ ������ ���ǻ��̸��� ����Ͻÿ�.
select publisher from customer c, orders o, book b
where c.custid=o.custid and o.bookid=b.bookid --����
and name like '������';

--�������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
select name from customer c, orders o, book b
where c.custid=o.custid and o.bookid=b.bookid
and name not like '������'
and publisher in(
    select publisher from customer c, orders o, book b
    where c.custid=o.custid and o.bookid=b.bookid --����
    and name like '������');

--�ΰ� �̻��� ���δٸ� ���ǻ翡�� ������ ������ ���� �̸�
select name from customer cm
where (select count(distinct publisher) from customer c, orders o, book b
where c.custid=o.custid and o.bookid=b.bookid
and name like cm.name) >=2;

--��ü ���� 30%�̻��� ������ ����
select bookname from book bk
where (select count(b.bookid) from book b, orders o
        where b.bookid=o.bookid and b.bookid=bk.bookid)
        >= (select count (*) from customer) * 0.3;

--���ο� ����('����������', '���ѹ̵��',10000��)�� ���缭���� �԰�Ǿ���. ������ �� �� ��� �ʿ��� 
--�����Ͱ� �� �ִ��� ã�ƺ��ÿ�
insert into Book (bookid, bookname, Publisher, Price)
values (11, '������ ����', '���ѹ̵��', 10000);

--'���̿�'���� ������ ������ �����ؾ� �Ѵ�.
delete Book
where publisher = '���̿�';

--���ǻ� '���ѹ̵��' '�������ǻ�' �� �̸��� �ٲٽÿ�
update book
set publisher='�������ǻ�'
where publisher='���ѹ̵��';

--78�� -78�� ������ ���Ͻÿ�
select abs(-78), abs(+78)
from Dual;
--4.875�� �Ҽ� ù° �ڸ����� �ݿø��� ���� ���Ͻÿ�
select round(4.875, 1)
from Dual;
--���� ��� �ֹ� �ݾ��� �� �� ������ �ݿø��� ���� ���Ͻÿ�
select custid "����ȣ", round(sum(saleprice)/count(*), -2) "��� �ݾ�"
from orders
group by customer;

--������ '����'�� ���Ե� ������ '����'���� �����Ͽ� ����Ͻÿ�
--�⺻�� ������ �ٲٸ� �ȵ˴ϴ�
select bookid, replace(bookname, '����', '����') bookname, publisher, price from book;

--���ǻ簡 '�� ����'�� �������� ���ڼ��� ����Ʈ���� ����Ͻÿ�
select bookname "������", length(bookname) "���ڼ�", lengthb(bookname) "����Ʈ��" from book
where publisher like '�� ����';

--���߿��� ���� ������ ���� ����� ������� �������� �ο����� ����ϼ���.
select substr(name, 1, 1) "����", count(*) "�ο���" from customer
group by substr(name, 1, 1);

--������ �ֹ�Ȯ������ �ֹ��Ϸκ��� 10�����̴�. �ֹ���ȣ, �ֹ���, �ֹ�Ȯ������ ����Ͻÿ�
select orderid �ֹ���ȣ, orderdate �ֹ���, orderdate+10 �ֹ�Ȯ����
from orders;

--2023�� 2�� 14�Ͽ� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ����Ͻÿ�.
--��, �ֹ����� "yyyy�� mm�� dd��"�� ���� format���� ǥ���Ͻÿ�.
select orderid �ֹ���ȣ, orderdate �ֹ���, custid ����ȣ, bookid ������ȣ
from orders
where orderdate=to_date('20230214', 'yyyymmdd');

--2023�� 2�� 14�Ͽ� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����, ������ ��� ����Ͻÿ�.
--��, �ֹ����� "yyyy�� mm�� dd��"�� ���� format���� ǥ���Ͻÿ�.
select orderid �ֹ���ȣ,to_char( orderdate, 'yyyy-mm-dd') �ֹ���, name ����, bookname ������
from orders o ,book b, customer c
where o.bookid = b.bookid and c.custid = o.custid and  orderdate = to_date('20230214','yyyymmdd');

--DB ������ ������ ��¥�� �ð� ������ ����Ͻÿ�.
--���� ��ȯ�� ��¥�� ������ ������(�⵵ 4�ڸ�/��2�ڸ�/��¥2�ڸ� ������ ���� , 
--��:��:��) ��¥�� �ð� 2������ ��� ����Ͻÿ�.
select sysdate ������ȯ�Ȱ�, to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') �������ĳ�¥�׽ð� from dual;