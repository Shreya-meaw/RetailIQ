# Star Schema Design

## Overview

Following the normalization process, the retail sales dataset was transformed into a Star Schema to support business intelligence reporting, SQL-based analysis, and Power BI dashboard development.

A Star Schema was selected because it simplifies relationships, improves query performance, and provides an efficient structure for analytical workloads. The model is designed to support sales analysis, profitability reporting, customer analytics, product performance evaluation, geographic insights, and shipping analysis.

---

# Star Schema Structure

The dimensional model consists of one central fact table surrounded by five business dimensions.

### Fact Table

* FactSales

### Dimension Tables

* DimCustomer
* DimProduct
* DimLocation
* DimDate
* DimShipMode

---

# FactSales

The FactSales table stores transactional business metrics and references to analytical dimensions.

### Attributes

* SalesKey (Primary Key)
* OrderID
* DateKey (Foreign Key)
* CustomerKey (Foreign Key)
* ProductKey (Foreign Key)
* LocationKey (Foreign Key)
* ShipModeKey (Foreign Key)
* Sales
* Quantity
* Discount
* Profit

Grain
One row represents a product purchased within an order.

### Business Measures

* Sales
* Quantity
* Discount
* Profit

---

# DimCustomer

Stores customer-related information used for customer and segment analysis.

### Attributes

* CustomerKey
* CustomerID
* CustomerName
* Segment

---

# DimProduct

Stores product-related information used for product and category analysis.

### Attributes

* ProductKey
* ProductID
* ProductName
* Category
* SubCategory

---

# DimLocation

Stores geographic information used for regional and location-based reporting.

### Attributes

* LocationKey
* PostalCode
* City
* State
* Region
* Country

---

# DimDate

Stores calendar attributes used for time intelligence and trend analysis.

### Attributes

DateKey
FullDate
DayNumber
MonthNumber
MonthName
QuarterNumber
YearNumber

---

# DimShipMode

Stores shipping methods used for logistics and shipping performance analysis.

### Attributes

* ShipModeKey
* ShipMode

### Example Values

* First Class
* Second Class
* Standard Class
* Same Day

---

# Design Rationale

Customer, Product, Location, Date, and Ship Mode were identified as the primary business dimensions repeatedly used across analytical scenarios.

A dedicated Ship Mode dimension was included to support shipping performance analysis and maintain scalability for future logistics-related reporting requirements.

The resulting model provides a clean and scalable analytical foundation while maintaining simple relationships between business entities.

---

# Business Use Cases Supported

The model supports:

* Revenue Analysis
* Profitability Analysis
* Customer Analysis
* Product Performance Analysis
* Geographic Analysis
* Shipping Performance Analysis
* Discount Impact Analysis
* Monthly and Quarterly Trend Analysis

---

# Benefits

* Simplified reporting structure
* Faster analytical queries
* Improved Power BI performance
* Easier KPI calculations
* Reduced data redundancy
* Better scalability for future analysis

---

# Conclusion

The final Star Schema establishes a scalable and business-oriented analytical model for the Retail Sales Analytics System. The design enables efficient SQL analysis, business intelligence reporting, and interactive Power BI dashboards while supporting future analytical and reporting requirements.
