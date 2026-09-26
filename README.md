# E-Commerce Sales & Customer Analysis

## Project Overview

This project analyzes approximately **100K e-commerce orders** using SQL to uncover insights about:

* Order volume and status
* Sales and revenue
* Customer purchasing behavior
* Product performance
* Monthly sales trends
* Order cancellations

The goal is to demonstrate practical **data analyst skills** by taking raw relational data, joining tables, calculating business metrics, and turning the results into clear business insights.

---

# Dataset

The dataset contains information from an e-commerce marketplace, including:

* Orders
* Customers
* Products
* Order items
* Sellers
* Payments

The analysis primarily uses the `orders`, `order_items`, `customers`, and `products` tables.

### Dataset size

* **99,441 orders**
* **112,650 order-item records**
* **96,096 customers**
* **32,951 products**

An important distinction is that **112,650 order-item records does not mean 112,650 orders**.

One order can contain multiple products, so the same `order_id` can appear multiple times in `order_items`.

---

# Key Questions

This analysis focuses on questions a business might ask about its e-commerce operations:

1. How many orders were placed?
2. What percentage of orders were canceled?
3. What are the most common order statuses?
4. How many customers are there?
5. How many customers make repeat purchases?
6. Which customers place the most orders?
7. Which product categories have the most order activity?
8. How much revenue was generated?
9. What is the average order value?
10. Which months have the highest order volume?
11. Which months generate the most revenue?
12. How does sales activity change over time?

---

# Key Findings

## 1. Order Volume

The dataset contains:

**99,441 total orders**

The vast majority of orders were successfully delivered.

### Order Status Breakdown

| Order Status |     Orders |
| ------------ | ---------: |
| Delivered    |     96,478 |
| Shipped      |      1,107 |
| Canceled     |        625 |
| Unavailable  |        609 |
| Invoiced     |        314 |
| Processing   |        301 |
| Created      |          5 |
| Approved     |          2 |
| **Total**    | **99,441** |

Delivered orders account for approximately **97% of all orders**.

Canceled orders account for approximately **0.63%** of all orders.

---

## 2. Customer Behavior

There are:

**96,096 customers**

compared with:

**99,441 orders**

This works out to approximately:

**1.03 orders per customer**

The analysis also found:

* **252 customers** placed 3 or more orders.
* The highest number of orders placed by a single customer was **17**.

This shows that the marketplace has a very large customer base relative to its total number of orders, while customers with frequent repeat purchases represent a relatively small group.

---

## 3. Product Activity

The dataset contains:

**32,951 products**

There are:

**112,650 order-item records**

The highest-volume product categories identified in the analysis included:

| Product Category         | Order Items |
| ------------------------ | ----------: |
| `moveis_decoracao`       |         527 |
| `cama_mesa_banho`        |         488 |
| `ferramentas_jardim`     |         484 |
| `esporte_lazer`          |         483 |
| `informatica_acessorios` |         478 |

These results show differences in product-category demand and provide a starting point for deeper product-performance analysis.

---

## 4. Revenue

The analysis calculated total revenue of:

**$13,591,643.70**

The average order value was approximately:

**$137.75**

The highest-value order was approximately:

**$13,440**

### Average Order Value

Average Order Value was calculated as:

```text
Total Revenue ÷ Total Orders
```

```text
$13,591,643.70 ÷ 99,441
≈ $137.75
```

---

## 5. Monthly Order Trends

Order activity generally increased from **2017 into 2018**.

The analysis identified several high-volume months, including:

* **November 2017**
* **January 2018**
* **March 2018**

The highest order volume identified was:

### November 2017

**7,544 orders**

The dataset also includes dates/months such as:

* `2017-11`
* `2018-01`
* `2018-03`

and **2018** was identified as the higher-volume year in the analysis.

---

## 6. Monthly Revenue

The highest monthly revenue identified in the analysis was:

### April 2018

**$996,647.75**

Several other months also generated close to $1 million in revenue.

This suggests that monthly revenue remained relatively strong across several periods rather than being concentrated entirely in a single month.

---

# Business Takeaways

## 1. Most orders are successfully fulfilled

With **96,478 delivered orders out of 99,441 total orders**, successful delivery represents the overwhelming majority of order outcomes.

