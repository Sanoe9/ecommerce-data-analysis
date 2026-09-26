-- Total revenue
SELECT 
    SUM(price) AS total_revenue
FROM order_items;

-- Average order value
SELECT
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        order_id,
        SUM(price) AS order_total
    FROM order_items
    GROUP BY order_id
);

-- Min and max order value
SELECT 
    MIN(order_total) AS minimum_order_value,
    MAX(order_total) AS maximum_order_value
FROM (
    SELECT
        order_id,
        SUM(price) AS order_total
    FROM order_items
    GROUP BY order_id
);

-- Top 10 highest value orders
SELECT
    order_id,
    SUM(price) AS order_total
FROM order_items
GROUP BY order_id
ORDER BY order_total DESC
LIMIT 10;

-- Revenue by month
SELECT 
    strftime('%Y-%m', o.order_purchase_timestamp) AS month,
    SUM(oi.price) AS monthly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- Number of orders by month
SELECT 
    strftime('%Y-%m', order_purchase_timestamp) AS month,
    COUNT(*) AS order_count
FROM orders
GROUP BY month
ORDER BY month;

-- Highest value order
SELECT 
    MAX(order_total) AS highest_order_value
FROM (
    SELECT 
        order_id,
        SUM(price) AS order_total
    FROM order_items
    GROUP BY order_id
);

-- Monthly average order value
SELECT 
    month,
    AVG(order_total) AS average_order_value
FROM (
    SELECT 
        strftime('%Y-%m', o.order_purchase_timestamp) AS month,
        o.order_id,
        SUM(oi.price) AS order_total
    FROM orders
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY month, o.order_id
)
GROUP BY month
ORDER BY month;