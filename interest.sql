create or replace procedure interest
as
    myInterest numeric;
    price numeric;
    CURSOR interestCursor is select saleprice from orders;
    --한 행씩 접근하고 싶을 때 cursor 사용
begin
    myInterest := 0.0;
    open interestCursor;
    loop
        fetch interestCursor into price;
        exit when interestCursor%NOTFOUND;
        if price >= 5000 then
            myInterest := myInterest + price*0.1;
        else
            myInterest := myInterest + price*0.05;
        end if;
    end loop;
    close interestCursor;
    DBMS_OUTPUT.PUT_LINE('전체 이익 금액 = '||round(myInterest,3));
end;

set serveroutput on;
exec interest;