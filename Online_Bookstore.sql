CREATE DATABASE Online Bookstoe;

DROP TABLE books, orders, customers;

CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(200),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price DECIMAL(10,2),
    Stock INT
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(150),
    phone VARCHAR(20),
    city VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2)
);

SELECT * FROM Books;
SELECT * FROM Orders;
SELECT * FROM Customers;


-- 1) Retrive all booksin the "Fiction" Genre
SELECT * FROM Books
WHERE Genre='Fiction';

--2) Find books published after the year 1950
SELECT * FROM Books
WHERE Published_Year>1950;

--3) List all the customers from the Canada
SELECT * FROM Customers
WHERE Country='Canada';

--4) Show All Orders placed in Nov 2023:
SELECT * FROM Orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

--5) Retrive the total stock of books available
SELECT SUM(Stock) AS Total_Stock FROM Books;

--6) Find the details of most expensive books:
SELECT * FROM Books
ORDER BY Price DESC 
LIMIT 1;

--7) Show all customers who ordered more than 1 quantity of book:
SELECT * FROM Orders
WHERE Quantity >1;

--8) Retrive all orders where the total amount exceeds 20:
SELECT * FROM Orders
WHERE Total_amount >20;

--9) Select All the genre Available in Books table
SELECT DISTINCT Genre FROM Books;

--10)Find the books with lowest stock:
SELECT * FROM Books 
ORDER BY Stock 
LIMIT 1;

--11) Calculate the total revenue generated from all orders :
SELECT SUM(Total_amount) As Revenue 
FROM Orders ;

--12)Retrieve the total number of books sold for each genre :
SELECT * FROM Orders;
SELECT b.Genre,
SUM(o.Quantity) AS Total_Booksold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.Genre;

--13)Find AVG price of books in the " fantasy" Genre
SELECT AVG(price) AS Average_Price
FROM Books
Where Genre = 'Fantasy';

--14)List of customers who have placed at least 2 orders
SELECT o.customer_id, c.name, 
COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY O.customer_id,c.name
HAVING COUNT(order_id) >= 2;

--15) Find the most frequently ordered books
SELECT o.book_id, b.title, COUNT(o.order_id) AS order_count
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.Book_ID, b.title
ORDER BY Order_count DESC LIMIT 1;

--16) Show the top 3 most expensive books of 'Fantasy' Genre
SELECT * FROM books
WHERE Genre = 'Fantasy'
ORDER BY price DESC LIMIT 3;


--17) Retrieve the total quantity of books sold by each author
SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY author;


--18) List the cities where customers who spent over $30 are located
SELECT DISTINCT  c.city
FROM orders o
JOIN customers c ON o.customer_id =c.customer_id
WHERE o.total_amount >30;

--19) Find the customers who spent the most on orders
SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY  c.customer_id, c.name
ORDER BY Total_Spent DESC LIMIT 1;

--20) Calculate the stock remaining after fulfilling all orders
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,
	b.stock-COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id;
