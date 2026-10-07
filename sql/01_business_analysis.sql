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


-- ============================================================
-- ADVANCED BUSINESS ANALYSIS
-- ============================================================


-- 11. Monthly Revenue Growth (Month-over-Month)
-- Uses a CTE and LAG() to compare each month with the previous month.

WITH monthly_sales AS (
    SELECT
        strftime('%Y-%m', order_date) AS month,
        SUM(revenue) AS revenue,
        SUM(profit) AS profit
    FROM orders
    GROUP BY strftime('%Y-%m', order_date)
),
monthly_comparison AS (
    SELECT
        month,
        revenue,
        profit,
        LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue
    FROM monthly_sales
)
SELECT
    month,
    ROUND(revenue, 2) AS revenue,
    ROUND(profit, 2) AS profit,
    ROUND(previous_month_revenue, 2) AS previous_month_revenue,
    ROUND(
        (revenue - previous_month_revenue)
        / previous_month_revenue * 100,
        2
    ) AS revenue_growth_percent
FROM monthly_comparison
ORDER BY month;


-- 12. Product Ranking Within Each Category
-- Ranks products by revenue inside their own category.

WITH product_performance AS (
    SELECT
        product_category,
        product_name,
        SUM(revenue) AS revenue,
        SUM(profit) AS profit,
        COUNT(*) AS total_orders
    FROM orders
    GROUP BY product_category, product_name
)
SELECT
    product_category,
    product_name,
    ROUND(revenue, 2) AS revenue,
    ROUND(profit, 2) AS profit,
    total_orders,
    RANK() OVER (
        PARTITION BY product_category
        ORDER BY revenue DESC
    ) AS revenue_rank
FROM product_performance
ORDER BY product_category, revenue_rank;


-- 13. Category Revenue Contribution
-- Calculates each category's percentage contribution to total revenue.

WITH category_sales AS (
    SELECT
        product_category,
        SUM(revenue) AS category_revenue,
        SUM(profit) AS category_profit
    FROM orders
    GROUP BY product_category
)
SELECT
    product_category,
    ROUND(category_revenue, 2) AS revenue,
    ROUND(category_profit, 2) AS profit,
    ROUND(
        category_revenue
        / SUM(category_revenue) OVER () * 100,
        2
    ) AS revenue_share_percent
FROM category_sales
ORDER BY category_revenue DESC;


-- 14. Discount Bands and Profitability
-- Evaluates how profitability changes across discount levels.

WITH discount_analysis AS (
    SELECT
        CASE
            WHEN discount = 0 THEN 'No Discount'
            WHEN discount <= 0.05 THEN '0-5%'
            WHEN discount <= 0.10 THEN '5-10%'
            WHEN discount <= 0.15 THEN '10-15%'
            ELSE '15%+'
        END AS discount_band,
        revenue,
        profit
    FROM orders
)
SELECT
    discount_band,
    COUNT(*) AS total_orders,
    ROUND(AVG(profit), 2) AS avg_profit,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS loss_order_rate_percent
FROM discount_analysis
GROUP BY discount_band
ORDER BY
    CASE discount_band
        WHEN 'No Discount' THEN 1
        WHEN '0-5%' THEN 2
        WHEN '5-10%' THEN 3
        WHEN '10-15%' THEN 4
        ELSE 5
    END;


-- 15. Customer Revenue Ranking
-- Identifies the highest-value customers based on total revenue.

WITH customer_performance AS (
    SELECT
        customer_id,
        COUNT(*) AS total_orders,
        SUM(revenue) AS total_revenue,
        SUM(profit) AS total_profit
    FROM orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_orders,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(total_profit, 2) AS total_profit,
    RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS revenue_rank
FROM customer_performance
ORDER BY revenue_rank
LIMIT 20;


-- 16. Monthly Profit Margin Trend
-- Tracks whether profitability improves or deteriorates over time.

WITH monthly_profitability AS (
    SELECT
        strftime('%Y-%m', order_date) AS month,
        SUM(revenue) AS revenue,
        SUM(profit) AS profit
    FROM orders
    GROUP BY strftime('%Y-%m', order_date)
)
SELECT
    month,
    ROUND(revenue, 2) AS revenue,
    ROUND(profit, 2) AS profit,
    ROUND(profit / revenue * 100, 2) AS profit_margin_percent,
    ROUND(
        LAG(profit / revenue * 100)
        OVER (ORDER BY month),
        2
    ) AS previous_month_margin
FROM monthly_profitability
ORDER BY month;