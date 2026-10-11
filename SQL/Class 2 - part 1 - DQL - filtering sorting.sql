USE restaurant_db;

-- filtering and sorting

SELECT * FROM menu_items;

SELECT dish_name, price
FROM menu_items;

-- WHERE clause along with: Logical operators = != < > <= >=

-- What is the price of Tiramisu?
SELECT dish_name, price
FROM menu_items
WHERE dish_name = 'Tiramisu';

-- find items cheaper than 15 and sorted by price: Filter and Sort: by price
SELECT dish_name, price
FROM menu_items
WHERE price >15
ORDER BY price ASC;

-- Find the items which are in stock
SELECT dish_name, in_stock
FROM menu_items
WHERE in_stock = TRUE;

-- Filtering with: Conditional Operators: AND OR NOT
-- (condition 1) AND (condition 2): Both conditions TRUE only then result
-- (condition 1) OR (condition 2): Atleast one condition TRUE then result

-- Find me dishes that are less than 15 and calories < 500
SELECT dish_name, price, calories
FROM menu_items
WHERE price < 15 OR calories < 500;

-- give me dishes that are not Dessert 
SELECT dish_name
FROM menu_items
WHERE NOT category = "Dessert";

-- Using ranges: BETWEEN, Membership: IN and NOT IN
-- give me dishes of prices 10 to 30
SELECT dish_name, price
FROM menu_items
WHERE price BETWEEN 10 AND 30;
-- WHERE price < 30 AND price > 10;

-- give me the desserts and appetizers  dishes only
SELECT dish_name, category
FROM menu_items
WHERE category NOT IN ('appetizer', 'Dessert');
-- ORDER BY category ASC; -- SORTING


-- Pattern matching: LIKE 
-- find any dish containing with Bread
SELECT dish_name
FROM menu_items
WHERE dish_name LIKE '%Bread%'; -- pattern matching 
-- % means any number of characters
-- _ mean one character

-- find dishes starting with 'T'
SELECT dish_name
FROM menu_items
WHERE dish_name LIKE 'Truffle%';

-- when you have to search names from 100s or 1000s of records



-- LIMIT
SELECT * 
FROM menu_items
LIMIT 5;


-- Find your second most expensive dish
SELECT dish_name, price
FROM menu_items
ORDER BY price DESC
LIMIT 1 
OFFSET 3;




