-- JOINS -- SQL Functions DATE time functions

-- 
SELECT * FROM menu_items;
SELECT * FROM order_details;

-- What dish was ordered in each order: order_id dish_name price quantity
-- 
-- INNER JOIN
SELECT 
	od.order_id,
    mi.dish_name,
    mi.price,
    od.quantity
FROM order_details AS od
INNER JOIN menu_items AS mi
	ON od.item_id = mi.item_id;
    
    
    
    
-- Sample tables to understand JOINS    
    
CREATE TABLE employee (
		id INT,
        name VARCHAR(10)
        );
INSERT INTO employee (id, name)
VALUES
	(1, 'Idrees'),
    (2, 'Rohan'),
    (3, 'Washim'),
    (4, 'Tanishka');
    
CREATE TABLE salary (
	id INT,
    salary INT
); 
INSERT INTO salary (id, salary)
VALUES
	(1, 500),
    (2, 400),
    (3, 300);
INSERT INTO salary (id, salary)
VALUES
	(5, 800);

SELECT * FROM salary;

-- INNER LEFT RIGHT : JUst replace the words
SELECT e.name, s.salary
FROM employee AS e
LEFT JOIN salary AS s
ON e.id = s.id;

-- LEFT OUTER:
SELECT e.name, s.salary
FROM employee AS e
LEFT JOIN salary AS s
ON e.id = s.id;
    
-- FULL OUTER JOIN in mySQL
SELECT e.name, s.salary
FROM employee AS e
LEFT JOIN salary AS s
ON e.id = s.id

UNION

SELECT e.name, s.salary
FROM employee AS e
RIGHT JOIN salary AS s
ON e.id = s.id;

-- DATE and TIME Functions
-- 