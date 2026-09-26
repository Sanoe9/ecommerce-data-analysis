-- Number of unique products
SELECT COUNT(DISTINCT product_id) AS unique_products
FROM order_items;


-- Number of orders containing each product
SELECT 
    product_id,
    COUNT(DISTINCT order_id) AS order_count
FROM order_items
GROUP BY product_id
ORDER BY order_count DESC;


-- Number of items sold by product
SELECT
    product_id,
    COUNT(*) AS items_sold
FROM order_items
GROUP BY product_id
ORDER BY items_sold DESC
LIMIT 10;


-- Top 10 most frequently ordered products
SELECT 
    product_id,
    COUNT(DISTINCT order_id) AS order_count
FROM order_items
GROUP BY product_id
ORDER BY order_count DESC
LIMIT 10;


-- Total quantity sold by product
SELECT  
    product_id,
    SUM(order_item_id) AS total_quantity
FROM order_items
GROUP BY product_id
ORDER BY total_quantity DESC;


-- Total revenue by product
SELECT
    product_id,
    SUM(price) AS total_revenue
FROM order_items
GROUP BY product_id
ORDER BY total_revenue DESC;

-- Top 10 products by revenue
SELECT 
    product_id,
    SUM(price) AS total_revenue
FROM order_items
GROUP BY order_items
ORDER BY total_revenue DESC
LIMIT 10;