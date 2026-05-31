# Structured Query Language (SQL)

## Database Management System:

Database Management System (DBMS) is a software which used to store, manage and secure the data. It act as the interface to access the physical data for the client. There are 2 different types of databases

1. Relational Database
2. Non - Relation Database

- Use the below link to practice the PSQL
- https://pgexercises.com/questions/basic/

## Relational Database:

A relational database organizes data into `structured`, predefined `tables` consisting of `rows and columns`. <br>.

### Properties of Relational Databases:

1. Uses `SQL` as the query language to perform the CRUD operations in DB
2. Performs `ACID` (Atomicity, Consistency, Isolated and Durability) transactions, which ensures the data integrity and accuracy.
3. Ability to do `Vertical Scaling`, including more rows and columns, So single server can be vertically scalled (Increasing the CPU RAM)
4. Common examples - MySQL, Micorsoft SQL server, Oracle DB and Postgress SQL

## Local Setup:

As the part of my learning, I am going to use Postgres SQL. So installing the following applications

1. SQL Server
2. pgadmin4 - A GUI similar to mongo compasss
3. Stack builder - a package manager to install additional tools if required
4. CLI tool

## Building blocks of SQL:

- Table (Collection)
- Rows (documents)
- Columns (Fields)
- Primary Key - Each row should have 1 unique Primary key for the table

## Queries:

SQL is `case insenitive`, we can use both upper and lower case for writing the query. Make sure the keys, tables, columns and rows are case sensitive.

### Data Types:

1. Interger -
   1. SMALLINT - Smaller integer
   2. INT,
   3. BIGINT - Larger integer than > 2 billion
2. Decimal -
   1. Numeric(num, decimal),
   2. Real/Double Precission
3. String -
   1. VARCHAR(N) - takes the length, but based on the value it takes, it can adopt the length
   2. CHAR(N) - Always fixed length, irrespective of values, eg if we initialize 10 char, then always the memory will hold the length of 10 char irrespective of values.
   3. TEXT - For long undeterministic length of string
4. Boolean - True and False
5. Data & Time
   1. Date - Stores only data
   2. Timestamp - Both date and time
6. JSON
   1. Unstructred data - BJSON
7. SERIAL - A auto incrementing number, primarily used in conjuction with PRIMARY KEY
   1. SMALLSERIAL
   2. SERIAL
   3. BIGSERIAL

### Create the DB

- Always prefer smaller case while creating the DB name, like users, comments etc
- If we want multiple name combined, use "\_", like user_details
- Always give the environment name as the suffix while creating the DB like `users_dev`

```sql
CREATE DATABASE <dbname>
```

#### To Delete database

```sql
DROP DATABASE <dbname>

-- We will get error while executing the drop
-- ERROR:  database "test_db_dev" is being accessed by other users
-- There is 1 other session using the database.
```

- So we can use `FORCE` flag to delete

```sql
DROP DATABASE <dbname> WITH (FORCE)
```

### Create the Table

- Always use `plural` form while creating the table
- user snake case eg `users_details` while creating table.
- Always use `_` while for multple name and also joins
- Use `id` as the suffix or in its name while creating the Primary Key (PK)
- Use `<table_name>_id` for the Foreign key creation (FK)
- If we want to have the timestamps /date always use `_at` suffix

```sql
CREATE TABLE students(
	id SERIAL PRIMARY KEY, -- PRIMARY KEY REPRESENTS THE UNIQUE VALUES
	fullname VARCHAR(70) NOT NULL, -- NOT NULL explicitly stating that this is mandatory value
	fathers_name VARCHAR(70) NOT NULL,
	age SMALLINT NOT NULL,
	email VARCHAR(100) UNIQUE, -- UNIQUE REPRESENTS THAT THIS VALUE SHOULD BE UNIQUE WITHIN THE TABLE, BUT THIS IS NOT THE PRIMARY KEY
	enroll_date DATE DEFAULT CURRENT_DATE -- CURRENT DATE IS THE TODAY'S DATE - ITS THE KEYWORD
   marks INT CHECK(marks BETWEEN 0 AND 100)
   created_at TIMESTAMP DEFAULT DEFAULT_TIMESTAMP
)
```

#### Create Table best practices:

