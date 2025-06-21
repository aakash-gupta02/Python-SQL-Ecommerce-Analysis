# 1. List all unique cities where customers are located.

SELECT DISTINCT
    customer_city
FROM
    customers;

# 2. Count the number of orders placed in 2017.

SELECT count( orders.order_id ) from orders WHERE year( order_purchase_timestamp ) = 2017;

# 3. Find the total sales per category.

SELECT 
    products.product_category category,
    round(SUM(order_items.price + order_items.freight_value),2) as Total_Sales
FROM
    products
        JOIN
    order_items ON products.product_id = order_items.product_id
GROUP BY category
ORDER BY Total_Sales DESC
;


# 4. Calculate the percentage of orders that were paid in installments.

SELECT 
    SUM(CASE
        WHEN payment_installments >= 1 THEN 1
        ELSE 0
    END) / COUNT(payment_installments) * 100 as Percent
FROM
    payments;

# 5. Count the number of customers from each state. 

SELECT customers.customer_state as State , count(customers.customer_id) FROM customers
GROUP BY State;







