CREATE DATABASE employee_dev;

CREATE TABLE details(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO details(name, email) VALUES 
('vimala', 'vd@test.com'),
('keerthana', 'skk@test.com'),
('devaraj', 'dv@test.com'),
('test 1', 'dv1@test.com'),
('test 2', 'dv2@test.com'),
('test 3', 'dv3@test.com'),
('test 4', 'dv4@test.com'),
('test 5', 'dv5@test.com'),
('test 6', 'dv6@test.com'),
('test 7', 'dv7@test.com'),
('test 8', 'dv8@test.com'),
('test 9', 'dv9@test.com'),
('test 10', 'dv10@test.com')

SELECT * FROM details;

-- Here the WHERE clause will set the start of the boundary & limit will end the boundary
-- This is more performant as, we are finding the specific elements
SELECT * FROM details
ORDER BY id
WHERE id > 5
LIMIT 5