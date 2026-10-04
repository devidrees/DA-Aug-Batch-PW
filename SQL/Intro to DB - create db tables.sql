-- this creates a database
--  Function    databaseName 
CREATE DATABASE school_db;

-- open the database
USE school_db;

-- command -> shows database tables
SHOW TABLES;

-- creating a new table -- BLUEPRINT of the TABLE
-- command   tableName( col1 col2 col3 ) -> BLUEPRINT

-- Delete the entire table from schema
DROP TABLE student;

CREATE TABLE student(
	-- columnName dataType [Constrain],
    student_id INT PRIMARY KEY, 
    name VARCHAR(20), -- text upto 20 characters
    age INT,
    city VARCHAR(50)
);

-- command  tableName(col1, col2, col3, col4) VALUES (1,3,4,5),(2,34,5,5) 
INSERT INTO student(student_id, name, age, city)
VALUES 
	(1, 'Idrees', 30, 'Delhi'),
    (2, 'Tanya', 20, 'Kolkata'),
    (3, 'Harsh', 25, 'Chennai');

-- only changing primary keys for each row
INSERT INTO student(student_id, name, age, city)
VALUES 
	(4, 'Idrees', 30, 'Delhi'),
    (5, 'Tanya', 20, 'Kolkata'),
    (6, 'Harsh', 25, 'Chennai');
    
-- To See the data in a table
SELECT * FROM student;
	
    

	








