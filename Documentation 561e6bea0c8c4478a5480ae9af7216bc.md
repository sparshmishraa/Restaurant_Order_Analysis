# Documentation

![](https://images.unsplash.com/photo-1550966871-3ed3cdb5ed0c?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb)

## Scenario

**I have been hired as a Data Analyst for the Taste of the World Cafe, a restaurant that has diverse menu offering and serves generous portions.**

**The Taste of the World Cafe** debuted a new menu at the start of the year.

**You’ve been asked to dig into customer data to see which menu items are doing well / not well and what the top customers seem to like best.**

## About the Data

A quarter's worth of orders from a fictitious restaurant serving international cuisine, including the date and time of each order, the items ordered, and additional details on the type, name and price of the items.

Data consists of 2 tables namely orders(orders table) and menu (items table) with 12266 records and 8 fields in aggregate.

## Key Tasks

- **Explore the `menu_items` table** to gain insights into the new menu offerings.
- **Analyze the `order_details` table** to understand the data collected on customer orders.
- **Leverage both tables** to assess customer responses to the new menu and identify trends in ordering behavior.

## Steps Taken

### The first objective is to gain a better understanding of the `menu_items` table by determining the total number of items, identifying the least and most expensive items, and analyzing item prices within each category.

**Steps Taken:**

- Wrote a query to find the total number of items available on the menu.
- Identified the least and most expensive items to understand the price range.
- Examined item prices within each category to compare pricing variations across different menu sections.

```sql
SELECT *
FROM menu_items;

/* Num of items on the menu */
SELECT COUNT(DISTINCT item_name)
FROM menu_items; -- 32
```

![Screenshot (45686).png](Screenshot_(45686).png)

![Screenshot (45687).png](820cfeda-9ce2-47c8-b430-319dc5cd61e2.png)

**What are the least and most expensive items on the menu?**

```sql
/* Least and most expensive items on the menu */
SELECT item_name, price
FROM menu_items
ORDER BY  price
LIMIT 1;

SELECT item_name, price
FROM menu_items
ORDER BY  price DESC
LIMIT 1;
```

![Screenshot (45688).png](Screenshot_(45688).png)

![Screenshot (45690).png](Screenshot_(45690).png)

To determine the least and most expensive items on the menu, I used two separate queries that sort the data based on price.

1. **Finding the Least Expensive Item:**
    - The query selects `item_name` and `price` from the `menu_items` table.
    
    - It orders the results in **ascending order** using `ORDER BY price`, ensuring that the lowest-priced item appears first.
    - The `LIMIT 1` clause retrieves only the top result, which represents the least expensive menu item.
2. **Finding the Most Expensive Item:**
    - Similarly, this query selects `item_name` and `price` from the `menu_items` table.
    - The results are ordered in **descending order** using `ORDER BY price DESC`, placing the highest-priced item at the top.
    - The `LIMIT 1` clause ensures that only the most expensive item is displayed.

These queries provide a quick way to identify the price range of the menu, helping to understand the most budget-friendly and premium offerings.

**How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?**

```sql
/* How many italian dishes are on the menu */
SELECT COUNT(DISTINCT item_name)
FROM menu_items
WHERE Category = 'Italian';

/* Least and most expensive italian dishes on the menu */
SELECT item_name, price
FROM menu_items
WHERE Category = 'Italian'
ORDER BY price
LIMIT 1;

SELECT item_name, price
FROM menu_items
WHERE Category = 'Italian'
ORDER BY price DESC
LIMIT 1;
```

![Screenshot (45691).png](Screenshot_(45691).png)

![Screenshot (45692).png](Screenshot_(45692).png)

![Screenshot (45693).png](Screenshot_(45693).png)

To analyze the Italian dishes on the menu, I ran three SQL queries to determine the total number of unique Italian dishes, as well as the least and most expensive ones.

1. **Finding the Number of Italian Dishes:**
    - Used `COUNT(DISTINCT item_name)` to count unique Italian dishes.
    - Applied `WHERE Category = 'Italian'` to filter only Italian cuisine.
2. **Finding the Least Expensive Italian Dish:**
    - Selected `item_name` and `price` from the `menu_items` table.
    - Used `WHERE Category = 'Italian'` to consider only Italian dishes.
    - Sorted results in **ascending order** with `ORDER BY price` and applied `LIMIT 1` to get the least expensive dish.
3. **Finding the Most Expensive Italian Dish:**
    - Selected `item_name` and `price` from the `menu_items` table.
    - Applied `WHERE Category = 'Italian'` to focus on Italian cuisine.
    - Sorted results in **descending order** using `ORDER BY price DESC` and used `LIMIT 1` to retrieve the most expensive dish.

These queries provide insights into the variety and price range of Italian dishes on the menu.

**How many dishes are in each category? What is average dish price within each category?**

```sql
/* How many dishes are in each category and average price within each category */
SELECT category, avg(price) AS avg_price, COUNT(DISTINCT item_name) AS num_of_dishes
FROM menu_items
GROUP BY category;
```

![Screenshot (45694).png](Screenshot_(45694).png)

To analyze the number of dishes and the average price within each category, I used the following SQL query:

1. **Selecting Relevant Columns:**
    - Retrieved `category` to group the data accordingly.
    - Used the `AVG(price)` function and assigned an alias (`AS avg_price`) to calculate the average price within each category.
    - Applied `COUNT(DISTINCT item_name)` and assigned an alias (`AS num_of_dishes`) to count the unique dishes in each category.
2. **Grouping the Data:**
    - Used `GROUP BY category` to ensure the calculations are performed for each unique category.

This query helps in understanding the distribution of menu items across different categories and provides insights into the average pricing within each category.

### **Second objective is to better understand the orders table by finding the date range, the number of items within each order, and the orders with the highest number of items.**

```sql
/* View the order details table */
SELECT *
FROM order_details;
```

![Screenshot (45695).png](Screenshot_(45695).png)

I wrote a query to find out:

What is the date range of the table?

```sql
/* what is the date range of the table */
SELECT order_date
FROM order_details
ORDER BY order_date
LIMIT 1;

SELECT order_date
FROM order_details
ORDER BY order_date DESC
LIMIT 1;
```

![Screenshot (45697).png](Screenshot_(45697).png)

![Screenshot (45698).png](Screenshot_(45698).png)

To determine the **date range** of the `order_details` table, I used two queries to find the earliest and latest order dates.

1. **Finding the Earliest Order Date:**
    - Selected `order_date` from `order_details`.
    - Used `ORDER BY order_date` in **ascending order** to place the earliest date at the top.
    - Applied `LIMIT 1` to retrieve the first record, representing the oldest order date.
2. **Finding the Latest Order Date:**
    - Selected `order_date` from `order_details`.
    - Used `ORDER BY order_date DESC` to sort dates in **descending order**, placing the most recent date at the top.
    - Applied `LIMIT 1` to retrieve the latest order date.

These queries provide a clear view of the time span covered in the `order_details` table, helping to analyze sales trends within the available date range.

**How many orders were made within this date range? How many items were ordered within this date range?**

```sql
/* How many order were made within this date range */
SELECT COUNT(order_id) AS num_of_orders
FROM order_details;

/* How many items were ordered within this date range */
SELECT COUNT(item_id) AS num_of_items_ordered
FROM order_details;
```

![Screenshot (45699).png](Screenshot_(45699).png)

![Screenshot (45700).png](Screenshot_(45700).png)

To analyze the total number of orders and items within the given date range, I used two SQL queries:

1. **Counting the Total Number of Orders:**
    - Used `COUNT(order_id)` to count the total number of unique orders in the `order_details` table.
    - Assigned an alias (`AS num_of_orders`) for better readability.
    - This query provides insight into the total number of transactions recorded.
2. **Counting the Total Number of Items Ordered:**
    - Used `COUNT(item_id)` to count the total number of items purchased within the recorded orders.
    - Assigned an alias (`AS num_of_items_ordered`) for clarity.
    - This query helps in understanding the total volume of individual items sold.

These queries help measure overall sales activity within the available date range in the dataset.

**Which orders had the most number of items?**

```sql
/* Which order has most num of items */
SELECT order_id, COUNT(item_id) AS num_of_items
FROM order_details
GROUP BY order_id
ORDER BY num_of_items DESC;
```

![Screenshot (45701).png](Screenshot_(45701).png)

To determine which order contains the most items, I used the following approach:

1. **Counting the Number of Items per Order:**
    - Used `COUNT(item_id)` to calculate the total number of items within each order.
    - Assigned an alias (`AS num_of_items`) for better readability.
2. **Grouping by Order ID:**
    - Applied `GROUP BY order_id` to aggregate the item count for each unique order.
3. **Sorting the Results:**
    - Used `ORDER BY num_of_items DESC` to display orders with the highest number of items at the top.

This query helps identify the largest orders in terms of item quantity, providing insights into bulk purchases and customer ordering behavior.

**How many orders had more than 12 items?**

```sql
/* How many orders had more than 12 items */
SELECT order_id, COUNT(item_id) AS num_of_items
FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) > 12;
```

![Screenshot (45703).png](Screenshot_(45703).png)

To determine how many orders contained more than 12 items, I used the following approach:

1. **Counting Items per Order:**
    - Used `COUNT(item_id)` to calculate the total number of items in each order.
    - Assigned an alias (`AS num_of_items`) for better readability.
2. **Grouping by Order ID:**
    - Applied `GROUP BY order_id` to aggregate item counts for each order.
3. **Filtering Orders with More Than 12 Items:**
    - Used the `HAVING` clause with `COUNT(item_id) > 12` to filter and display only orders that exceed 12 items.

This query helps identify large orders, which can be useful for analyzing high-volume purchases and customer buying behavior.

### **Final objective is to combine the items and orders tables, find the least and most ordered categories, and dive into the details of the highest spend orders.**

Wrote a SQL query to:

Combine the menu_items and order_details tables into a single table

```sql
/* Combining menu and orders table into single table using full outer join */
CREATE TABLE menu_order_combined
SELECT *
FROM menu_items AS m
JOIN order_details AS o
ON m.menu_item_id = o.item_id;
```

To combine the `menu_items` and `order_details` tables into a single table, I used an **INNER JOIN** (not a FULL OUTER JOIN, as MySQL does not support it directly). Here's how the query works:

1. **Creating a New Table:**
    - The query creates a new table named `menu_order_combined` to store the merged data.
2. **Joining the Tables:**
    - Used `JOIN` (which performs an **INNER JOIN**) to combine `menu_items` (`m`) and `order_details` (`o`) based on the matching `menu_item_id` from `menu_items` and `item_id` from `order_details`.
    - This ensures that only matching records from both tables are included.

**What were the least and most ordered items? What categories were they in?**

```sql
/* Least and most ordered items in a table and in which category they belong to */
SELECT category, item_name, COUNT(item_name) as num_of_orders
FROM menu_order_combined
GROUP BY category, item_name
ORDER BY num_of_orders
LIMIT 1;

SELECT category, item_name, COUNT(item_name) as num_of_orders
FROM menu_order_combined
GROUP BY category, item_name
ORDER BY num_of_orders DESC
LIMIT 1;
```

![Screenshot (45704).png](665d0352-5a52-429b-aa69-79b112921f48.png)

![Screenshot (45705).png](147a49e6-5a59-4fc5-93da-b45d36684628.png)

To determine the **least and most ordered items** along with their **category**, I used the following approach:

### **1. Finding the Least Ordered Item:**

- Selected `category` and `item_name` to identify each menu item and its category.
- Used `COUNT(item_name)` to count how many times each item was ordered.
- Assigned an alias (`AS num_of_orders`) for better readability.
- Applied `GROUP BY category, item_name` to aggregate the count per item within each category.
- Used `ORDER BY num_of_orders` in **ascending order** to place the least ordered item at the top.
- Used `LIMIT 1` to retrieve only the least ordered item.

### **2. Finding the Most Ordered Item:**

- Used the same query structure but sorted results in **descending order** using `ORDER BY num_of_orders DESC` to get the most ordered item.
- Applied `LIMIT 1` to display only the highest-ordered item.

This query helps identify **which menu items are performing well and which are not**, allowing businesses to make data-driven decisions on menu optimization, promotions, or possible removal of underperforming items.

**What were the top 5 orders that spent the most money?**

```sql
/* Top 5 orders that spent the most money */
SELECT order_id, (COUNT(order_id)* AVG(price)) AS amt_spent
FROM menu_order_combined
GROUP BY order_id
ORDER BY amt_spent DESC
LIMIT 5;
```

![Screenshot (45706).png](Screenshot_(45706).png)

To determine the **top 5 orders that spent the most money**, I used the following approach:

1. **Calculating the Total Amount Spent per Order:**
    - Used `COUNT(order_id) * AVG(price)` to estimate the total amount spent on each order.
        - `COUNT(order_id)`: Counts the number of items in each order.
        - `AVG(price)`: Averages the price of items in each order.
        - Multiplying these gives an estimated total amount spent per order.
    - Assigned an alias (`AS amt_spent`) for better readability.
2. **Grouping Data by Order ID:**
    - Used `GROUP BY order_id` to ensure calculations are performed per order.
3. **Sorting the Orders by Amount Spent:**
    - Applied `ORDER BY amt_spent DESC` to list orders from highest to lowest total spending.
4. **Limiting Results to the Top 5:**
    - Used `LIMIT 5` to retrieve only the top 5 highest-spending orders.

**View the details of the highest spend order. Which specific items were purchased?**

```sql
/* Details of top 5 highest spent orders */
SELECT *
FROM menu_order_combined
WHERE order_id IN (440, 2075, 1957, 330, 2675);
```

![Screenshot (45707).png](Screenshot_(45707).png)

To retrieve the details of the **top 5 highest-spending orders**, I used the following approach:

1. **Selecting All Columns:**
    - Used `SELECT *` to retrieve **all details** of the selected orders from the `menu_order_combined` table.
2. **Filtering Specific Order IDs:**
    - Used `WHERE order_id IN (440, 2075, 1957, 330, 2675)` to filter the dataset and include only the top 5 highest-spending orders.
    - The specific order IDs (440, 2075, 1957, 330, 2675) were identified from a previous query ranking orders by total spending.
    

This query provides a **detailed view** of each high-value order, including:

- The items purchased
- Their respective categories
- Prices
- Payment methods (if included in the table)

Businesses can use this data to analyze spending patterns, identify high-value customers, and optimize menu offerings based on what the top spenders order the most.