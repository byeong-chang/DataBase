-- 3 ���缭������ ������ ��ȭ�� ������ ���� SQL ���� �ۼ��Ͻÿ�.
--  (1) �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
SELECT DISTINCT name
FROM orders , customer
WHERE customer.custid IN (SELECT custid
FROM orders,book 
WHERE orders.bookid = book.bookid AND
book.publisher in (SELECT book.publisher
                FROM book 
                WHERE book.bookid in (SELECT bookid
                                FROM customer,orders
                                WHERE orders.custid = customer.custid AND Name = '������')));

--  (2) �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
SELECT name
FROM customer, orders ,book
WHERE customer.custid = orders.custid AND book.bookid = orders.bookid
GROUP BY name
HAVING (COUNT(DISTINCT publisher))>= 2;
    
--  (3) (����) ��ü ���� 30% �̻��� ������ ����
SELECT bookname
FROM customer, orders ,book
WHERE customer.custid = orders.custid AND book.bookid = orders.bookid
GROUP BY bookname
HAVING (COUNT(DISTINCT name))>= 2;


--4 ���� ���ǿ� ���� DML ���� �ۼ��Ͻÿ�.

--  (1) ���ο� ���� (�������� ���衯, �����ѹ̵�, 10000��)�� ���缭���� �԰�Ǿ���.
--      ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ���.
--bookid �� PRIMARY KEY�̱� ������ �ݵ�� �Է��ؾ� �ϴµ� �Է��� �ȵǾ���.
INSERT INTO book(bookid, bookname,publisher,price)
    VALUES(11,'������ ����', '���ѹ̵��', 10000);

--  (2) ���Ｚ�硯���� ������ ������ �����ؾ� �Ѵ�.
DELETE FROM book
WHERE publisher ='�Ｚ��';

--  (3) ���̻�̵����� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���.
-- �̻�̵���� ��� ordeer���̺� ����Ǿ� �ֱ� ������ ������ �ȵȴ�.
-- ���� ������� orders ���̺� �ִ� ���� �������־�� �Ѵ�.(���Ἲ ��������)
DELETE FROM book
WHERE publisher = '�̻�̵��';

--  (4) ���ǻ� �����ѹ̵��� ���������ǻ硯�� �̸��� �ٲپ���.
UPDATE book
SET publisher = '�������ǻ�'
WHERE publisher LIKE '���ѹ̵��';