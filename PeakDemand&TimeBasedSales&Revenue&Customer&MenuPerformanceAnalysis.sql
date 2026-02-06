-- ======================================================================================================================================================================
--                                                -: Step 1. Sales & Revenue Analysis :-
-- ======================================================================================================================================================================
-- 1.1 How much revenue did the pizza business generate?
SELECT 
    ROUND(SUM(od.quantity * p.price_usd), 2) AS total_revenue_usd
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status = 'Completed';

-- Total revenue is close to $1880. 
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1.2 How many orders actually contribute to revenue?
SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT CASE
            WHEN o.order_status = 'Completed' THEN o.order_id
        END) AS revenue_orders
FROM
    orders o;

-- Although the total order is 100; only 31 orders make actual revenue.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1.3 On average, how much does a customer spend per order?
SELECT 
    ROUND(SUM(od.quantity * p.price_usd) / COUNT(DISTINCT o.order_id),
            2) AS avg_order_value_usd
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status = 'Completed';

-- On average, a customer spends $60.36 per order.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1.4 Which pizza categories drive the most revenue?
SELECT 
    p.pizza_category,
    ROUND(SUM(od.quantity * p.price_usd), 2) AS revenue_usd
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status = 'Completed'
GROUP BY p.pizza_category
ORDER BY revenue_usd DESC;

-- 'Classic' pizza category drives most of the revenue, almost $740, but the difference between each category is too high. 
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1.5 Which pizza sizes are most profitable?
SELECT 
    p.pizza_size,
    ROUND(SUM(od.quantity * p.price_usd), 2) AS revenue_usd
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status = 'Completed'
GROUP BY p.pizza_size
ORDER BY revenue_usd DESC;

-- 'L' / Large pizza size drives the most of the revenue; close to $835.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1.6 Which specific pizzas bring in the most money?
SELECT 
    p.pizza_name,
    ROUND(SUM(od.quantity * p.price_usd), 2) AS revenue_usd
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status = 'Completed'
GROUP BY p.pizza_name
ORDER BY revenue_usd DESC
LIMIT 5;

-- 'Pepperoni' is the most famous and makes most of the revenue; almost $299.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1.7 How much potential revenue is lost due to cancellations?
SELECT 
    ROUND(SUM(od.quantity * p.price_usd), 2) AS cancelled_revenue_usd
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status = 'Cancelled';

-- Due to 'Cancelled' orders we lost close to $2670.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ======================================================================================================================================================================
--                                                -: Step 2. Peak Demand & Time-Based Analysis :-
-- ======================================================================================================================================================================
-- 2.1 Which hours experience the highest order volume?
SELECT 
    HOUR(order_time) AS order_hour, COUNT(*) AS total_orders
FROM
    orders
GROUP BY order_hour
ORDER BY order_hour;

-- Most of the orders are made during Lunch, Evening and Dinner hours. Almost 8 orders per hour. 
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2.2 Are peak hours also associated with more processing or cancellations?
SELECT 
    HOUR(order_time) AS order_hour,
    order_status,
    COUNT(*) AS order_count
FROM
    orders
GROUP BY order_hour , order_status
ORDER BY order_hour , order_status;

-- Yes, peak hours are also associated with more processing or cancellations.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2.3 Which days are busiest?
SELECT 
    DAYNAME(order_date) AS day_of_week, COUNT(*) AS total_orders
FROM
    orders
GROUP BY day_of_week
ORDER BY total_orders DESC;

-- Thursday, Monday,Tuesday are the busiest.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2.4 Do weekends outperform weekdays?
SELECT 
    CASE
        WHEN DAYOFWEEK(order_date) IN (1 , 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(*) AS total_orders
FROM
    orders
GROUP BY day_type;

-- No, Weekdays make most orders.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2.5 At what hour + day combinations does demand peak?
SELECT 
    DAYNAME(order_date) AS day_of_week,
    HOUR(order_time) AS order_hour,
    COUNT(*) AS total_orders
FROM
    orders
GROUP BY day_of_week , order_hour
ORDER BY total_orders DESC;

-- On Sunday around 17 hours and Thursday around 22 hours are the busiest, demand is on peak.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2.6 Are peak demand periods aligned with operational data?
SELECT 
    HOUR(o.order_time) AS order_hour,
    COUNT(o.order_id) AS total_orders,
    COUNT(op.order_id) AS orders_with_ops_data
FROM
    orders o
        LEFT JOIN
    operations op ON o.order_id = op.order_id
GROUP BY order_hour
ORDER BY order_hour;

-- Yes, they are aligned but not optimally; need improvement.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ======================================================================================================================================================================
--                                         -: Step 3. Customer Preferences & Menu Performance Analysis :-
-- ======================================================================================================================================================================
-- 3.1 Which pizzas are ordered the most?
SELECT 
    p.pizza_name, SUM(od.quantity) AS total_units_sold
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status = 'Completed'
GROUP BY p.pizza_name
ORDER BY total_units_sold DESC;

-- 'Margherita', 'Pepperoni' and 'Spicy Italian' are the top 3 most sold pizzas.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3.2 Which pizzas generate the most revenue?
SELECT 
    p.pizza_name,
    ROUND(SUM(od.quantity * p.price_usd), 2) AS revenue_usd
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status = 'Completed'
GROUP BY p.pizza_name
ORDER BY revenue_usd DESC;

-- 'Pepperoni', 'Spicy Italian' and 'BBQ Chicken' are the top 3 pizzas to generate the most revenue.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3.3 Which pizza categories are most popular?
SELECT 
    p.pizza_category, SUM(od.quantity) AS total_units_sold
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status = 'Completed'
GROUP BY p.pizza_category
ORDER BY total_units_sold DESC;

-- 'Classic', 'Chicken' and 'Spicy' are the top 3 categories to sell the most.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3.4 Which categories bring in the most money?
SELECT 
    p.pizza_category,
    ROUND(SUM(od.quantity * p.price_usd), 2) AS revenue_usd
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status = 'Completed'
GROUP BY p.pizza_category
ORDER BY revenue_usd DESC;

-- 'Classic', 'Chicken' and 'Spicy' are the top 3 categories to generate most revenue.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3.5 Which pizza sizes do customers prefer?
SELECT 
    p.pizza_size, SUM(od.quantity) AS total_units_sold
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status = 'Completed'
GROUP BY p.pizza_size
ORDER BY total_units_sold DESC;

-- 'L'/'Large', 'M'/'Medium' and 'XL'/'Extra Large' are the top 3 pizza sizes that customers prefer the most.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3.6 Are the most ordered pizzas also the most profitable?
SELECT 
    p.pizza_name,
    SUM(od.quantity) AS units_sold,
    ROUND(SUM(od.quantity * p.price_usd), 2) AS revenue_usd,
    p.price_usd AS single_pizza_price
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status = 'Completed'
GROUP BY p.pizza_name, p.price_usd
ORDER BY units_sold DESC;

-- No; Low-prices are crowd favorites, but High-prices are niche winners.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3.7 Which pizzas sell the least?
SELECT 
    p.pizza_name, SUM(od.quantity) AS total_units_sold
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status = 'Completed'
GROUP BY p.pizza_name
ORDER BY total_units_sold ASC
LIMIT 5;

-- 'Vegan Delight', 'Hawaiian' and 'Veggie Supreme' are the least sold  pizzas, dropped from the menu or changed prices.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ======================================================================================================================================================================
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- ======================================================================================================================================================================