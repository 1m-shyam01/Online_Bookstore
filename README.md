# Online Bookstore SQL Analysis

## About the Project

This is a SQL-based data analysis project built around an **Online Bookstore** database.

The project contains three tables — **Books, Customers, and Orders** — and uses SQL to answer 20 practical questions about books, customers, orders, sales, revenue, and inventory.

The main goal of this project was to practice writing SQL queries and understand how relational data can be used to answer simple business questions.

## What I Worked On

In this project, I worked on queries to:

- Filter books and customers using specific conditions
- Analyze orders by date and quantity
- Calculate total stock and revenue
- Find the most and least expensive books
- Identify different book genres
- Analyze books sold by genre and author
- Find customers with multiple orders
- Identify frequently ordered books
- Analyze customer spending
- Calculate remaining stock after fulfilling orders

## Database Structure

The database contains three tables:

### 1. Books

| Column | Description |
|---|---|
| Book_ID | Unique ID of each book |
| Title | Name of the book |
| Author | Author of the book |
| Genre | Genre/category of the book |
| Published_Year | Year the book was published |
| Price | Price of the book |
| Stock | Available stock |

### 2. Customers

| Column | Description |
|---|---|
| Customer_ID | Unique ID of each customer |
| Name | Customer name |
| Email | Customer email |
| Phone | Customer phone number |
| City | Customer city |
| Country | Customer country |

### 3. Orders

| Column | Description |
|---|---|
| Order_ID | Unique ID of the order |
| Customer_ID | ID of the customer who placed the order |
| Book_ID | ID of the ordered book |
| Order_Date | Date when the order was placed |
| Quantity | Number of books ordered |
| Total_Amount | Total amount of the order |

## Tools Used

- **PostgreSQL** — Database and SQL queries
- **pgAdmin** — Database management and query execution
- **SQL** — Data filtering, aggregation, sorting, grouping, and analysis
- **CSV** — Dataset format

## SQL Concepts Used

- SELECT
- WHERE
- DISTINCT
- BETWEEN
- ORDER BY
- LIMIT
- SUM()
- AVG()
- COUNT()
- JOIN
- GROUP BY
- HAVING
- COALESCE()

---

# SQL Questions & Solutions

### Q1. Retrieve all books in the "Fiction" genre

```sql
SELECT * FROM Books
WHERE Genre = 'Fiction';
```

### Q2. Find books published after the year 1950

```sql
SELECT * FROM Books
WHERE Published_Year > 1950;
```

### Q3. List all customers from Canada

```sql
SELECT * FROM Customers
WHERE Country = 'Canada';
```

### Q4. Show all orders placed in November 2023

```sql
SELECT * FROM Orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';
```

### Q5. Retrieve the total stock of books available

```sql
SELECT SUM(Stock) AS Total_Stock
FROM Books;
```

### Q6. Find the details of the most expensive book

```sql
SELECT * FROM Books
ORDER BY Price DESC
LIMIT 1;
```

### Q7. Show all orders where more than 1 book was ordered

```sql
SELECT * FROM Orders
WHERE Quantity > 1;
```

### Q8. Retrieve all orders where the total amount exceeds 20

```sql
SELECT * FROM Orders
WHERE Total_Amount > 20;
```

### Q9. Select all genres available in the Books table

```sql
SELECT DISTINCT Genre
FROM Books;
```

### Q10. Find the book with the lowest stock

```sql
SELECT * FROM Books
ORDER BY Stock
LIMIT 1;
```

### Q11. Calculate the total revenue generated from all orders

```sql
SELECT SUM(Total_Amount) AS Revenue
FROM Orders;
```

### Q12. Retrieve the total number of books sold for each genre

```sql
SELECT b.Genre,
       SUM(o.Quantity) AS Total_Books_Sold
FROM Orders o
JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Genre;
```

### Q13. Find the average price of books in the "Fantasy" genre

```sql
SELECT AVG(Price) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy';
```

### Q14. List customers who have placed at least 2 orders

```sql
SELECT o.Customer_ID,
       c.Name,
       COUNT(o.Order_ID) AS Order_Count
FROM Orders o
JOIN Customers c
    ON o.Customer_ID = c.Customer_ID
GROUP BY o.Customer_ID, c.Name
HAVING COUNT(o.Order_ID) >= 2;
```

### Q15. Find the most frequently ordered book

```sql
SELECT o.Book_ID,
       b.Title,
       COUNT(o.Order_ID) AS Order_Count
FROM Orders o
JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY o.Book_ID, b.Title
ORDER BY Order_Count DESC
LIMIT 1;
```

### Q16. Show the top 3 most expensive books in the "Fantasy" genre

```sql
SELECT * FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;
```

### Q17. Retrieve the total quantity of books sold by each author

```sql
SELECT b.Author,
       SUM(o.Quantity) AS Total_Books_Sold
FROM Orders o
JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Author;
```

### Q18. List the cities where customers who spent over $30 are located

```sql
SELECT DISTINCT c.City
FROM Orders o
JOIN Customers c
    ON o.Customer_ID = c.Customer_ID
WHERE o.Total_Amount > 30;
```

### Q19. Find the customer who spent the most on orders

```sql
SELECT c.Customer_ID,
       c.Name,
       SUM(o.Total_Amount) AS Total_Spent
FROM Orders o
JOIN Customers c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY Total_Spent DESC
LIMIT 1;
```

### Q20. Calculate the stock remaining after fulfilling all orders

```sql
SELECT b.Book_ID,
       b.Title,
       b.Stock,
       COALESCE(SUM(o.Quantity), 0) AS Order_Quantity,
       b.Stock - COALESCE(SUM(o.Quantity), 0) AS Remaining_Quantity
FROM Books b
LEFT JOIN Orders o
    ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID, b.Title, b.Stock;
```

---

## Project Files

```text
Online-Bookstore-SQL/
│
├── README.md
├── Books.csv
├── Customers.csv
├── Orders.csv
└── Online_Bookstore.sql
```

### `README.md`
Project documentation, SQL questions, and solutions.

### `Books.csv`
Book-related data used in the project.

### `Customers.csv`
Customer information used for customer-related analysis.

### `Orders.csv`
Order data used for sales, revenue, and inventory analysis.

### `Online_Bookstore.sql`
Database creation, table creation, and all 20 SQL queries.

## Key Takeaways

Working on this project helped me practice SQL on related tables instead of working with a single dataset. The queries cover basic filtering as well as aggregation and table relationships using joins.

The project also helped me understand how SQL can be used to turn raw transactional data into useful information about **sales, customers, books, and inventory**.

## Connect With Me

**Portfolio:** https://shyam-analyst.vercel.app

**GitHub:** https://github.com/1m-shyam01

**LinkedIn:** https://www.linkedin.com/in/shyam-singh-190b7a2a6
