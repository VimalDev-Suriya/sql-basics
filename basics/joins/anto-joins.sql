-- An Anti-Join returns rows from one table that have no matching records in another table. In psql, you achieve this by writing a standard LEFT JOIN or FULL JOIN and adding a WHERE ... IS NULL filter


-- 1. Left Anti-Join (Users with NO orders)
-- This identifies customers who have signed up but have never placed an order

SELECT u.name, o.order_id
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.order_id IS NULL;


--   name   | order_id 
-- ---------+----------
--  Charlie |     [null]
-- (1 row)


-- 2. Full Anti-Join (All unmatched records)
-- This catches all anomalies: users with no orders, and orders with missing user accounts
SELECT u.name, o.order_id, o.amount
FROM users u
FULL JOIN orders o ON u.user_id = o.user_id
WHERE u.user_id IS NULL OR o.user_id IS NULL;


--   name   | order_id | amount 
-- ---------+----------+--------
--  Charlie |     [null] | [null]
--  [null]  |      103 |  20.00
-- (2 rows)
