-- Data definition > script that helps create blueprint of the data schema

DROP DATABASE restaurant_db;
CREATE DATABASE restaurant_db;
USE restaurant_db;

SHOW TABLES;

-- DDL - data definition language statement
DROP TABLE IF EXISTS menu_items;
CREATE TABLE menu_items (
	item_id INT PRIMARY KEY AUTO_INCREMENT, -- item_id will always be unique
    dish_name VARCHAR(100) NOT NULL, -- NOT NULL -- 
    category VARCHAR(50) DEFAULT 'Main Course' -- DEFAULT
);

DESCRIBE menu_items; -- describes the column data types

-- DDL: add column, rename column, add constraint, remove constraint
ALTER TABLE menu_items
ADD COLUMN price DECIMAL(6,2) NOT NULL CHECK(price >= 0); -- CHECK: if negative, insert will throw error
ALTER TABLE menu_items
ADD COLUMN is_available BOOLEAN DEFAULT TRUE; 
ALTER TABLE menu_items
RENAME COLUMN is_available TO in_stock;
ALTER TABLE menu_items
ADD COLUMN calories INT DEFAULT 1 AFTER price;

TRUNCATE TABLE menu_items; -- clears table rows

-- DML: data manupulation language
INSERT INTO menu_items (item_id, dish_name, category, price, calories, in_stock)
VALUES 
	(1, 'Margherita Pizza', 'Pizza', 12.99, 850, TRUE),
	(2, 'Truffle Pasta', 'Pasta', 18.50, 920, TRUE),
	(3, 'Garlic Bread', 'Appetizer', 6.00, 410, TRUE),
	(4, 'Tiramisu', 'Dessert', 8.50, 540, FALSE),
	(5, 'Caesar Salad', 'Salad', 10.00, 320, TRUE),
	(6, 'Ribeye Steak', 'Main Course', 28.00, 1100, TRUE);
    
-- chef who makes pizza is out of town
UPDATE menu_items
SET in_stock =   TRUE
WHERE item_id =  1;

SELECT * FROM menu_items;


-- Now we can save what our restaurant sells
-- NEXT: We decide what to save when someone orders

CREATE TABLE order_details (
    order_id INT NOT NULL, -- auto increment we won't keep
    item_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, item_id), -- composite primary key
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

SELECT * FROM order_details;

-- now comes that part that happens in real life
INSERT INTO order_details (order_id, item_id, quantity)
VALUES 
    (101, 1, 1),
    (101, 3, 2);
-- Order 2: 2 Truffle Pastas and 1 Caesar Salad
INSERT INTO order_details (order_id, item_id, quantity)
VALUES 
    (102, 2, 2),
    (102, 5, 1);
-- Order 3: 1 Ribeye Steak
INSERT INTO order_details (order_id, item_id, quantity)
VALUES 
    (103, 6, 1);
-- Order 4: 2 Garlic Bread, 3 Rib eye steak, 1 Tiramisu
INSERT INTO order_details (order_id, item_id, quantity)
VALUES 
	(104, 2, 3), -- 3 , 2
	(104, 3, 6), -- 6 , 3
	(104, 1, 4); -- 4 , 1
    
-- DML: Update records
-- Records wrong for 104
UPDATE order_details
SET quantity = 3
WHERE order_id = 104 AND item_id = 2 ;

-- this won't fix it becuase item id hi galat hai
DELETE FROM order_details
WHERE order_id = 104;

-- Order 4: 2 Garlic Bread, 3 Rib eye steak, 1 Tiramisu
INSERT INTO order_details (order_id, item_id, quantity)
VALUES 
	(104, 3, 2), -- 3 , 2
	(104, 6, 3), -- 6 , 3
	(104, 4, 1); -- 4 , 1

SELECT * FROM order_details;

-- foriegn key
INSERT INTO order_details (order_id, item_id, quantity)
VALUES 
	(104, 7, 3);

-- 
SELECT COUNT(*) FROM order_details;

-- store_db: 
	-- customers: customer_id pk, customer_name, city
    -- products: product_id pk, product_name, product_price, product_category
    -- orders: order_id, customer_id REFER customers.customer_id, product_id REFER products.product_id, quantity, date

