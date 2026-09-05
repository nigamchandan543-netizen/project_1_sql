PR.1 Data Digger – SQL Database Project
📌 Project Overview

Data Digger is a beginner-friendly MySQL database project designed to practice SQL database creation, table relationships, data manipulation, filtering, sorting, aggregation, and basic analysis.

The project simulates a simple online shopping/order management system using four related tables:

Customers
Orders
Products
OrderDetails

The project demonstrates how these tables are connected using Primary Keys and Foreign Keys.

🎯 Objectives

The main objectives of this project are:

Create and manage a MySQL database.
Create multiple related tables.
Use Primary Keys and Foreign Keys.
Insert sample records.
Retrieve records using SELECT.
Update existing records using UPDATE.
Delete records using DELETE.
Filter data using WHERE and LIKE.
Sort data using ORDER BY.
Filter ranges using BETWEEN.
Work with dates using CURDATE() and INTERVAL.
Perform aggregate calculations using:
MAX()
MIN()
AVG()
SUM()
COUNT()
Group data using GROUP BY.
Find the top 3 most ordered products using ORDER BY and LIMIT.
🗄️ Database Structure

The database is named:

DataDigger
Tables
Table	Purpose
Customers	Stores customer information
Orders	Stores customer orders
Products	Stores product and stock information
OrderDetails	Stores products included in each order
🔗 Table Relationships

The database uses the following relationships:

Customers
    │
    │ 1-to-many
    ▼
Orders
    │
    │ 1-to-many
    ▼
OrderDetails
    ▲
    │ many-to-1
    │
Products
Relationships explained
One customer can have many orders.
Each order belongs to one customer.
One order can contain multiple order details.
Each order detail refers to one product.
One product can appear in multiple order details.
Foreign Keys
Orders.CustomerID
        ↓
Customers.CustomerID

OrderDetails.OrderID
        ↓
Orders.OrderID

OrderDetails.ProductID
        ↓
Products.ProductID
📋 Table Details
1. Customers

Stores customer information.

Column	Data Type	Key
CustomerID	INT	Primary Key
Name	VARCHAR(100)	NOT NULL
Email	VARCHAR(100)	UNIQUE
Address	VARCHAR(255)	—

Example records:

CustomerID	Name	Email	Address
1	Aniket Sharma	aniket@email.com	Chennai
2	Brijesh Patel	brijesh@email.com	Delhi
3	Sameer Khan	sameer@email.com	Bangalore
4	harshad Mehta	harsahd@email.com	Pune
2. Orders

Stores customer order information.

Column	Data Type	Key
OrderID	INT	Primary Key
CustomerID	INT	Foreign Key
OrderDate	DATE	—
TotalAmount	DECIMAL(10,2)	—

The CustomerID connects each order to the Customers table.

3. Products

Stores product information, prices, and stock.

Column	Data Type	Key
ProductID	INT	Primary Key
ProductName	VARCHAR(100)	NOT NULL
Price	DECIMAL(10,2)	—
Stock	INT	—

Example products include:

Wireless Mouse
Mechanical Keyboard
USB-C Hub
Laptop Stand
Webcam HD

The out-of-stock product is removed by the project's DELETE query.

4. OrderDetails

Stores the individual products included in orders.

Column	Data Type	Key
OrderDetailID	INT	Primary Key
OrderID	INT	Foreign Key
ProductID	INT	Foreign Key
Quantity	INT	—
SubTotal	DECIMAL(10,2)	—

This table acts as the connection between Orders and Products.

🛠️ SQL Concepts Used
Database Management
CREATE DATABASE
USE
DROP TABLE
Table Creation
CREATE TABLE
PRIMARY KEY
FOREIGN KEY
AUTO_INCREMENT
NOT NULL
UNIQUE
Data Manipulation
INSERT INTO
UPDATE
DELETE
Data Retrieval
SELECT
WHERE
LIKE
BETWEEN
ORDER BY
LIMIT
Aggregate Functions
MAX()
MIN()
AVG()
SUM()
COUNT()
Grouping
GROUP BY
Date Operations
CURDATE()
INTERVAL 30 DAY
🔍 Important Queries
Find all customers named Alice
SELECT * FROM Customers
WHERE Name LIKE 'Alice%';
Find orders from the last 30 days
SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
Find highest, lowest, and average order amount
SELECT
    MAX(TotalAmount) AS HighestOrder,
    MIN(TotalAmount) AS LowestOrder,
    AVG(TotalAmount) AS AverageOrder
FROM Orders;
Find products priced between ₹500 and ₹2000
SELECT * FROM Products
WHERE Price BETWEEN 500 AND 2000;
Calculate total revenue
SELECT SUM(SubTotal) AS TotalRevenue
FROM OrderDetails;
Find the top 3 most ordered products
SELECT ProductID, SUM(Quantity) AS TotalSold
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalSold DESC
LIMIT 3;
Count sales records for a product
SELECT COUNT(*) AS TimesSold
FROM OrderDetails
WHERE ProductID = 1;
📊 Sample Analysis

Using the sample OrderDetails data, the total revenue is:

Total Revenue = ₹11,891.00

The top 3 products by quantity sold are:

ProductID	Total Sold
1	5
5	2
2	1
▶️ How to Run the Project
Step 1: Open MySQL

You can use:

MySQL Workbench
MySQL Command Line
XAMPP MySQL
phpMyAdmin
Step 2: Open the SQL script

Open the project SQL file containing the Data Digger queries.

Step 3: Run the complete script

The script will:

Create the DataDigger database.
Select the database.
Remove existing tables if they exist.
Create the four tables.
Insert sample data.
Execute SELECT, UPDATE, and DELETE queries.
Perform aggregate and analysis queries.
Step 4: Check the results

Run:

USE DataDigger;

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Products;
SELECT * FROM OrderDetails;
📁 Suggested Project Structure
DataDigger/
│
├── DataDigger.sql
├── README.md
└── data_digger_tables.png
🖼️ Database Tables Image

The project also includes a visual representation of the main tables and sample query results.

The image can be used in the project documentation or README to show:

Customers table
Orders table
Products table
OrderDetails table
Top 3 most ordered products
Total revenue
⚠️ Important Note

The SQL script performs DELETE operations:

DELETE FROM Customers
WHERE CustomerID = 5;

and:

DELETE FROM Orders
WHERE OrderID = 4;

and:

DELETE FROM Products
WHERE Stock = 0;

Because the project uses foreign keys, data should be inserted and deleted in an appropriate order to avoid foreign-key constraint errors.

For a clean demonstration, run the complete script from the beginning.

🚀 Skills Demonstrated

This project demonstrates practical knowledge of:

MySQL
Relational databases
Database design
Primary Keys
Foreign Keys
CRUD operations
Data filtering
Data sorting
Aggregate functions
Grouping
Date filtering
Basic business analysis
SQL relationships
👨‍💻 Project

Project Name: PR.1 Data Digger
Database: MySQL
Database Name: DataDigger
Level: Beginner / Practice Project

📜 License

This project is created for learning and SQL practice purposes.
