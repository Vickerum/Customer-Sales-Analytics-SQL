/* Customer Analysis
Business questions: high-value, inactive, one-time and repeat customers.

Practice: LEFT JOIN, GROUP BY, HAVING, CASE, subqueries/CTEs.
*/

-- Q4. Top 5 customers by completed-order revenue
SELECT TOP 5
    c.customer_id,
    c.customer_name,
    SUM(o.total_amount) AS total_revenue
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC;


-- Q5. Customers with no orders
SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;


-- Q6. Customers with more than 1 completed order
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.customer_id) AS order_count
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.customer_id) > 1;


-- TODO: Classify customers as one-time or repeat buyers.
