# Aggregations

- All Aggregate functions will ignore the `NULL` values
- **DO not use any AGGREGATE FUNCTION with WHERE CLAUSE**

## Methods

1. COUNT(column_name)
2. SUM(column_name):
3. AVG(column_name):
4. MAX(column_name) and MIN(column_name):

### Group BY & Having

SQL queries will be executed in an order

1. FROM
2. JOINS (CONDITION)
3. WHERE
4. GROUP BY
5. HAVING
6. SELECT
7. ORDER BY
8. LIMIT

- Always use Having after the Group by and Select before Group BY

```sql
SELECT social_science, AVG(social_science) FROM quarterly_assement
WHERE social_science > 45
GROUP BY social_science
HAVING AVG(social_science) > 60
```
