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

-- Question: Return the employees who earn more than the average salary.

-- Below code will not work because, we are using aggregate function in WHERE clause
-- We can use AGgregate function only with GROUPBY or Having
-- "aggregate functions are not allowed in WHERE"
-- SELECT * from employees_details
-- WHERE SALARY > AVG(SALARY)

SELECT * FROM employees_details
WHERE SALARY > (
	SELECT AVG(SALARY) FROM employees_details
)

-- We can use Sub Queries at SELECT CLause also
SELECT id, name, salary, department, (SELECT AVG(SALARY) FROM employees_details) AS AVG_SALARY 
FROM employees_details
