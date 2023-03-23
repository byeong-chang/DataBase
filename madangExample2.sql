--1)주문을 한 고객들의 customer id, address,고객별로 책을 구매한 가격의 총합을 출력해라. 
--단 address의 column 이름을 address로, 책 구매가격의 총합의 column이름을 total로 출력해라.
SELECT custid,(SELECT address
                FROM Customer cs
                WHERE cs.custid = od.custid) "address",
                SUM(saleprice) "total"
FROM orders od
GROUP BY od.custid;

--2) customer의 이름과 고객별로 구매한 책의 평균 가격을 출력해라.
SELECT cs.name,s
FROM (SELECT custid, AVG(saleprice) s
        FROM orders
        GROUP BY custid) od , customer cs
WHERE cs.custid = od.custid;
?
--3) column이름을 total로 지정하여, custid가 3보다 작거나 같은 사람중에서
--구매한 책 가격의 총합을 출력해라
SELECT SUM(saleprice) "total"
FROM orders od
WHERE EXISTS (SELECT *
                FROM customer cs
                WHERE custid <= 3 AND cs.custid = od.custid);