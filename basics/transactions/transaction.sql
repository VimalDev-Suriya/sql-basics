CREATE DATABASE products_dev;

CREATE TABLE invoices(
	invoice_id SERIAL PRIMARY KEY,
	order_id INT NOT NULL UNIQUE,
	user_id INT NOT NULL
)

INSERT INTO invoices(order_id, user_id) VALUES 
(456, 808),
(789, 908),
(101, 908),
(111, 908);

SELECT * FROM invoices;

CREATE TABLE inventories(
	product_id INT NOT NULL,
	stock INT CHECK (stock >= 0)
)

INSERT INTO inventories(product_id, stock) VALUES 
(1, 10),
(2, 10),
(3, 40),
(4, 0)

SELECT * FROM inventories

-- IS operator can be used instead of "=" especially while comparing with NULL
DELETE FROM inventories WHERE stock IS NULL

-- HERE I am trying to buy the product 4 that is not in Stock
-- In Realtime, the invoice will be generated and then the inventory (validating the stock in realtime) will be happening
-- So even if invoice was generated successfully, if inventory fails all the transactions done should be reverted

-- USE SEMICOLON
BEGIN;

INSERT INTO invoices(order_id, user_id) VALUES 
(141, 1021);

UPDATE inventories
SET stock = stock - 1
WHERE product_id = 4; -- This will fail so even the invoice transaction will be revoked . rollbacked

-- Always use ROLLBACK BEFORE COMMIT
ROLLBACK;

-- If all the above transaction was good, then the real commit to DB will be done
COMMIT;