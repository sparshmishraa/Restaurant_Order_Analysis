/* View the order details table */
SELECT *
FROM order_details;

/* what is the date range of the table */
SELECT order_date
FROM order_details
ORDER BY order_date
LIMIT 1; -- 2023-01-01

SELECT order_date
FROM order_details
ORDER BY order_date DESC
LIMIT 1; -- 2023-03-31

/* How many order were made within this date range */
SELECT COUNT(order_id) AS num_of_orders
FROM order_details; -- 12234

/* How many items were ordered within this date range */
SELECT COUNT(item_id) AS num_of_items_ordered
FROM order_details; -- 12097

/* Which order has most num of items */
SELECT order_id, COUNT(item_id) AS num_of_items
FROM order_details
GROUP BY order_id
ORDER BY num_of_items DESC; -- order_id-4305 items-14

/* How many orders had more than 12 items */
SELECT order_id, COUNT(item_id) AS num_of_items
FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) > 12;