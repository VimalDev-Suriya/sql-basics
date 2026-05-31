CREATE DATABASE employees_dev;

CREATE TABLE employees_details(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	SALARY INT NOT NULL,
	department VARCHAR(10)
)

INSERT INTO employees_details(name, SALARY, department) VALUES 
('Neha', 80000, 'HR'),
('Ravi', 100000, 'IT'),
('Kavya', 60000, 'HR'),
('Maran', 30000, 'IT'),
('Rohit', 68000, 'SALES'),
('Virat', 95000, 'SALES'),
('Sai', 95000, 'SALES')

SELECT * FROM employees_details

-- Here I want to Rank the rows based on the high salary

SELECT * FROM employees_details
ORDER BY salary DESC

SELECT name, salary, RANK() OVER (ORDER BY salary DESC) FROM employees_details
-- "name"	"salary"	"rank"
-- "Ravi"	100000	1
-- "Virat"	95000	2
-- "Sai"	95000	2
-- "Neha"	80000	4
-- "Rohit"	68000	5
-- "Kavya"	60000	6
-- "Amit"	50000	7
-- "Maran"	30000	8


SELECT name, salary, DENSE_RANK() OVER (ORDER BY salary DESC) FROM employees_details

-- "name"  "salary" "dense_rank"
-- "Ravi"	100000	1
-- "Virat"	95000	2
-- "Sai"	95000	2
-- "Neha"	80000	3
-- "Rohit"	68000	4
-- "Kavya"	60000	5
-- "Amit"	50000	6
-- "Maran"	30000	7