--6번 박지성이 구매한 도서의 이름 가격 정가와 판매가격의 차이
SELECT book.bookname, book.price, book.price - orders.saleprice
FROM book, orders
WHERE book.bookid IN (SELECT bookid
FROM book
WHERE bookid IN (SELECT bookid FROM orders WHERE custid =(
SELECT custid FROM customer WHERE name = '박지성')))
AND book.bookid = orders.bookid ;


-- 7번 박지성이 구매하지 않은 도서의 이름
SELECT bookname
FROM book
WHERE bookid not IN (SELECT bookid FROM orders WHERE custid =(
SELECT custid FROM customer WHERE name = '박지성'));


--8번 주문하지 않은 고객의 이름(부속질의 사용)
SELECT name
FROM customer
WHERE custid not IN (SELECT DISTINCT custid FROM orders);

--9번 주문 금액의 총액과 주문의 평균 금액
SELECT SUM(saleprice), AVG(saleprice)
FROM orders;

--10번 고객의 이름과 고객별 구매액
SELECT name, SUM(saleprice)
FROM customer  ,orders  
WHERE customer.custid = orders.custid
GROUP BY name;

--11고객의 이름과 고객이 구매한 도서 목록
SELECT Name , bookname
FROM customer,book, orders
WHERE customer.custid = orders.custid AND book.bookid = orders.bookid ;

-- 12 도서의 가격과 판매가격의 차이가 가장 많은 주문
SELECT *
FROM orders,book
WHERE orders.bookid = book.bookid
AND (book.price-orders.saleprice) = 
(SELECT max(book.price-orders.saleprice)
FROM orders,book
WHERE orders.bookid = book.bookid);

-- 13 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
SELECT name
FROM customer
WHERE custid IN
(SELECT custid
FROM orders 
GROUP BY custid
HAVING avg(saleprice) >(SELECT avg(saleprice)FROM orders));

