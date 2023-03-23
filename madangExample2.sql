--1)�ֹ��� �� ������ customer id, address,������ å�� ������ ������ ������ ����ض�. 
--�� address�� column �̸��� address��, å ���Ű����� ������ column�̸��� total�� ����ض�.
SELECT custid,(SELECT address
                FROM Customer cs
                WHERE cs.custid = od.custid) "address",
                SUM(saleprice) "total"
FROM orders od
GROUP BY od.custid;

--2) customer�� �̸��� ������ ������ å�� ��� ������ ����ض�.
SELECT cs.name,s
FROM (SELECT custid, AVG(saleprice) s
        FROM orders
        GROUP BY custid) od , customer cs
WHERE cs.custid = od.custid;
?
--3) column�̸��� total�� �����Ͽ�, custid�� 3���� �۰ų� ���� ����߿���
--������ å ������ ������ ����ض�
SELECT SUM(saleprice) "total"
FROM orders od
WHERE EXISTS (SELECT *
                FROM customer cs
                WHERE custid <= 3 AND cs.custid = od.custid);