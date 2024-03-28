SELECT *
FROM menu_items;

/* Num of items on the menu */
SELECT COUNT(DISTINCT item_name)
FROM menu_items; -- 32

/* Least and most expensive items on the menu */
SELECT item_name, price
FROM menu_items
ORDER BY  price
LIMIT 1; -- Edamame 5.00

SELECT item_name, price
FROM menu_items
ORDER BY  price DESC
LIMIT 1; -- Shrimp Scampi 19.95

/* How many italian dishes are on the menu */
SELECT COUNT(DISTINCT item_name)
FROM menu_items
WHERE Category = 'Italian'; -- 9 dishes

/* Least and most expensive italian dishes on the menu */
SELECT item_name, price
FROM menu_items
WHERE Category = 'Italian'
ORDER BY price
LIMIT 1; -- Spaghetti 14.50

SELECT item_name, price
FROM menu_items
WHERE Category = 'Italian'
ORDER BY price DESC
LIMIT 1; -- Shrimp Scampi 19.95

/* How many dishes are in each category and average price within each category */
SELECT category, avg(price) AS avg_price, COUNT(DISTINCT item_name) AS num_of_dishes
FROM menu_items
GROUP BY category;