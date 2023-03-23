--6�� �������� ������ ������ �̸� ���� ������ �ǸŰ����� ����
SELECT book.bookname, book.price, book.price - orders.saleprice
FROM book, orders
WHERE book.bookid IN (SELECT bookid
FROM book
WHERE bookid IN (SELECT bookid FROM orders WHERE custid =(
SELECT custid FROM customer WHERE name = '������')))
AND book.bookid = orders.bookid ;


-- 7�� �������� �������� ���� ������ �̸�
SELECT bookname
FROM book
WHERE bookid not IN (SELECT bookid FROM orders WHERE custid =(
SELECT custid FROM customer WHERE name = '������'));


--8�� �ֹ����� ���� ���� �̸�(�μ����� ���)
SELECT name
FROM customer
WHERE custid not IN (SELECT DISTINCT custid FROM orders);

--9�� �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
SELECT SUM(saleprice), AVG(saleprice)
FROM orders;

--10�� ���� �̸��� ���� ���ž�
SELECT name, SUM(saleprice)
FROM customer  ,orders  
WHERE customer.custid = orders.custid
GROUP BY name;

--11���� �̸��� ���� ������ ���� ���
SELECT Name , bookname
FROM customer,book, orders
WHERE customer.custid = orders.custid AND book.bookid = orders.bookid ;

-- 12 ������ ���ݰ� �ǸŰ����� ���̰� ���� ���� �ֹ�
SELECT *
FROM orders,book
WHERE orders.bookid = book.bookid
AND (book.price-orders.saleprice) = 
(SELECT max(book.price-orders.saleprice)
FROM orders,book
WHERE orders.bookid = book.bookid);

-- 13 ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
SELECT name
FROM customer
WHERE custid IN
(SELECT custid
FROM orders 
GROUP BY custid
HAVING avg(saleprice) >(SELECT avg(saleprice)FROM orders));

