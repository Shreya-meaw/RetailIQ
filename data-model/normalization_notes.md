# Data Normalization Notes

## Overview

The Retail Sales dataset contains transactional information related to customer purchases, product details, shipping operations, geographic locations, and business performance metrics.

The original dataset consists of **1,000 transaction records** and **21 attributes** stored in a single flat table.

While this structure is suitable for recording transactions, several business entities are repeatedly stored across multiple records. A normalization review was conducted to identify data dependencies, reduce redundancy, and establish a foundation for analytical modeling.

---

# Dataset Review

The dataset contains the following attributes:

* Row ID
* Order ID
* Order Date
* Ship Date
* Ship Mode
* Customer ID
* Customer Name
* Segment
* City
* State
* Country
* Postal Code
* Region
* Product ID
* Category
* Sub-Category
* Product Name
* Sales
* Quantity
* Discount
* Profit

The review identified repeated customer, product, geographic, and shipping information throughout the dataset.

---

# Customer Information Analysis

Customers may place multiple orders over time.

The following attributes are repeatedly stored across transactions:

* Customer ID
* Customer Name
* Segment

### Functional Dependency

```text
Customer ID
    → Customer Name
    → Segment
```

Since customer attributes are dependent on Customer ID, storing them in every transaction introduces redundancy.

---

# Product Information Analysis

Products are sold repeatedly across different orders and customers.

The following attributes are duplicated throughout the dataset:

* Product ID
* Product Name
* Category
* Sub-Category

### Functional Dependency

```text
Product ID
    → Product Name
    → Category
    → Sub-Category
```

Product information should therefore be separated from transactional records.

---

# Geographic Information Analysis

Location-related information appears repeatedly across transactions.

Repeated attributes include:

* Postal Code
* City
* State
* Region
* Country

### Functional Dependency

```text
Postal Code
    → City
    → State
    → Region
    → Country
```

These attributes describe geographic dimensions rather than individual sales events.

---

# Order and Shipping Analysis

Order-level information is shared across products belonging to the same order.

Repeated attributes include:

* Order ID
* Order Date
* Ship Date
* Ship Mode

### Functional Dependency

```text
Order ID
    → Order Date
    → Ship Date
    → Ship Mode
```

These attributes describe the order itself rather than the individual product sale.

---

# Transaction Measures

The following fields represent measurable business facts:

* Sales
* Quantity
* Discount
* Profit

These values vary for each transaction and must remain associated with the sales record.

---

# Business Insights Identified During Review

The normalization process also highlighted several analytical opportunities.

### Discount Impact on Profitability

Several transactions contain relatively high discount values while generating low or negative profit.

This indicates that discounting strategy may have a direct impact on business profitability and should be explored during analysis.

---

### Product Performance Variation

Some products generate substantial revenue but contribute comparatively lower profit margins.

This suggests that sales revenue alone is not sufficient for evaluating product performance.

---

### Time-Based Analysis Opportunities

The presence of order and shipping dates enables:

* Monthly trend analysis
* Quarterly performance analysis
* Year-over-Year comparison
* Seasonal sales pattern analysis

---

### Customer Analysis Opportunities

Customer identifiers allow deeper analysis such as:

* Customer lifetime value
* Purchase frequency
* Repeat customer behavior
* Segment-level performance analysis

---

# Normalization Approach

Based on dependency analysis, the dataset can be logically separated into distinct business entities.

## Customer Entity

Stores customer-related information:

* Customer ID
* Customer Name
* Segment

---

## Product Entity

Stores product-related information:

* Product ID
* Product Name
* Category
* Sub-Category

---

## Location Entity

Stores geographic information:

* Postal Code
* City
* State
* Region
* Country

---

## Order Entity

Stores order and shipping information:

* Order ID
* Order Date
* Ship Date
* Ship Mode

---

## Sales Transaction Entity

Stores transactional measures:

* Sales
* Quantity
* Discount
* Profit

along with references to customer, product, location, and order entities.

---

# Dimensional Modeling Decision

A fully normalized database structure was evaluated during the review process. However, the primary objective of this project is analytical reporting, KPI tracking, and dashboard development.

For Business Intelligence workloads, dimensional models provide better performance and simpler reporting structures than highly normalized transactional schemas.

Therefore, the normalized entities were used as the foundation for designing a Star Schema.

---

# Expected Benefits

The dimensional model is expected to provide:

* Reduced data redundancy
* Improved data consistency
* Simplified table relationships
* Faster analytical queries
* Better aggregation performance
* Enhanced Power BI model efficiency
* Scalable reporting architecture

---

# Outcome

The normalization review identified the major business entities present within the dataset and established the foundation for dimensional modeling.

The resulting analytical model consists of:

### Fact Table

* FactSales

### Dimension Tables

* DimCustomer
* DimProduct
* DimDate
* DimLocation

This structure supports efficient SQL analysis, business intelligence reporting, and Power BI dashboard development.