The relatively small number of canceled orders — **625**, or approximately **0.63%** — suggests that cancellations make up a small portion of overall order activity.

From a business perspective, order-status analysis can help monitor fulfillment performance and identify unusual increases in cancellations, unavailable orders, or other non-delivered statuses.

---

## 2. Repeat purchasing is an opportunity to investigate

There are **96,096 customers** but **99,441 orders**, producing an average of only about **1.03 orders per customer**.

Only **252 customers placed 3 or more orders**, while the highest-order customer placed **17 orders**.

This makes repeat purchasing an important area for additional analysis.

A business could investigate:

* What characteristics repeat customers have
* Which products they purchase
* How much repeat customers spend
* Whether certain categories generate more repeat purchases
* How long customers wait between purchases

---

## 3. Product categories show different levels of demand

The product-category analysis shows that some categories have substantially more order-item activity than others.

For example:

* `moveis_decoracao`: **527**
* `cama_mesa_banho`: **488**
* `ferramentas_jardim`: **484**
* `esporte_lazer`: **483**
* `informatica_acessorios`: **478**

This type of analysis could help a business investigate inventory planning, merchandising, marketing, and category performance.

Importantly, **order volume alone does not tell us which category is most profitable**. Revenue, average selling price, costs, and margins would need to be analyzed before making profitability conclusions.

---

## 4. Revenue is substantial and provides a useful baseline

The analyzed order-item data generated approximately:

**$13.59 million in revenue**

with an average order value of approximately:

**$137.75**

These metrics provide baseline measures that can be used to compare:

* Customers
* Product categories
* Sellers
* Months
* Geographic regions

Future analysis could determine which segments contribute the greatest amount of revenue rather than looking only at overall totals.

---

## 5. Sales activity varies by month

November 2017 had the highest identified order volume with:

**7,544 orders**

while April 2018 had the highest identified monthly revenue with:

**$996,647.75**

The fact that the month with the highest number of orders was not necessarily the month with the highest revenue demonstrates why businesses should look at **both order volume and revenue**.

A month can have more orders without necessarily generating the most revenue.

---

# SQL Skills Demonstrated

This project demonstrates practical SQL skills including:

### Filtering

```sql
WHERE
```

### Sorting

```sql
ORDER BY
```

### Limiting results

```sql
LIMIT
```

### Aggregation

```sql
COUNT()
SUM()
AVG()
MIN()
MAX()
```

### Grouping

```sql
GROUP BY
```

### Filtering grouped results

```sql
HAVING
```

### Joining tables

```sql
JOIN
LEFT JOIN
```

### Business metrics

The project calculates metrics such as:

* Total orders
* Order-status distribution
* Cancellation rate
* Orders per customer
* Repeat customers
* Product-category volume
* Total revenue
* Average order value
* Highest order value
* Monthly order volume
* Monthly revenue

---

# Project Structure

```text
ecommerce-data-analysis/
│
├── data/
│   └── ecommerce database files
│
├── sql/
│   ├── 01_order_analysis.sql
│   ├── 02_customer_analysis.sql
│   ├── 03_product_analysis.sql
│   └── 04_revenue_analysis.sql
│
└── README.md
```

---

# Overall Conclusions

The analysis of approximately **100K e-commerce orders** revealed several important patterns.

The marketplace processed **99,441 orders**, with **96,478 delivered orders** and only **625 canceled orders**, resulting in a cancellation rate of approximately **0.63%**.

The marketplace had **96,096 customers**, but the average customer placed only about **1.03 orders**. Only **252 customers placed 3 or more orders**, suggesting that repeat purchasing is a useful area for further investigation.

The dataset contained **112,650 order-item records** across **32,951 products**, with certain product categories showing higher order activity.

Total analyzed revenue was approximately **$13.59 million**, with an average order value of approximately **$137.75**.

Finally, order activity generally increased from **2017 into 2018**, with **November 2017** producing the highest identified order volume at **7,544 orders**, while **April 2018** produced the highest identified monthly revenue at **$996,647.75**.

Overall, this project demonstrates how SQL can be used to move from raw transactional data to **business-focused findings and actionable questions**.
