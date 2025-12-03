-- 1. Total Revenue
SELECT SUM(total_amount) AS total_revenue
FROM sales;

-- 2. Monthly Revenue Trend
SELECT 
    strftime('%Y-%m', order_date) AS order_month,
    SUM(total_amount) AS monthly_revenue
FROM sales
GROUP BY order_month
ORDER BY order_month;

-- 3. Top 10 Best-Selling Products
SELECT 
    product_name,
    SUM(total_amount) AS revenue
FROM sales
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;

-- 4. Revenue by Category
SELECT 
    category,
    SUM(total_amount) AS category_revenue
FROM sales
GROUP BY category
ORDER BY category_revenue DESC;

-- 5. Customer Lifetime Value (simple)
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_spend,
    AVG(total_amount) AS avg_order_value
FROM sales
GROUP BY customer_id
ORDER BY total_spend DESC;

-- 6. Returning vs New Customers
SELECT 
    customer_id,
    MIN(order_date) AS first_purchase,
    CASE 
        WHEN COUNT(order_id) > 1 THEN 'Returning'
        ELSE 'New'
    END AS customer_type
FROM sales
GROUP BY customer_id;

-- 7. RFM Base Table
SELECT
    customer_id,
    MAX(order_date) AS last_order,
    COUNT(order_id) AS frequency,
    SUM(total_amount) AS monetary
FROM sales
GROUP BY customer_id;

-- 8. Weekday Sales Pattern
SELECT 
    strftime('%w', order_date) AS weekday,
    SUM(total_amount) AS revenue
FROM sales
GROUP BY weekday
ORDER BY weekday;

-- 9. Orders with Pricing Mismatch (useful for checks)
SELECT *
FROM sales
WHERE ABS(total_amount - calculated_total) > 1;

-- 10. Category Profitability (if cost column exists)
SELECT 
    category,
    SUM(total_amount - cost) AS profit
FROM sales
GROUP BY category
ORDER BY profit DESC;

-- 11. Cohort Analysis Base
SELECT
    customer_id,
    MIN(strftime('%Y-%m', order_date)) AS cohort_month,
    strftime('%Y-%m', order_date) AS order_month,
    COUNT(order_id) AS orders
FROM sales
GROUP BY customer_id, order_month;

-- 12. Average Order Value Trend
SELECT 
    strftime('%Y-%m', order_date) AS month,
    AVG(total_amount) AS avg_order_value
FROM sales
GROUP BY month
ORDER BY month;


