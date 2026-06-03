use ecommerce;
-- 1️.Total Revenue
select * from olist_order_items_dataset;
select sum(price) as total_revenue 
from olist_order_items_dataset;

-- 2. total orders
select * from olist_orders_dataset;

select count(distinct order_id) as total_orders
from olist_orders_dataset;

-- 3.Average order value
select sum(oi.price)/count(distinct o.order_id) as avg_order_value
from olist_orders_dataset o
join olist_order_items_dataset oi
on o.order_id=oi.order_id;

-- 4.Total customers
select count(distinct customer_id ) from olist_customers_dataset;

-- 5. Monthly Revenue Trend
select
    DATE_FORMAT(STR_TO_DATE(order_purchase_timestamp,'%Y-%m-%d %H:%i:%s'),'%Y-%m') AS month,
    SUM(oi.price) AS revenue
from olist_orders_dataset o
join olist_order_items_dataset oi
on o.order_id = oi.order_id
group by month
order by month;

-- 6.Top 10 Customers by Revenue
SELECT 
    c.customer_id,
    SUM(oi.price) AS total_spent
FROM  olist_customers_dataset c
JOIN olist_orders_dataset o ON c.customer_id = o.customer_id
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- 7.Reapeat Customers
SELECT 
    customer_id,
    COUNT(order_id) AS order_count
FROM olist_orders_dataset
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- 8.Revenue Ranking
SELECT 
    c.customer_id,
    SUM(oi.price) AS total_spent,
    RANK() OVER (ORDER BY SUM(oi.price) DESC) AS revenue_rank
FROM olist_customers_dataset c
JOIN olist_orders_dataset o ON c.customer_id = o.customer_id
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
GROUP BY c.customer_id;

