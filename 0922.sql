--������ ���ϴ� �Լ�
select abs(-15) from dual;

--�Ҽ��� ù°�ڸ����� �ø�ó���ϴ� �Լ�
select ceil(15.7) from dual;

--�Ķ���� n(�������� ǥ���Ǵ� ����)�� �ڻ��ΰ����� ��ȯ�ϴ� �Լ�
select cos(3.14159) from dual;

--�Ҽ��� ù°�ڸ����� ����ó���ϴ� �Լ�
select floor(15.7) from dual;

--LOG(m, n)���� ���� m���� �� n�� �α� ���� ��ȯ�ϴ� �Լ�
select log(10,100) from dual;

--���������� ��ȯ�ϴ� �Լ�
select mod(11,4) from dual;

--�ŵ��������� ��ȯ�ϴ� �Լ�
select power(3,2) from dual;

--�ݿø� ���� ��ȯ�ϴ� �Լ�
select round(15.7) from dual;

--���ں�ȣ�� Ȯ�� �� ��ȯ�ϴ� �Լ�
select sign(-15) from dual;

--�Ҽ��� ���� ���� �������ִ� �Լ�(15.7,3 �� ��� 15.7 �� ���� ��ȯ(,�ڿ� ���� ���° �ڸ������� �����Ұ��� ����))
select trunc(15.7) from dual;

--�ƽ�Ű�ڵ尪���� ���� ��ȯ�ϴ� �Լ�
select chr(67) from dual;

--���ڿ��� �������ִ� �Լ�
select concat('HAPPY','Birthday') from dual;

--���ڿ��� �ҹ��ڷ� ��ȯ�ϴ� �Լ�
select lower('Birthday') from dual;

--���ʿ� �е� �߰� lpad : (���ڿ�, ��ü���ڿ�����, ä����������)
select lpad('Page 1', 15, '*.') from dual;

--���ڿ��� ����(����) ����  ����, ���� ���� �ݺ����� ���ڸ� ����. LTRIM("���ڿ�", "�ɼ�") 
select ltrim('Page 1','ae') from dual;

--���ڿ� ������ Ư�� ����/���ڿ��� ���ο� ����/���ڿ��� ��ü. REPLACE("���ڿ�", "������ ����", "��ü�� ����")
select replace('JACK', 'J', 'BL') from dual;

--�����ʿ� �е� �߰� rpad : (���ڿ�, ��ü���ڿ�����, ä����������)
select rpad('Page 1', 15, '*.') from dual;

--���ڿ��� ������(����) ����  ����, ���� ������ �ݺ����� ���ڸ� ����. RTRIM("���ڿ�", "�ɼ�") 
select rtrim('Page 1', 'ae') from dual;

--Ư�� ����/���ڿ� ����. SUBSTR("���ڿ�", "������ġ", "����")
select substr('ABCDEFG',3,4) from dual;

--���ڿ��� ���� ���� ����� ����  ����, ���� ���� �ݺ����� ���ڸ� ����. TRIM("���ڿ�", "�ɼ�") 
select trim(LEADING 0 FROM '00AA00') from dual;

--���ڿ��� �빮�ڷ� ��ȯ�ϴ� �Լ�
select upper('Birthday') from dual;

--���ڸ� �ƽ�Ű�ڵ� ��ȣ�� ��ȯ�ϴ� �Լ�
select ascii('A') from dual;

-- 1. 'CORPORATE FLOOR' ���ڿ����� 'OR'�� 3��° ��ġ���� ã��, �� ��°�� �߰ߵ� ��ġ�� ��ȯ.
select instr('CORPORATE FLOOR','OR',3,2) from dual;

-- 2. ���ڿ� 'Birthday'�� ���̸� ��ȯ.
select length('Birthday') from dual;

-- 3. '14/05/21' ��¥�� ��¥ �������� ��ȯ�ϰ� 1������ ���� ��¥�� ��ȯ.
select add_months(TO_DATE('14/05/21', 'yy/mm/dd'),1) from dual;

-- 4. ���� ���� ������ ��¥�� ��ȯ.
select last_day(sysdate) from dual;

-- 5. ���� ������� ��¥�� ��ȯ.
select next_day(sysdate, 'Thu') from dual;

-- 6. ���� ��¥�� �ݿø��� ���� ��ȯ.
select round(sysdate) from dual;

-- 7. ���� ��¥�� �ð��� ��ȯ.
select sysdate from dual;

-- 8. ���� ��¥�� ���ڿ��� ��ȯ�Ͽ� ��ȯ.
select to_char(sysdate) from dual;

-- 9. ���� 123�� ���ڿ��� ��ȯ�Ͽ� ��ȯ.
select to_char(123) from dual;

-- 10. ���ڿ��� 'DD MM YYYY' �������� �ؼ��Ͽ� ��¥�� ��ȯ.
select to_date('12 05 2014', 'DD MM YYYY') from dual;

-- 11. ���ڿ� '12.3'�� ���ڷ� ��ȯ.
select to_number('12.3') from dual;