1. Choose the Primary Key first
2. Normalize your tables, avoid reduntant values
3. Use `Foreign Key` to refer the external tables
4. Avoid using larger `data types` for the smaller values, like use smallint for age
5. Add `NOT NULL` wherever possible, to increase the data integrity

#### Null values in SQL queries:

- If we use `=` operator in null, the result will always be `null`
- We should be properly handle the null.
- In SQL, null is nothing but the value is not set, here 0, '' are all valid values
- Rows with `null` values are ignored in `WHERE`, `COMPARE` clauses. But the `COUNT(*)` function will include the NULL values.

```sql
SELECT null = null -- returns null

SELECT * FROM users WHERE name IS NULL; -- this will propertly return the data with null values
```

- in SQL "=" is the comparator operator

```sql
SELECT 1 = 1 -- return true
```

### Insert the data

- Entering the Single value

```sql
INSERT INTO <table_name>(<columns comma separated>) VALUES (<actual values comma separated>);
```

- Entering multiple values in the single go.

```sql
INSERT INTO <table_name>(<columns comma separated>) VALUES
(<actual values comma separated>),
(<actual values comma separated>),
(<actual values comma separated>);
```

**Notes**

- Always use single quotes to give the string values
- Passing the Column names `<table_name>(<columns comma separated>)` is optional, but it is highly recommended to to that.
  - It helps to point out the values to corresponding columns.

### Update the Data:

- `UPDATE` help to update the existing the row.

```sql
UPDATE <table_name> -- Selecting the table
SET <column_name> = <new_value> -- What value should be updates
WHERE <column_name> = <old_value>; -- Which value need to be updated
```

- Updating the `multiple column` values.

```sql
UPDATE <table_name>
SET <column_name> = <new_value>, <column_name> = <new_value>, <column_name> = <new_value>
WHERE <column_name> = <old_value> -- Selector
```

- Updating `multiple rows`
- Below query will select all the rows that matches the considtion `where mark < 66`

```sql
UPDATE <table_name>
SET mark = mark + 5
WHERE mark < 66
```

### Deleting the Data:

- `Safe Delete` is important, as there is the possibility of deleting the important data without awarness
- Always use `primary key` selector for picking up the correspodning row to be deleted. If there was the requirment to delete with multiple condition then make to re-validate if that operation is valid to perform
- **Always check whether the element that we are planned to delete is actually present in table.**
- By default DELETE does not support `limit` operation, so we can use `sub-queries` to perform those actions. like below

```sql
SELECT * FROM <table_name> WHERE id = 10;

DELETE FROM <table_name>; -- This will delete all the rows

DELETE FROM <table_name>
WHERE id = 10; -- Deleting the row which matches the condition

DELETE FROM <table_name>
WHERE id IN (
    SELECT <column_name> FROM <table_name> ORDER BY <column_name> LIMIT <number>
)
```

### Retrive Data (SELECT Query):

A Important query which helps to retrive the data.

- PostgresSql converts the SELECT query as the `execution plan`, and then executes them in efficient way.
- Here `*` represents `every column` in the given table

```sql
SELECT * FROM <table_name>;

SELECT <column_name> FROM <table_name>

-- Helps to understand the cost and plan of this SELECT query
-- But This will not execute the query
EXPLAIN
SELECT <column_name> FROM <table_name>

-- Helps to understand the cost and plan of this SELECT query
-- But This will execute the query
EXPLAIN ANALYZE
SELECT <column_name> FROM <table_name>
```

#### Execution Order of Select Query

1. FROM
2. JOINS (CONDITION)
3. WHERE
4. GROUP BY
5. HAVING
6. SELECT
7. ROW_NUMBER()
8. ORDER BY
9. LIMIT

### Filtering the data:

- We will be using `WHERE` clause to get the data.
- Operators, >, <, <> (!=), >=, <= and =
- `AND`, `OR` and `NOT`
- `ORDER BY` - by default the value will be ordered by `asending order`, If we want to order it by descending order, then we can add `DESC`
  - Always use ASC or DESC following by ORDER BY
- To Select multiple columns, for that we can give like below.
- we can use `LIMIT` to restrict the number of data to be returned
- We can use `OFFSET`, to skip the particular number of data.
- For pagination we will be using the combination of `LIMIT` and `OFFSET`

