# Data Dictionary

basic about col there are 21 col's with 1000 rows

| Column Name | Description | Data Type | Example Values | Purpose |
|-------------|-------------|-----------|----------------|---------|
| Row ID | Unique identifier for each record | Integer | 1, 2, 3 | Track each row uniquely |
| Order ID | Unique order identifier | String | CA-2017-152156 | Group items in same order |
| Order Date | Date when order was placed | Date | 2024-01-15 | Time-based analysis |
| Ship Date | Date when order was shipped | Date | 2024-01-18 | Delivery tracking |
| Ship Mode | Shipping method used | Categorical | Standard Class, First Class | Analyze delivery options |
| Customer ID | Unique customer identifier | String | CG-12520 | Customer tracking |
| Customer Name | Name of customer | String | John Smith | Customer identification |
| Segment | Customer segment type | Categorical | Consumer, Corporate, Home Office | Customer segmentation |
| City | City of customer | String | Mumbai | Geographic analysis |
| State | State of customer | String | Maharashtra | Regional analysis |
| Country | Country of order | String | India | Country-level insights |
| Postal Code | Area postal code | Integer/String | 400001 | Location precision |
| Region | Geographic region | Categorical | East, West, North, South | Regional comparison |
| Product ID | Unique product identifier | String | TEC-AC-100 | Product tracking |
| Category | Main product category | Categorical | Furniture, Technology | High-level grouping |
| Sub-Category | Sub category of product | Categorical | Chairs, Phones | Detailed analysis |
| Product Name | Name of product | String | iPhone 13 | Product identification |
| Sales | Total sales value | Float | 1200.50 | Revenue analysis |
| Quantity | Number of items sold | Integer | 3 | Demand analysis |
| Discount | Discount applied | Float | 0.2 | Pricing strategy |
| Profit | Profit earned | Float | 250.75 | Business performance |