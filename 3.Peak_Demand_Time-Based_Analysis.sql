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
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- ======================================================================================================================================================================