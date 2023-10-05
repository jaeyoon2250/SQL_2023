--����ȣ, �ּ�, ���Ǹž��� ����ȣ���� �����µǰ� �ϴ� ���๮
select custid,(select address from customer cs where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;

-- ���� ��� �Ǹ� ������ ���
select c.name, s
from (select custid, avg(saleprice)s
        from orders
        group by custid) o, customer c
where c.custid = o.custid;

-- ����ȣ�� 3 ������ ���� �Ǹűݾ� �հ�
select SUM(saleprice) "total"
from Orders od
where exists (select *
                from Customer cs
                where custid <= 3 and cs.custid = od.custid);   
                
select * from book
where bookname like '%����%';

create view v_book
as select * from book
where bookname like '%����%';

select * from customer
where address like '%����%'
;

create view vw_customer
as select * from customer
where address like '%����%'
;

select * from vw_customer;


--�ֹ����̺��� ���̸�, �����̸��� �ٷ� Ȯ�� �� �� �ִ� �並 ������ ��,
--�迬�� ���� ������ ������ �ֹ���ȣ, ������, �ֹ����� ��� �Ͻÿ�.
create view vw_orders(orderid, name, custid, bookid, bookname, saleprice, orderdate)
as select o.orderid, c.name, o.custid,o.bookid, bookname, saleprice, orderdate
from orders o, customer c, book b
where o.custid= c.custid and o.bookid = b.bookid;

select * from vw_orders;

drop view vw_orders;

select orderid, bookname, saleprice
from vw_orders  
where name='�迬��';

--������ �並 �����Ѵ�
CREATE OR REPLACE VIEw vw_customer(custid, name, address)
as select custid, name, address
from customer 
where address like '%����%';

select * from customer;
select * from vw_customer;

--�並 �����Ѵ�
drop view vw_customer;


--�ǸŰ����� 500 �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� highorders �並 �����Ͻÿ�.
-- highorders �� ����
CREATE VIEW highorders(bookid, bookname,name,publisher)as
SELECT o.bookid, b.bookname, c.name AS name, b.publisher
FROM orders o, customer c, book b
WHERE o.saleprice >= 5000 and o.custid = c.custid and o.bookid = b.bookid;

drop view highorders;
select * from highorders;
--������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�.
select bookname,name
from highorders;
--highorders �並 �����ϰ��� �Ѵ�. �ǸŰ��� �Ӽ��� �����ϴ� ����� �����Ͻÿ� ���� �� (2)�� SQL���� �ٽ� �����Ͻÿ�.
CREATE or REPLACE VIEW highorders(bookid, bookname,name,publisher)as
SELECT o.bookid, b.bookname, c.name AS name, b.publisher
FROM orders o, customer c, book b
WHERE o.saleprice >= 5000 and o.custid = c.custid and o.bookid = b.bookid;

select bookname,name
from highorders;

exec INSERTBOOK(11,'����������', '������м���',25000);

select * from book;

exec insertorupdate(14, '������ ��ſ�', '������м���', 30000);

exec insertorupdate(12, '������ ��ſ�', '������м���', 20000);

exec insertorupdate(11,'����������', '������м���',25000);

set serveroutput on;
declare
    averageVal number;
begin
    averagePrice(averageVal);
    DBMS_OUTPUT.PUT_LINE('������� ����: '||round(averageVal));
end;