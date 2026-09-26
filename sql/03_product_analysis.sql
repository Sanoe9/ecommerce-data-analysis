-- ============================================================
-- E-Commerce Data Analysis
-- 03 - Product Analysis
-- ============================================================
-- Purpose:
-- Analyze product categories, order-item volume, and product
-- sales performance.
-- ============================================================

-- 1. Total number of products
-- Business question:
-- How many products are listed in the dataset?

SELECT
COUNT(*) AS total_products
FROM products;

-- 2. Number of order items
-- Business question:
-- How many individual product items were purchased?

SELECT
COUNT(*) AS total_order_items
FROM order_items;

-- 3. Order items by product category
-- Business question:
-- Which product categories have the highest order volume?

SELECT
products.product_category_name,
COUNT(*) AS number_of_order_items
FROM order_items
JOIN products
ON order_items.product_id = products.product_id
GROUP BY products.product_category_name
ORDER BY number_of_order_items DESC
LIMIT 10;

-- 4. Revenue by product category
-- Business question:
-- Which product categories generate the most revenue?

SELECT
products.product_category_name,
ROUND(SUM(order_items.price), 2) AS revenue
FROM order_items
JOIN products
ON order_items.product_id = products.product_id
GROUP BY products.product_category_name
ORDER BY revenue DESC
LIMIT 10;

-- 5. Average product price by category
-- Business question:
-- Which product categories have the highest average selling price?

SELECT
products.product_category_name,
ROUND(AVG(order_items.price), 2) AS average_price
FROM order_items
JOIN products
ON order_items.product_id = products.product_id
GROUP BY products.product_category_name
ORDER BY average_price DESC
LIMIT 10;

-- 6. Top products by number of items sold
-- Business question:
-- Which individual products have the highest sales volume?

SELECT
product_id,
COUNT(*) AS number_of_items_sold
FROM order_items
GROUP BY product_id
ORDER BY number_of_items_sold DESC
LIMIT 10;

-- 7. Top products by revenue
-- Business question:
-- Which individual products generate the most revenue?

SELECT
product_id,
ROUND(SUM(price), 2) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;
