USE blinkit_analysis;

-- =========================================
-- BLINKIT SALES ANALYSIS PROJECT
-- Section 1: Sales Performance
-- =========================================

-- Q1. Total orders, revenue, and average order value

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(order_total), 2) AS total_revenue,
    ROUND(AVG(order_total), 2) AS average_order_value
FROM blinkit_orders;

-- Q2. Monthly revenue by year

SELECT
    YEAR(STR_TO_DATE(order_date, '%Y-%m-%d %H:%i:%s')) AS order_year,
    MONTH(STR_TO_DATE(order_date, '%Y-%m-%d %H:%i:%s')) AS order_month,
    ROUND(SUM(order_total), 2) AS monthly_revenue
FROM blinkit_orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- Q3. Revenue by payment method

SELECT
    payment_method,
    ROUND(SUM(order_total), 2) AS revenue
FROM blinkit_orders
GROUP BY payment_method
ORDER BY revenue DESC;

-- Q4. Average order value by payment method

SELECT
    payment_method,
    ROUND(AVG(order_total), 2) AS average_order_value
FROM blinkit_orders
GROUP BY payment_method
ORDER BY average_order_value DESC;

-- Q5. Orders by delivery status

SELECT
    delivery_status,
    COUNT(order_id) AS total_orders,
    ROUND(
        COUNT(order_id) * 100.0 /
        (SELECT COUNT(order_id) FROM blinkit_orders),
        2
    ) AS order_percentage
FROM blinkit_orders
GROUP BY delivery_status
ORDER BY total_orders DESC;

-- =========================================
-- SECTION 2: CUSTOMER ANALYTICS
-- =========================================

-- Q6. Top 10 customers by total spending

SELECT
    customer_id,
    ROUND(SUM(order_total), 2) AS total_spending,
    COUNT(order_id) AS total_orders
FROM blinkit_orders
GROUP BY customer_id
ORDER BY total_spending DESC
LIMIT 10;

-- Q7. Number of orders per customer

SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM blinkit_orders
GROUP BY customer_id
ORDER BY total_orders DESC;

-- Q8. Customers who placed more than 5 orders

SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(order_total), 2) AS total_spending
FROM blinkit_orders
GROUP BY customer_id
HAVING COUNT(order_id) > 5
ORDER BY total_orders DESC;

-- Q9. Customer spending segments

SELECT
    customer_id,
    ROUND(SUM(order_total), 2) AS total_spending,
    CASE
        WHEN SUM(order_total) > 10000 THEN 'High Value'
        WHEN SUM(order_total) >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM blinkit_orders
GROUP BY customer_id
ORDER BY total_spending DESC;


-- =========================================
-- SECTION 3: PRODUCT ANALYTICS
-- =========================================

-- Q10. Top 10 products by quantity sold

SELECT
    p.product_id,
    SUM(oi.quantity) AS total_quantity_sold
FROM blinkit_products p
JOIN blinkit_order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- Q11. Top 10 products by revenue

SELECT
    p.product_id,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM blinkit_products p
JOIN blinkit_order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Q12. Revenue by product category

SELECT
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM blinkit_products p
JOIN blinkit_order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Q13. Products that have never been ordered

SELECT
    p.product_id
FROM blinkit_products p
LEFT JOIN blinkit_order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;


-- =========================================
-- SECTION 4: DELIVERY ANALYTICS
-- =========================================

-- Q14. Orders by delivery status

SELECT
    delivery_status,
    COUNT(order_id) AS total_orders
FROM blinkit_orders
GROUP BY delivery_status
ORDER BY total_orders DESC;

-- Q15. Average delivery delay in minutes by status

SELECT
    delivery_status,
    ROUND(
        AVG(
            TIMESTAMPDIFF(
                MINUTE,
                STR_TO_DATE(
                    promised_delivery_time,
                    '%Y-%m-%d %H:%i:%s'
                ),
                STR_TO_DATE(
                    actual_delivery_time,
                    '%Y-%m-%d %H:%i:%s'
                )
            )
        ), 2
    ) AS avg_delay_minutes
FROM blinkit_orders
GROUP BY delivery_status
ORDER BY avg_delay_minutes DESC;

-- Q16. Overall late-delivery percentage

SELECT
    ROUND(
        SUM(
            CASE
                WHEN STR_TO_DATE(
                    actual_delivery_time,
                    '%Y-%m-%d %H:%i:%s'
                ) > STR_TO_DATE(
                    promised_delivery_time,
                    '%Y-%m-%d %H:%i:%s'
                )
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS late_delivery_percentage
FROM blinkit_orders;

-- Q17. Average order value by delivery status

SELECT
    delivery_status,
    ROUND(AVG(order_total), 2) AS average_order_value
FROM blinkit_orders
GROUP BY delivery_status
ORDER BY average_order_value DESC;


