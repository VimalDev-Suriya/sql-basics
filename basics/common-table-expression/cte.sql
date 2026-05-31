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
('Virat', 95000, 'SALES')

SELECT * FROM employees_details

-- DO NOT USE SEMICOLON AFTER THE CTE
WITH high_salary_expression AS (
	SELECT * FROM employees_details 
	WHERE salary > 50000
)

SELECT * FROM high_salary_expression;
