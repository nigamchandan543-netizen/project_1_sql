-- =============================================
-- PR.1 Data Digger - Complete SQL Script
-- =============================================

CREATE DATABASE IF NOT EXISTS DataDigger;
USE DataDigger;

-- Drop tables if they already exist (for clean re-run)
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- =============================================
-- 1. CREATE TABLES
-- =============================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(255)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2),
    Stock INT
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- =============================================
-- 2. CUSTOMERS TABLE QUERIES
-- =============================================

-- Insert at least 5 sample customers
INSERT INTO Customers (Name, Email, Address) VALUES
('Aniket Sharma', 'aniket@gmail.com', 'Mumbai'),
('Brijesh Patel', 'brijesh@gmail.com', 'Delhi'),
('Sameer Khan', 'sameer@gmail.com', 'Bangalore'),
('Harshad Mehta', 'harshad@gmail.com', 'Pune'),
('Ritu Verma', 'ritu@gmail.com', 'Hyderabad');

-- Retrieve all customer details
SELECT * FROM Customers;

-- Update a customer’s address
UPDATE Customers 
SET Address = 'Chennai' 
WHERE CustomerID = 1;

-- Delete a customer using their CustomerID
DELETE FROM Customers 
WHERE CustomerID = 5;

-- Display all customers whose name is 'Alice'
SELECT * FROM Customers 
WHERE Name LIKE 'Aniket%';

-- =============================================
-- 3. ORDERS TABLE QUERIES
-- =============================================

-- Insert at least 5 sample orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2026-07-15', 2500.00),
(2, '2026-07-20', 1800.00),
(1, '2026-08-01', 3200.00),
(3, '2026-08-05', 950.00),
(4, '2026-08-10', 4100.00);

-- Retrieve all orders made by a specific customer
SELECT * FROM Orders 
WHERE CustomerID = 1;

-- Update an order’s total amount
UPDATE Orders 
SET TotalAmount = 2750.00 
WHERE OrderID = 1;

-- Delete an order using its OrderID
DELETE FROM Orders 
WHERE OrderID = 4;

-- Retrieve orders placed in the last 30 days
SELECT * FROM Orders 
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

-- Highest, lowest and average order amount
SELECT 
    MAX(TotalAmount) AS HighestOrder,
    MIN(TotalAmount) AS LowestOrder,
    AVG(TotalAmount) AS AverageOrder
FROM Orders;

-- =============================================
-- 4. PRODUCTS TABLE QUERIES
-- =============================================

-- Insert at least 5 sample products
INSERT INTO Products (ProductName, Price, Stock) VALUES
('Wireless Mouse', 799.00, 50),
('Mechanical Keyboard', 2499.00, 30),
('USB-C Hub', 1299.00, 0),
('Laptop Stand', 1599.00, 25),
('Webcam HD', 1899.00, 15);

-- Retrieve all products sorted by price DESC
SELECT * FROM Products 
ORDER BY Price DESC;

-- Update the price of a specific product
UPDATE Products 
SET Price = 899.00 
WHERE ProductID = 1;

-- Delete a product if it’s out of stock
DELETE FROM Products 
WHERE Stock = 0;

-- Retrieve products whose price is between ₹500 and ₹2000
SELECT * FROM Products 
WHERE Price BETWEEN 500 AND 2000;

-- Most expensive and cheapest product
SELECT 
    MAX(Price) AS MostExpensive,
    MIN(Price) AS Cheapest
FROM Products;

-- =============================================
-- 5. ORDERDETAILS TABLE QUERIES
-- =============================================

-- Insert at least 5 sample records
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 1, 2, 1598.00),
(1, 2, 1, 2499.00),
(2, 4, 1, 1599.00),
(3, 5, 2, 3798.00),
(5, 1, 3, 2397.00);

-- Retrieve all order details for a specific order
SELECT * FROM OrderDetails 
WHERE OrderID = 1;

-- Calculate total revenue using SUM()
SELECT SUM(SubTotal) AS TotalRevenue 
FROM OrderDetails;

-- Top 3 most ordered products
SELECT ProductID, SUM(Quantity) AS TotalSold
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalSold DESC
LIMIT 3;

-- Count how many times a specific product has been sold
SELECT COUNT(*) AS TimesSold
FROM OrderDetails
WHERE ProductID = 1;