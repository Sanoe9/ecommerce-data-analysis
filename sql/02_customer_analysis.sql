-- How many unique cutomers are in the dataset
SELECT 
    COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM customers;


-- How many customer records are in the table
SELECT 
    COUNT(*) AS customer_records
FROM customers;


-- How many unique customer locations are represented
SELECT 
    COUNT(DISTINCT customer_zip_code_prefix) AS unique_zip_prefixes
FROM customers;


-- How many orders did each customer place
SELECT
    customer_unique_id,
    COUNT(DISTINCT o.order_id) AS order_count
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY customer_unique_id
ORDER BY order_count DESC;


-- Which customers placed more than 1 order
SELECT 
    customer_unique_id,
    COUNT(DISTINCT order_id) AS order_count
FROM customers
GROUP BY customer_unique_id
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY order_count DESC;


-- How many repeat customers are there
SELECT 
    COUNT(*) AS repeat_customers
FROM (
    SELECT
        customer_unique_id
    FROM customers
    GROUP BY customer_unique_id
    HAVING COUNT(DISTINCT order_id) > 1
);


-- What percentage of customers are repeat customers
SELECT
    ROUND(
        100.0 * COUNT(*) /
        (SELECT COUNT(DISTINCT customer_unique_id)
        FROM customers),
        2
    ) AS repeat_customers_rate_percent
FROM (
    SELECT
        customer_unique_id
    FROM customers
    GROUP BY customer_unique_id
    HAVING COUNT(DISTINCT order_id) > 1
);


-- What percentage of customers are in each state?
SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS customer_count,
    ROUND(
        100.0 * COUNT(DISTINCT customer_unique_id) / 
        (SELECT COUNT(DISTINCT customer_unique_id)
        FROM customers),
        2
    ) AS percentage_of_customers
FROM customers
GROUP BY customer_state
ORDER BY customer_count DESC;


-- Which customers have placed the most orders
SELECT 
    customer_unique_id,
    COUNT(DISTINCT o.order_id) AS order_count
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(DISTINCT order_id) >= 3
ORDER BY order_count DESC;

-- How many customers placed 3 or more orders
SELECT COUNT(*) AS customers_with_3
FROM (
    SELECT 
        c.customer_unique_id
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
    HAVING COUNT(DISTINCT o.order_id) >= 3
);

-- Average orders per customer
SELECT AVG(order_count) AS average_orders_per_customer
FROM (
    SELECT 
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
);

-- Highest number of orders placed by one customer
SELECT MAX(order_count) AS highest_orders_by_customer
FROM (
    SELECT 
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
);