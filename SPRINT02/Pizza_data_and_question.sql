--customers table
CREATE TABLE customers(
  cus_id text,
  firstname text,
  lastname text,
  cus_gender text,
  age int
);
INSERT INTO customers VALUES
  ("1", "Antony", "Raerae", "Male", 38),
  ("2", "Jenny", "Jonas", "Female", 32),
  ("3", "Stella", "Kim", "Female", 21),
  ("4", "Krixi", "Jungle", "Female", 19),
  ("5", "Dokja", "Yu", "Male", 26),
  ("6", "Yorn", "Sang", "Male", 47),
  ("7", "Yusuke", "Fujisaki", "Male", 41),
  ("8", "Eren", "Yeager" , "Male", 35);
.mode box
SELECT * FROM customers;

--menus table
CREATE TABLE menus(
  menu_id text,
  menu_name text,
  menu_price int
);
INSERT INTO menus VALUES
  (1, "Peperoni", 250),
  (2, "Hawaiian", 250),
  (3, "Seafood", 400),
  (4, "Vegetarian", 300),
  (5, "Meat Lovers", 350),
  (6, "Salad", 150),
  (7, "Spaghetti", 250),
  (8, "Steak", 800),
  (9, "Hamburger", 150),
  (10, "Ice cream", 150);
.mode box
SELECT * FROM menus;

--orders table
CREATE TABLE orders(
  order_id int,
  order_date date,
  menu_id int,
  cus_id int
  );
INSERT INTO orders VALUES
  (1, "2023-09-01", 1, "1"),
  (2, "2023-09-01", 9, "1"),
  (3, "2023-09-02", 3, "8"),
  (4, "2023-09-02", 10, "8"),
  (5, "2023-09-04", 2, "3"),
  (6, "2023-09-05", 3, "3"),
  (7, "2023-09-17", 6, "5"),
  (8, "2023-09-23", 8, "4"),
  (9, "2023-09-24", 8, "7"),
  (10, "2023-09-24", 7, "7"),
  (11, "2023-09-24", 10, "7"),
  (12, "2023-09-30", 8, "6");
.mode box
SELECT * FROM orders;
-----------------------------------------------------------------------------
-- Aggregate function : AVG SUM MIN MAX COUNT

--Join three tables (Inner join)
SELECT 
  order_id,
  customers.firstname,
  customers.age,
  menus.menu_name,
  menus.menu_price AS menu_saledprice
FROM orders
INNER JOIN menus ON orders.menu_id = menus.menu_id
INNER JOIN customers ON orders.cus_id = customers.cus_id
Order BY order_id;

-----------------------------------------------------------------------------
--What is the average of the customer's age? => AVG 
--How much the restaurant sell in this month? => SUM
--How many people order in this month? => COUNT
--(Using subqueries)
SELECT
  COUNT (DISTINCT firstname) AS customer_count,
  AVG(age),
  SUM (menu_price) AS total_saled
FROM (
  SELECT 
    order_id,
    customers.firstname,
    customers.age,
    menus.menu_name,
    menus.menu_price
  FROM orders
  INNER JOIN menus ON orders.menu_id = menus.menu_id
  INNER JOIN customers ON orders.cus_id = customers.cus_id
);

-----------------------------------------------------------------------------
--How much the price of each order? 
--Who is the most spender in this month?
--(Using WITH clause)
WITH order_detail AS(
  SELECT 
    order_id,
    customers.firstname,
    customers.age,
    menus.menu_name,
    menus.menu_price
  FROM orders
  INNER JOIN menus ON orders.menu_id = menus.menu_id
  INNER JOIN customers ON orders.cus_id = customers.cus_id
  Order BY order_id
)

SELECT
  order_detail.firstname,
  SUM(menu_price) AS order_price
FROM order_detail
GROUP BY order_detail.firstname
ORDER BY order_price DESC;+

-----------------------------------------------------------------------------
--Which menus is the less popular?
WITH ordered_menu AS(
  SELECT 
    order_id,
    customers.firstname,
    menus.menu_name
  FROM menus
  LEFT JOIN orders ON orders.menu_id = menus.menu_id
  LEFT JOIN customers ON orders.cus_id = customers.cus_id
  Order BY order_id
),   saled_menu AS(
  SELECT 
    order_id,
    customers.firstname,
    customers.age,
    menus.menu_name,
    menus.menu_price AS menu_saledprice
  FROM orders
  INNER JOIN menus ON orders.menu_id = menus.menu_id
  INNER JOIN customers ON orders.cus_id = customers.cus_id
  )
SELECT
  ordered_menu.menu_name,
  SUM(saled_menu.menu_saledprice) AS allmenu_saledprice
FROM ordered_menu
LEFT JOIN saled_menu ON ordered_menu.menu_name = saled_menu.menu_name
GROUP BY ordered_menu.menu_name
ORDER BY allmenu_saledprice;

