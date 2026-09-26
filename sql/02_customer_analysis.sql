-- ============================================================
-- E-Commerce Data Analysis
-- 02 - Customer Analysis
-- ============================================================
-- Purpose:
-- Analyze the customer base, order frequency, and repeat
-- purchasing behavior.
-- ============================================================

-- 1. Total number of customers
-- Business question:
-- How many unique customers are in the dataset?

SELECT
COUNT(DISTINCT customer_id) AS total_customers
FROM customers;

-- 2. Average number of orders per customer
-- Business question:
-- How frequently does the average customer place an order?

SELECT
ROUND(
COUNT(*) * 1.0 / COUNT(DISTINCT customer_id),
2
) AS average_orders_per_customer
FROM orders;

-- 3. Customers with 3 or more orders
-- Business question:
-- How many customers are frequent repeat purchasers?

SELECT
COUNT(*) AS customers_with_3_or_more_orders
FROM (
SELECT
customer_id,
COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) >= 3
);

-- 4. Top customers by number of orders
-- Business question:
-- Which customers have placed the most orders?

SELECT
customer_id,
COUNT(*) AS number_of_orders
FROM orders
GROUP BY customer_id
ORDER BY number_of_orders DESC
LIMIT 10;

-- 5. Customer order frequency distribution
-- Business question:
-- How many customers placed 1, 2, 3, etc. orders?

SELECT
order_count,
COUNT(*) AS number_of_customers
FROM (
SELECT
customer_id,
COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
)
GROUP BY order_count
ORDER BY order_count;

-- 6. Customers and their total spending
-- Business question:
-- Which customers generated the most revenue?

SELECT
orders.customer_id,
ROUND(SUM(order_items.price), 2) AS total_spent
FROM orders
JOIN order_items
ON orders.order_id = order_items.order_id
GROUP BY orders.customer_id
ORDER BY total_spent DESC
LIMIT 10;
