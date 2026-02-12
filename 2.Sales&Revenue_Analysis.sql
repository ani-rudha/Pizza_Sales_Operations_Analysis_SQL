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
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- ======================================================================================================================================================================