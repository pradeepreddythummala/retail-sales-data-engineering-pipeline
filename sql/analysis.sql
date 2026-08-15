-- Retail Sales Analysis Queries
-- Database: retail_sales_db
-- Table: retail_sales


-- 1. Total number of rows
SELECT COUNT(*) AS total_rows
FROM retail_sales;


-- 2. Total revenue
SELECT
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales;


-- 3. Total quantity sold
SELECT
    SUM(Quantity) AS total_quantity
FROM retail_sales;


-- 4. Total invoices
SELECT
    COUNT(DISTINCT Invoice) AS total_invoices
FROM retail_sales;


-- 5. Total customers
SELECT
    COUNT(DISTINCT Customer_ID) AS total_customers
FROM retail_sales;


-- 6. Revenue by country
SELECT
    Country,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales
GROUP BY Country
ORDER BY total_revenue DESC;


-- 7. Monthly revenue
SELECT
    Year,
    Month,
    Month_Name,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales
GROUP BY Year, Month, Month_Name
ORDER BY Year, Month;


-- 8. Top 10 products by revenue
SELECT
    StockCode,
    Description,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales
GROUP BY StockCode, Description
ORDER BY total_revenue DESC
LIMIT 10;


-- 9. Top 10 customers by revenue
SELECT
    Customer_ID,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
ORDER BY total_revenue DESC
LIMIT 10;


-- 10. Returns analysis
SELECT
    Is_Return,
    COUNT(*) AS transaction_rows,
    SUM(Quantity) AS total_quantity,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales
GROUP BY Is_Return
ORDER BY Is_Return;


-- 11. Revenue by year
SELECT
    Year,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales
GROUP BY Year
ORDER BY Year;


-- 12. Average order value
SELECT
    ROUND(
        SUM(Revenue) / NULLIF(COUNT(DISTINCT Invoice), 0),
        2
    ) AS average_order_value
FROM retail_sales;


-- 13. Daily revenue
SELECT
    Year,
    Month,s
    Day,
    Day_Name,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales
GROUP BY Year, Month, Day, Day_Name
ORDER BY Year, Month, Day;