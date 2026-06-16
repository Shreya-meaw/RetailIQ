# Normalization Notes

## Overview

The retail sales dataset contains order, customer, product, shipping, location, and financial information in a single flat table. While this structure is suitable for operational record keeping, it introduces redundancy and is not optimized for analytical reporting.

A detailed review of the dataset was performed to identify repeated entities, data dependencies, and opportunities for dimensional modeling before building the reporting layer.

---

## Dataset Review

The dataset contains information related to:

* Orders
* Customers
* Products
* Categories and Sub-Categories
* Geographic Locations
* Shipping Information
* Sales Transactions
* Profitability Metrics

During the review process, multiple instances of repeated customer, product, and location information were identified across transactions.

---

## Key Observations

### Customer Information Repetition

The same customer appears across multiple orders over time.

Repeated attributes include:

* Customer ID
* Customer Name
* Segment
* City
* State
* Region

This causes customer information to be stored repeatedly within transaction records.

---

### Product Information Repetition

Products are sold multiple times across different orders, customers, and regions.

Repeated attributes include:

* Product ID
* Product Name
* Category
* Sub-Category

As the number of transactions grows, storing product details within every order creates redundancy.

---

### Location Information Repetition

Geographic information is repeated throughout the dataset.

Common repeated fields include:

* City
* State
* Region
* Country

These attributes are useful for reporting but do not change at the transaction level.

---

### Date Information Repetition

Each transaction stores order-related dates.

Reporting frequently requires:

* Month
* Quarter
* Year
* Year-over-Year Analysis
* Seasonal Trend Analysis

Creating a dedicated date dimension simplifies time-based reporting and improves dashboard usability.

---

### Transactional Measures

The following fields represent measurable business facts and should remain within a fact table:

* Sales
* Profit
* Quantity
* Discount

These values change at the transaction level and form the basis of business performance analysis.

---

## Business Insights Identified During Initial Review

The dataset review also revealed several analytical opportunities that influenced the modeling approach.

### High Discount and Negative Profit Relationship

Initial inspection showed multiple transactions where large discounts were associated with negative profit values.

This suggests that discounting strategy may directly impact profitability and should be investigated further during the analysis phase.

---

### Product Profitability Variations

Some products generate high sales revenue but contribute relatively low profit.

This indicates that revenue alone is not a sufficient measure of business performance.

---

### Seasonal Sales Analysis Opportunity

The dataset contains multiple years of transactional data, making it suitable for:

* Monthly trend analysis
* Quarterly performance analysis
* Seasonal sales pattern detection

---

### Customer Retention Analysis Opportunity

Since customers appear repeatedly over different time periods, the dataset supports:

* Customer lifetime analysis
* Purchase frequency analysis
* Customer churn identification

---

## Normalization Approach

To reduce redundancy and improve maintainability, the dataset was logically separated into business entities.

### Customer Entity

Stores customer-related attributes:

* Customer ID
* Customer Name
* Segment
* City
* State
* Region

---

### Product Entity

Stores product-related attributes:

* Product ID
* Product Name
* Category
* Sub-Category

---

### Date Entity

Stores reporting and time intelligence attributes:

* DateKey
* Order Date
* Month
* Quarter
* Year

Ship Date remains available for fulfillment and logistics analysis.

---

### Sales Transaction Entity

Stores transactional business measures:

* Sales
* Profit
* Quantity
* Discount

and references:

* Customer
* Product
* Date

---

## Dimensional Modeling Decision

A fully normalized transactional design was considered during the review process. However, the primary objective of this project is business intelligence reporting, KPI tracking, and dashboard development.

For analytical workloads, a Star Schema provides better performance and simpler reporting compared to a highly normalized operational model.

Therefore, a dimensional warehouse design was selected.

---

## Expected Benefits

The dimensional model is expected to provide:

* Faster analytical queries
* Simplified dashboard relationships
* Better aggregation performance
* Improved Power BI model efficiency
* Easier KPI calculations
* Scalable reporting architecture

---

## Outcome

Based on the normalization review, the retail dataset will be transformed into a dimensional model consisting of:

### Fact Table

* FactSales

### Dimension Tables

* DimCustomer
* DimProduct
* DimDate

This structure will serve as the foundation for SQL analysis, business intelligence reporting, and Power BI dashboard development throughout the project.
