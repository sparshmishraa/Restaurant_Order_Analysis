/* Combining menu and orders table into single table using full outer join */
CREATE TABLE menu_order_combined
SELECT *
FROM menu_items AS m
JOIN order_details AS o
ON m.menu_item_id = o.item_id;

/* Least and most ordered items in a table and in which category they belong to */
SELECT category, item_name, COUNT(item_name) as num_of_orders
FROM menu_order_combined
GROUP BY category, item_name
ORDER BY num_of_orders
LIMIT 1; -- Mexican Chicken Tacos 123

SELECT category, item_name, COUNT(item_name) as num_of_orders
FROM menu_order_combined
GROUP BY category, item_name
ORDER BY num_of_orders DESC
LIMIT 1; -- American Hamburger 622

/* Top 5 orders that spent the most money */
SELECT order_id, (COUNT(order_id)* AVG(price)) AS amt_spent
FROM menu_order_combined
GROUP BY order_id
ORDER BY amt_spent DESC
LIMIT 5;

/* Details of top 5 highest spent orders */
SELECT *
FROM menu_order_combined
WHERE order_id IN (440, 2075, 1957, 330, 2675);
