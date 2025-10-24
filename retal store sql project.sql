create database retail_store;
use retail_store;
CREATE TABLE retail_store (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID VARCHAR(10),
    CustomerName VARCHAR(50),
    ProductCategory VARCHAR(30),
    ProductName VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    TotalAmount DECIMAL(10,2),
    PaymentMethod VARCHAR(20),
    City VARCHAR(30),
    Country VARCHAR(30)
);
--- Q1) Display all sales records
select * from retail_sales;
--- Q2) Find total revenue generated
SELECT SUM(TotalAmount) AS Total_Revenue FROM retail_sales;
--- Q3) Find total revenue by product category
SELECT ProductCategory, SUM(TotalAmount) AS Category_Revenue
FROM retail_sales
GROUP BY ProductCategory
ORDER BY Category_Revenue DESC;
---- Q4) Find top 5 customers by total spending
SELECT CustomerName, SUM(TotalAmount) AS Total_Spent
FROM retail_sales
GROUP BY CustomerName
ORDER BY Total_Spent DESC
LIMIT 5;
----Q5) Find most popular payment method
SELECT PaymentMethod, COUNT(*) AS Usage_Count
FROM retail_sales
GROUP BY PaymentMethod
ORDER BY Usage_Count DESC;
----Q6) Find monthly sales trend
SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    SUM(TotalAmount) AS Monthly_Sales
FROM retail_sales
GROUP BY Month
ORDER BY Month;
---- Q7) Find average order value
SELECT AVG(TotalAmount) AS Avg_Order_Value FROM retail_sales;
---- Q8) find top 3 selling products
SELECT ProductName, SUM(Quantity) AS Total_Units_Sold
FROM retail_sales
GROUP BY ProductName
ORDER BY Total_Units_Sold DESC
LIMIT 3;
--- Q9) Find city-wise sales performance
SELECT City, SUM(TotalAmount) AS City_Revenue
FROM retail_sales
GROUP BY City
ORDER BY City_Revenue DESC;
---- Q10) Identify customers who made more than 3 purchases
SELECT CustomerName, COUNT(OrderID) AS Orders
FROM retail_sales
GROUP BY CustomerName
HAVING Orders > 3;
----  Q11) Highest and lowest sale per category
SELECT ProductCategory, 
       MAX(TotalAmount) AS Highest_Sale,
       MIN(TotalAmount) AS Lowest_Sale
FROM retail_sales
GROUP BY ProductCategory;
----- Q12) Yearly revenue summary
SELECT YEAR(OrderDate) AS Year, SUM(TotalAmount) AS Yearly_Revenue
FROM retail_sales
GROUP BY YEAR(OrderDate);








