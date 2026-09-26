-- ============================================================
-- E-Commerce Data Analysis
-- 01 - Order Analysis
-- ============================================================
-- Purpose:
-- Analyze overall order volume, order status, cancellations,
-- yearly trends, monthly trends, and monthly revenue.
-- ============================================================

-- 1. Total number of orders
-- Business question:
-- How many orders were placed?

SELECT
COUNT(*) AS total_orders
FROM orders;

-- 2. Orders by status
-- Business question:
-- What is the distribution of orders across different statuses?

SELECT
order_status,
COUNT(*) AS number_of_orders
FROM orders
GROUP BY order_status
ORDER BY number_of_orders DESC;

-- 3. Cancellation rate
-- Business question:
-- What percentage of orders were canceled?

SELECT
COUNT(*) AS total_orders,
SUM(
CASE
WHEN order_status = 'canceled' THEN 1
ELSE 0
END
) AS canceled_orders,
ROUND(
100.0 * SUM(
CASE
WHEN order_status = 'canceled' THEN 1
ELSE 0
END
) / COUNT(*),
2
) AS cancellation_rate
FROM orders;

-- 4. Orders by year
-- Business question:
-- How does order volume change from year to year?

SELECT
strftime('%Y', order_purchase_timestamp) AS year,
COUNT(*) AS number_of_orders
FROM orders
GROUP BY year
ORDER BY year;

-- 5. Monthly order volume
-- Business question:
-- Which months have the highest order volume?

SELECT
strftime('%Y-%m', order_purchase_timestamp) AS month,
COUNT(*) AS number_of_orders
FROM orders
GROUP BY month
ORDER BY month;

-- 6. Monthly revenue
-- Business question:
-- How does revenue change over time?

SELECT
strftime('%Y-%m', orders.order_purchase_timestamp) AS month,
ROUND(SUM(order_items.price), 2) AS revenue
FROM orders
JOIN order_items
ON orders.order_id = order_items.order_id
GROUP BY month
ORDER BY month;
