# MISC

## How to remove duplicate records using DISTINCT in PSQL:

- Mostly used in conjustion with `SELECT` clause
- As name suggest, it will filter out the duplicate values while returning the data.
- It `wont delete the data` from table
- https://youtu.be/u3Xyw6DXm_o?si=f7ub-Q5RFXASffRx&t=9781 (need to revist)

```sql
-- Returns only the Unique Cities though the record might contain users with same cities
SELECT DISTINCT city FROM users;

--
```

## Column Alias

- Alias helps to give the new name to the Column during the process of Execution.
- _REMEMBER - THIS WILL NOT CHANGE THE EXACT NAME OF THE COLUMN, INSTEAD IT WILL UPDATE THE COLUMN NAME TO NEWER NAME._
- We use `AS` keyword to create the alias

```sql
-- Here we are creating the new column name (studnet_name) from "name" for our readbility.
SELECT name AS student_name FROM <table_name>

-- WE can create alias without using 'AS' keyword (but this is not recommended)
SELECT name student_name FROM <table_name>

-- Below helps to Create a new column as "updated marks" which holds the value of adding 5 to it.
-- Here we can use double quotes
-- column looks like -> student_name | mark | updated marks
SELECT name AS student_name, mark, mark + 5 AS "updated marks"  FROM <table_name>
```

## Group By - Delete
