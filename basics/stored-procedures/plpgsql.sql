CREATE TABLE bank_accounts(
	id INT PRIMARY KEY,
	balance INT CHECK(balance >= 0),
	name VARCHAR(40) NOT NULL
);

INSERT INTO bank_accounts(id, name, balance) VALUES 
(1, 'suriya', 10000),
(2, 'keerthana', 30000),
(3, 'devaraj', 50000);

SELECT * FROM bank_accounts;

-- Creating the Procedure
CREATE OR REPLACE PROCEDURE add_balance(
	acc_id INT,
	amount INT
)
LANGUAGE PLPGSQL
AS $$
-- Remember to close the statements with ;
BEGIN
	UPDATE bank_accounts
	SET balance = balance + amount
	WHERE id = acc_id;
END;
$$;

-- Calling the procedure with the data
CALL add_balance(2, 1000);