# Advanced Queries
# 2. Calculate the cumulative sales per month for each year.

SELECT year(orders.order_purchase_timestamp) as Years, month(orders.order_purchase_timestamp) as Month , round(sum(order_items.price),2) as Revenue ,
sum(round(sum(order_items.price)) ) OVER( order BY year(orders.order_purchase_timestamp), month(orders.order_purchase_timestamp) ) as Cumu
FROM orders JOIN order_items
on orders.order_id = order_items.order_id 
GROUP BY Month ,Years
ORDER BY Years,Month 
;




# 3. Calculate the year-over-year growth rate of total sales.

SELECT year(orders.order_purchase_timestamp) as Years , round(sum(order_items.price),2) as Revenue ,
sum(round(sum(order_items.price)) ) OVER( order BY year(orders.order_purchase_timestamp) ) as Cumu
FROM orders JOIN order_items
on orders.order_id = order_items.order_id 
GROUP BY Years
ORDER BY Years
;

# 5. Identify the top 3 customers who spent the most money in each year. 


SELECT orders.customer_id AS customer , round(sum( order_items.price ),2) AS money_spent
FROM orders JOIN order_items
on orders.order_id = order_items.order_id
GROUP BY customer 
ORDER BY money_spent DESC
LIMIT 3
;