-- 12. �� 1�� �������� ������ ���ϰ�, ��ġ�ϴ� ��� 'aa'�� ��ȯ.
select decode(1,1,'aa','bb') from dual;

-- 13. �� ��(123, 345)�� ���ϰ�, �ٸ� ��� ù ��° ��(123)�� ��ȯ.
select nullif(123,345) from dual;

-- 14. ù ��° ���� NULL�̹Ƿ� �� ��° ��(123)�� ��ȯ.
select nvl(null, 123) from dual;



--���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�.(�� ��ȭ��ȣ�� ���� ���� '����ó����'���� ����Ͻÿ�
select name �̸�, phone ��ȭ��ȣ from customer;
select name �̸�, nvl(phone, '����ó ����') ��ȭ��ȣ from customer;

--����Ͽ��� ����, ����ȣ, �̸�, ��ȭ��ȣ�� ���� �θ� ����Ͻÿ�
select rownum ����, custid, name, phone from customer
where rownum <= 2;

--mybook ���̺� ����
create table mybook(
    bookid number not null primary key,
    price number
);

--������ �� ����
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

--mybook ���̺��� �����Ͱ� ��� ���
select * from mybook;

--null ���� 0���� ��µ�
select bookid, nvl(price,0) from mybook;

--price ���� null �� 3���� ��µ�
select * from mybook
where price is null;

--price ���� 100�� �������� ��µ�, null���� ��ȭ ����
select bookid, price+100 from mybook;

--bookid >= 4 �̱� ������ 4���Ϸθ� ������ mybook ���̺��� ������ ��µ��� ����
select sum(price), avg(price), count(*) from mybook
where bookid >= 4;

--��ü �����Ͱ��� 3���̰�, price �����Ͱ��� 2���̹Ƿ� 3 2 �� ��µȴ�
select count(*), count(price) from mybook;

--null ���� ������ 1���� 2���� price�� ��(30000)�� ���(15000)�� ��µȴ� 
select sum(price), avg(price) from mybook;


--book ���̺��� �����Ͱ� ��� ���
select * from book;

--5��° ������ book ���̺��� �����Ͱ� ��� ���
select * from book 
where rownum <= 5;

--5��° ������ book ���̺��� �����Ͱ� ���ݼ����� ��� ���
select * from book 
where rownum <= 5
order by price;

--book ���̺��� �����Ͱ��� ���ݼ����� ���� �� 5��° ������ ���
select * from (select * from book order by price)book
where rownum <= 5;

--5��° ������ book ���̺��� �����Ͱ� ���ݼ����� ��� ���
select * from (select * from book where rownum <= 5)book
order by price;

--5��° ������ book ���̺��� �����Ͱ� ���ݼ����� ��� ���
select * from (select * from book where rownum <= 5 order by price)book;


--��� �Ǹűݾ� ������ �ֹ��� ���� �ֹ���ȣ�� �Ǹűݾ��� ����Ͻÿ�
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;

select avg(saleprice) from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice <= (select avg(saleprice) from orders);

--�� ���� ����Ǹűݾ׺��� ū �ݾ��� �ֹ� ���������ؼ��� �ֹ���ȣ, ����ȣ, �Ǹűݾ��� ����Ͻÿ�
select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid=so.custid);

--���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�
select sum(saleprice) ���Ǹűݾ� from orders;
--���￡ �����ϴ� ����� ����ȣ
select custid from customer
where address like '%����%';

select sum(saleprice) ���Ǹűݾ� from orders
where custid in(select custid from customer
where address like '%����%');

--���￡ �������� �ʴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�
select sum(saleprice) ���Ǹűݾ� from orders
where custid not in(select custid from customer
where address like '%����%');


--3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice > all(select saleprice from orders where custid=3);

select saleprice from orders where custid=3;

--���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.(�� exist ������ ���)
select sum(saleprice) ���Ǹűݾ� from orders mo
where exists(
    select * from customer c
    where address like '%����%' and mo.custid=c.custid);
    
--���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����ȣ, �Ǹ��հ�)
select custid ����ȣ, sum(saleprice) �Ǹ��հ� from orders
group by custid;

--���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����, �Ǹ��հ�)
select (select name from customer c
        where c.custid=o.custid)����, sum(saleprice) �Ǹ��հ� from orders o, customer c
group by o.custid;

--�ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷��� �߰��Ͻÿ�
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid=o.bookid);

--����ȣ�� 2������ ����ȣ�� �̸��� ����Ͻÿ�.
select custid ����ȣ, name �̸� from customer
where custid <= 2;

--����ȣ�� 2������ ���� �Ǹűݾ��� ����Ͻÿ�.(���̸��� ���� �Ǹ� �Ѿ�)
select name ����, sum(saleprice) �Ǹ��Ѿ�
from (select custid, name from customer
            where custid <= 2) c, orders o
where c.custid=o.custid
group by name;

--����ȣ, �ּ�, ���Ǹž��� ����ȣ���� �����µǰ� �ϴ� ���๮
select custid,(select address from customer cs where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;