-- Retail Sales Power BI Views


-- 1. Monthly Revenue
CREATE OR REPLACE VIEW vw_monthly_revenue AS
SELECT
    Year,
    Month,
    Month_Name,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(Quantity) AS total_quantity,
    COUNT(DISTINCT Invoice) AS total_orders
FROM retail_sales
GROUP BY Year, Month, Month_Name
ORDER BY Year, Month;


-- 2. Country Revenue
CREATE OR REPLACE VIEW vw_country_revenue AS
SELECT
    Country,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(Quantity) AS total_quantity,
    COUNT(DISTINCT Invoice) AS total_orders
FROM retail_sales
GROUP BY Country
ORDER BY total_revenue DESC;


-- 3. Product Performance
CREATE OR REPLACE VIEW vw_product_performance AS
SELECT
    StockCode,
    Description,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(Quantity) AS total_quantity,
    COUNT(DISTINCT Invoice) AS total_orders
FROM retail_sales
GROUP BY StockCode, Description
ORDER BY total_revenue DESC;


-- 4. Customer Performance
CREATE OR REPLACE VIEW vw_customer_performance AS
SELECT
    Customer_ID,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(Quantity) AS total_quantity,
    COUNT(DISTINCT Invoice) AS total_orders
FROM retail_sales
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
ORDER BY total_revenue DESC;


-- 5. Returns
CREATE OR REPLACE VIEW vw_returns AS
SELECT
    Is_Return,
    COUNT(*) AS transaction_rows,
    SUM(Quantity) AS total_quantity,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales
GROUP BY Is_Return;


-- 6. Yearly Revenue
CREATE OR REPLACE VIEW vw_yearly_revenue AS
SELECT
    Year,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(Quantity) AS total_quantity,
    COUNT(DISTINCT Invoice) AS total_orders
FROM retail_sales
GROUP BY Year
ORDER BY Year;


-- 7. Dashboard KPIs
CREATE OR REPLACE VIEW vw_dashboard_kpis AS
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Invoice) AS total_orders,
    COUNT(DISTINCT Customer_ID) AS total_customers,
    SUM(Quantity) AS total_quantity,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(
        SUM(Revenue) / NULLIF(COUNT(DISTINCT Invoice), 0),
        2
    ) AS average_order_value
FROM retail_sales;