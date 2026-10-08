/* Revenue Analysis
Business questions: total revenue, monthly revenue, AOV, category/product contribution.

Practice: aggregations, JOINs, GROUP BY, CASE, date functions.
*/

-- Q1. Total revenue generated from completed orders
SELECT
    SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'Completed';


-- Q2. Monthly revenue from completed orders
SELECT
    FORMAT(order_date, 'MMM/yyyy') AS [Month-Year],
    SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'Completed'
GROUP BY FORMAT(order_date, 'MMM/yyyy');


-- Q3. Revenue by product, highest revenue first
SELECT
    p.product_name,
    SUM(o.total_amount) AS total_revenue
FROM products p
INNER JOIN orders o
    ON p.product_id = o.product_id
WHERE o.status = 'Completed'
GROUP BY p.product_name
ORDER BY total_revenue DESC;


-- TODO: Calculate average order value.

-- TODO: Calculate revenue by category.
