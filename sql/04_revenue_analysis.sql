-- ============================================================
-- E-Commerce Data Analysis
-- 04 - Revenue Analysis
-- ============================================================
-- Purpose:
-- Analyze total revenue, average order value, high-value orders,
-- and revenue trends over time.
-- ============================================================

-- 1. Total revenue
-- Business question:
-- How much revenue was generated from product sales?

SELECT
ROUND(SUM(price), 2) AS total_revenue
FROM order_items;

-- 2. Average order value
-- Business question:
-- What is the average amount spent per order?

SELECT
ROUND(SUM(order_items.price) / COUNT(DISTINCT order_items.order_id), 2)
AS average_order_value
FROM order_items;

-- 3. Highest-value order
-- Business question:
-- What is the largest order by product value?

SELECT
order_id,
ROUND(SUM(price), 2) AS order_value
FROM order_items
GROUP BY order_id
ORDER BY order_value DESC
LIMIT 10;

-- 4. Revenue by year
-- Business question:
-- How does total revenue change from year to year?

SELECT
strftime('%Y', orders.order_purchase_timestamp) AS year,
ROUND(SUM(order_items.price), 2) AS revenue
FROM orders
JOIN order_items
ON orders.order_id = order_items.order_id
GROUP BY year
ORDER BY year;

-- 5. Monthly revenue
-- Business question:
-- Which months generate the most revenue?

SELECT
strftime('%Y-%m', orders.order_purchase_timestamp) AS month,
ROUND(SUM(order_items.price), 2) AS revenue
FROM orders
JOIN order_items
ON orders.order_id = order_items.order_id
GROUP BY month
ORDER BY revenue DESC;

-- 6. Revenue by product category
-- Business question:
-- Which product categories contribute the most revenue?

SELECT
products.product_category_name,
ROUND(SUM(order_items.price), 2) AS revenue
FROM order_items
JOIN products
ON order_items.product_id = products.product_id
GROUP BY products.product_category_name
ORDER BY revenue DESC
LIMIT 10;

-- 7. Average order value by month
-- Business question:
-- Does the average amount spent per order change over time?

SELECT
strftime('%Y-%m', orders.order_purchase_timestamp) AS month,
ROUND(
SUM(order_items.price) / COUNT(DISTINCT orders.order_id),
2
) AS average_order_value
FROM orders
JOIN order_items
ON orders.order_id = order_items.order_id
GROUP BY month
ORDER BY month;
