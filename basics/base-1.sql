-- To Create Database
-- Always use ; at teh end of each query
CREATE DATABASE test_db_dev

-- To drop the DB
DROP DATABASE test_db_dev WITH (FORCE);

-- Creating the Table
-- Here we are setting the schema of the table
CREATE TABLE students(
    id SERIAL PRIMARY KEY, -- PRIMARY KEY REPRESENTS THE UNIQUE VALUES
	fullname VARCHAR(70) NOT NULL, -- NOT NULL explicitly stating that this is mandatory value
	fathers_name VARCHAR(70) NOT NULL,
	age SMALLINT NOT NULL,
	email VARCHAR(100) UNIQUE, -- UNIQUE REPRESENTS THAT THIS VALUE SHOULD BE UNIQUE WITHIN THE TABLE, BUT NOT THE PRIMARY KEY
	enroll_date DATE DEFAULT CURRENT_DATE -- CURRENT DATE IS THE TODAY'S DATE - ITS THE KEYWORD
)