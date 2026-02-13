-- ======================================================================================================================================================================
--                                                    -: Step 5. Advanced Sales Analysis :-
-- ======================================================================================================================================================================
-- 5.1 Is a small % of pizzas driving most of the revenue?
SELECT 
    p.pizza_name,
    SUM(od.quantity) AS unites_ordered ,
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

-- Yes, some pizzas make significantly higher revenue in lower units sold.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- 5.2 Are our most profitable pizzas also slowing down operations?
SELECT 
    p.pizza_name,
    ROUND(SUM(od.quantity * p.price_usd), 2) AS revenue_usd,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE,
                op.prep_start_time,
                op.prep_end_time)),
            2) AS avg_prep_time_minutes
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
        JOIN
    operations op ON o.order_id = op.order_id
WHERE
    o.order_status IN ('Completed' , 'Processing')
GROUP BY p.pizza_name
ORDER BY avg_prep_time_minutes DESC;

-- Yes, some of our profitable pizzas are actually slowing down operations.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5.3 How much revenue is currently stuck in Processing orders?
SELECT 
    o.order_status,
    ROUND(SUM(od.quantity * p.price_usd), 2) AS revenue_usd
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON od.order_id = o.order_id
WHERE
    o.order_status IN ('Processing')
GROUP BY o.order_status;

-- Almost $2170 is still stuck in the Processing phase, right now.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5.4 Do our highest revenue hours also have the slowest prep times?
SELECT 
    HOUR(o.order_time) AS order_hour,
    ROUND(SUM(od.quantity * p.price_usd), 2) AS revenue_usd,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE,
                op.prep_start_time,
                op.prep_end_time)),
            2) AS avg_prep_time_minutes
FROM
    orders o
        JOIN
    order_details od ON o.order_id = od.order_id
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    operations op ON o.order_id = op.order_id
WHERE
    o.order_status IN ('Completed' , 'Processing')
GROUP BY order_hour
ORDER BY revenue_usd DESC;

-- Not actually, but around 12-13 hours it took a little more time to prepare.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ======================================================================================================================================================================
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- ======================================================================================================================================================================