-- Retail Sales Data Warehouse Schema

CREATE TABLE retail_sales (
    Invoice VARCHAR(50),
    StockCode VARCHAR(50),
    Description VARCHAR(255),
    Quantity INTEGER,
    InvoiceDate TIMESTAMP,
    Price DECIMAL(10,2),
    Customer_ID VARCHAR(50),
    Country VARCHAR(100),
    Revenue DECIMAL(12,2),
    Year INTEGER,
    Month INTEGER,
    Month_Name VARCHAR(20),
    Day INTEGER,
    Day_Name VARCHAR(20),
    Is_Return BOOLEAN
);