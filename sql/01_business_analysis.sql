-- E-commerce Sales Analysis
-- Business Analysis Queries

-- 1. Total Revenue
SELECT
    SUM(revenue) AS total_revenue
FROM orders;


-- 2. Total Profit
SELECT
    SUM(profit) AS total_profit
FROM orders;


-- 3. Overall Profit Margin
SELECT
    ROUND(SUM(profit) / SUM(revenue) * 100, 2) AS profit_margin
FROM orders;


-- 4. Total Orders
SELECT
    COUNT(*) AS total_orders
FROM orders;


-- 5. Average Order Value
SELECT
    ROUND(AVG(revenue), 2) AS average_order_value
FROM orders;


-- 6. Revenue and Profit by Product Category
SELECT
    product_category,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(*) AS total_orders,
    ROUND(SUM(profit) / SUM(revenue) * 100, 2) AS profit_margin
FROM orders
GROUP BY product_category
ORDER BY total_revenue DESC;


-- 7. Revenue and Profit by Region
SELECT
    region,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(*) AS total_orders,
    ROUND(SUM(profit) / SUM(revenue) * 100, 2) AS profit_margin
FROM orders
GROUP BY region
ORDER BY total_revenue DESC;


-- 8. Top Products by Profit
SELECT
    product_name,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(*) AS total_orders
FROM orders
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;


-- 9. Products with Negative Profit
SELECT
    product_name,
    COUNT(*) AS loss_orders,
    ROUND(SUM(profit), 2) AS total_loss
FROM orders
WHERE profit < 0
GROUP BY product_name
ORDER BY total_loss ASC;


-- 10. Profitability by Order Status
SELECT
    CASE
        WHEN profit < 0 THEN 'Loss'
        ELSE 'Profitable'
    END AS order_status,
    COUNT(*) AS orders,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_percent,
    ROUND(AVG(profit), 2) AS avg_profit
FROM orders
GROUP BY order_status;