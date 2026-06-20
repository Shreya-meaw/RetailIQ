
-- Retail Sales Analytics System
-- Star Schema Implementation


CREATE DATABASE IF NOT EXISTS retail_sales_dw;

USE retail_sales_dw;

-- Dimension: Customer


CREATE TABLE DimCustomer (
    CustomerKey INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID VARCHAR(20) NOT NULL,
    CustomerName VARCHAR(150) NOT NULL,
    Segment VARCHAR(50) NOT NULL
);

-- Dimension: Product


CREATE TABLE DimProduct (
    ProductKey INT AUTO_INCREMENT PRIMARY KEY,
    ProductID VARCHAR(30) NOT NULL,
    ProductName VARCHAR(255) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    SubCategory VARCHAR(100) NOT NULL
);


-- Dimension: Location


CREATE TABLE DimLocation (
    LocationKey INT AUTO_INCREMENT PRIMARY KEY,
    PostalCode VARCHAR(20),
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    Region VARCHAR(50) NOT NULL,
    Country VARCHAR(100) NOT NULL
);


-- Dimension: Date


CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    DayNumber INT NOT NULL,
    MonthNumber INT NOT NULL,
    MonthName VARCHAR(20) NOT NULL,
    QuarterNumber INT NOT NULL,
    YearNumber INT NOT NULL
);


-- Dimension: Ship Mode


CREATE TABLE DimShipMode (
    ShipModeKey INT AUTO_INCREMENT PRIMARY KEY,
    ShipMode VARCHAR(50) NOT NULL
);


-- Fact Table: Sales


CREATE TABLE FactSales (
    SalesKey INT AUTO_INCREMENT PRIMARY KEY,

    OrderID VARCHAR(30) NOT NULL,

    DateKey INT NOT NULL,
    CustomerKey INT NOT NULL,
    ProductKey INT NOT NULL,
    LocationKey INT NOT NULL,
    ShipModeKey INT NOT NULL,

    Sales DECIMAL(12,2) NOT NULL,
    Quantity INT NOT NULL,
    Discount DECIMAL(5,2) NOT NULL,
    Profit DECIMAL(12,2) NOT NULL,

    CONSTRAINT fk_date
        FOREIGN KEY (DateKey)
        REFERENCES DimDate(DateKey),

    CONSTRAINT fk_customer
        FOREIGN KEY (CustomerKey)
        REFERENCES DimCustomer(CustomerKey),

    CONSTRAINT fk_product
        FOREIGN KEY (ProductKey)
        REFERENCES DimProduct(ProductKey),

    CONSTRAINT fk_location
        FOREIGN KEY (LocationKey)
        REFERENCES DimLocation(LocationKey),

    CONSTRAINT fk_shipmode
        FOREIGN KEY (ShipModeKey)
        REFERENCES DimShipMode(ShipModeKey)
);