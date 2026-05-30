CREATE DATABASE users_dev;

CREATE TABLE user_details(
	user_id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE order_details(
	order_id INT PRIMARY KEY,
	user_id INT,
	price DECIMAL(10, 2)
);

INSERT INTO user_details (user_id, name, email) VALUES
(1, 'Alice', 'alice@g.com'),
(2, 'Bob', 'bob@b.com'),
(3, 'Charlie', 'charlie@c.com');

INSERT INTO order_details (order_id, user_id, price) VALUES
(101, 1, 50.00),
(102, 2, 75.50),
(103, 5, 20.00); -- user_id 5 does not exist in users table

-- 1. INNER JOIN
-- When the Condition met, the result will have the rows of both the table.
SELECT u.name, u.email, o.order_id, o.price 
FROM user_details u
INNER JOIN order_details o
ON o.user_id = u.user_id

-- Result (Contains only the rows that matches the condition)
--  name  | order_id | amount 
-- -------+----------+--------
--  Alice |      101 |  50.00
--  Bob   |      102 |  75.50
-- (2 rows)

-- 2. LEFT JOIN
-- Includes all the data from the left table and the common overlapping with right table. When there is no matches, then the remaining data will be matched with NULL
SELECT u.name, u.email, o.order_id, o.price
FROM user_details u
LEFT JOIN order_details o
ON o.user_id = u.user_id

-- It includes charlie because of left Join, since there was no matching with right table, it was filled with null
--   name   | order_id | amount 
-- ---------+----------+--------
--  Alice   |      101 |  50.00
--  Bob     |      102 |  75.50
--  Charlie |     [null] | [null]
-- (3 rows)

-- 3. RIGHT JOIN
-- Includes all the data from the right table and the common overlapping with left table. When there is no matches, then the remaining data will be matched with NULL
SELECT u.name, u.email, o.order_id, o.price
FROM user_details u
RIGHT JOIN order_details o
ON o.user_id = u.user_id

-- Order 103 appears because it is in the right table, but the buyer's name is NUL
--   name  | order_id | amount 
-- --------+----------+--------
--  Alice  |      101 |  50.00
--  Bob    |      102 |  75.50
--  [null] |      103 |  20.00
-- (3 rows)

-- 4. FULL OUTER JOIN
-- Includes all the data from both left & right table. The Row data will be null if there is no match found
SELECT u.name, u.email, o.order_id, o.price
FROM user_details u
FULL JOIN order_details o
ON u.user_id = o.user_id

--   name   | order_id | amount 
-- ---------+----------+--------
--  Alice   |      101 |  50.00
--  Bob     |      102 |  75.50
--  Charlie |     [null] | [null]
--  [null]  |      103 |  20.00
-- (4 rows)


-- 5. CROSS JOIN (The Cartesian Product)
-- Combines every row of the left table with every row of the right table. It does not use an ON clause.
SELECT u.name, u.email, o.order_id, o.price
FROM user_details u
CROSS JOIN order_details o

-- Result is something like 3 * 3 Matrix result.
-- First table row will be combined with all the rows of second table and goes on till the last row of first table
-- "name"	"email"	"order_id"	"price"
-- "Alice"	"alice@g.com"	101	50.00
-- "Bob"	"bob@b.com"	101	50.00
-- "Charlie"	"charlie@c.com"	101	50.00
-- "Alice"	"alice@g.com"	102	75.50
-- "Bob"	"bob@b.com"	102	75.50
-- "Charlie"	"charlie@c.com"	102	75.50
-- "Alice"	"alice@g.com"	103	20.00
-- "Bob"	"bob@b.com"	103	20.00
-- "Charlie"	"charlie@c.com"	103	20.00
