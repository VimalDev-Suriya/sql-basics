CREATE DATABASE users_dev;

CREATE TABLE employees_detail(
	emp_id INT PRIMARY KEY,
	emp_name VARCHAR(50) NOT NULL,
	manager_id INT
)

INSERT INTO employees_detail(emp_id, emp_name, manager_id) VALUES
(1, 'Julie', NULL), -- Julie is the CEO (no manager so NULL)
(2, 'Rajasree', 1), -- Rajasree reports to Julie
(3, 'Venkat', 1), -- Venkat reports to Julie
(4, 'Jiten', 2), -- Jiten reports to Rajasree
(5, 'Sridhar', 3),
(6, 'Dinesh', 4),
(7, 'Sahil', 4);

SELECT * FROM employees_detail;

-- Self Join
-- Will be performed within the tables, Mostly used to determine the Hierarchy of Data.
-- Here I am using the Same Table to join, but Comparing its same column with different set of name.
SELECT e.emp_name as EMPLOYEE_NAME, m.emp_name as MANAGER_NAME
FROM employees_detail e
LEFT JOIN employees_detail m
ON e.manager_id = m.emp_id