```sql
SELECT * FROM <table_name>
WHERE condition_1 OR consdition_2

SELECT * FROM <table_name>
WHERE condition_1 AND consdition_2

SELECT * FROM <table_name>
WHERE NOT condition_1

SELECT * FROM <table_name>
ORDER BY id

SELECT * FROM <table_name>
ORDER BY condition_1 ASC AND condition_2 DESC

-- Here we are selecting only 3 itesm and Ordering them based on the column_2
SELECT column_1, column_2, column_3 FROM <table_name>
ORDER BY 2

-- Pagination page 1 -> 0 -> 10
SELECT * FROM <table_name>
ORDER BY id
LIMIT 10
OFFSET 0

-- Pagination page 1 -> 11 -> 20
SELECT * FROM <table_name>
ORDER BY id
LIMIT 10
OFFSET 10
```

### Add / Delete the existing column:

- Here we use `ALTER` keyword
- `<constraint>` are the additional properties like, NOT NULL, NULL, DEFAULT etc.

```sql
ALTER TABLE <table_name>
ADD COLUMN <column_name> <data_type> <constraint>;

ALTER TABLE <table_name>
DROP COLUMN <column_name>;

ALTER TABLE users DROP COLUMN IF EXISTS age;
```

#### ADD CONSTRAINT:

- A Clause used with conjuction with `ALTER TABLE` to add / remove any additional rules/schema to the existing column.
- We use contraints againt the columns.
- Instead directly updating the existing column, using this keyword provides more data integrity

```sql
ALTER TABLE <table_name>
ADD CONSTRAINT constraint_name constraint_type (column_name);

-- constraint_name is optional, but its always good to give them explicitly
```

## Keys in SQL:

### Primary Key:

A Most important key for any Table in SQL. This will give the uniqueness to each rows. A these are the primary ones to identify the rows effectively

- Primay keys are created during a time table creation
- We can select the primary key, if the existing table does not have it
- we can only create one Pimary key.
- We can create primary key by combining multiple keys.

```sql
-- If there is no primary key while creating the DB
ALTER TABLE <table_name>
ADD PRIMARY KEY (<column_name>)

-- creating the composite key

CREATE TABLE <table_name>(
    student_id  INT NOT NULL
    cource_id INT NOT NULL
    PRIMARY KEY(student_id, cource_id)
)
```

### Foreign keys:

- It refers to the Primary Key of another Table.
- It cannot be `NULL` at any cost
- `REFERENCES` is the keyword to refer another table's key
- We will use the table name here by passing the Primary key
- Naming convention of the Forign Key is `<table-name>_id`
- It Maintains the `referential-integrity` means, that if we are adding the new employee with the department id that does not exist in departments table, then we can't able to insert the data int table

```sql
CREATE TABLE departments(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE,
)

CREATE TABLE employees(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	salary INT NOT NULL,
	department_id INT REFERENCES departments(id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

-- To add the Forign Key for the existing Table

ALTER TABLE <table_name>
ADD CONSTRAINT <constraint_name> FOREIGN KEY departmant_id REFERENCES departments(id)
```

## Pattern Matching:

### Like and ILike:

- Used to select or match the specific text content with the pattern
- `LIKE` is the clause used for case - sensitive data
- `ILIKE` is the clause used for case - insensitive data

```sql
SELECT * FROM <table_name>
WHERE name LIKE 'a%'

SELECT * FROM <table_name>
WHERE name ILIKE 'a%'
```

- The `%` represents the remaining number of characters present - Eg - if we use "%a", means we are trying to select the string, which ends with "a"
- `_` represent the exact number of character Eg - if we use "\_a%", we are trying to select the strings that has "a" as the second letter

### REGEX:

- A advanced pattern matching more powerful than LIKE / ILIKE
- As regex can have global, case insensitivity - here we use th symbols like
  - `~` for case sensitive
  - `~*` for case insensitivity
  - `!~` - Does not match the provided regular experession - (case sensitive)
  - `!~*` - Does not match the provided regular experession - (case insensitive)

```sql
SELECT * FROM <table_name>
WHERE name ~* '<regex -exp>'

SELECT * FROM users WHERE email ~ '\.(com|org)$';
```
