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