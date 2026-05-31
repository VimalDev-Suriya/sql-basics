CREATE DATABASE employees_dev;

CREATE TABLE user_events(
	event_id INT,
	user_id INT NOT NULL,
	product_id INT NOT NULL,
	clicked_at TIMESTAMP NOT NULL
)

-- Dropping the column
ALTER TABLE user_events ADD COLUMN event_id INT;

INSERT INTO user_events(event_id, user_id, product_id, clicked_at) VALUES 
(102, 12345, 100, NOW())

-- Deleting the specific data
DELETE FROM user_events
WHERE user_id = 12345

SELECT * FROM user_events

-- "user_id"	"product_id"	"clicked_at"	                "event_id"
-- 12345	    99	            "2026-05-31 13:31:39.968319"	101
-- 12345	    99	            "2026-05-31 13:32:10.449814"	101
-- 12345	    99	            "2026-05-31 13:32:38.14489"	    101
-- 12345		100				"2026-05-31 16:10:10.785143"	102
-- 12345		100				"2026-05-31 16:11:16.36456"		102
-- 12345		100				"2026-05-31 16:11:51.457087"	102

-- A major real-time application of ROW_NUMBER() is finding and deleting duplicate records from an analytics or logging table while keeping only the most recent entry.
-- Imagine an ecommerce platform where a bug causes user click events to fire multiple times simultaneously. 
-- You need to clean up the user_clicks table by keeping only the latest click per user per product.

WITH ranked_clicks AS (
	SELECT user_id, product_id, event_id, clicked_at, 
		ROW_NUMBER() OVER(
			PARTITION BY user_id, product_id
			ORDER BY clicked_at DESC
		) AS row_num
	FROM user_events
)
SELECT * FROM ranked_clicks WHERE row_num = 1

-- Below result does not have the duplicate events fired
-- "user_id"	"product_id"	"event_id"	"clicked_at"	            "row_num"
-- 12345	    99	            101	        "2026-05-31 13:32:38.14489"		1
-- 12345		100				102			"2026-05-31 16:11:51.457087"	1
