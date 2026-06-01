-- Bank Account Funds Transfer (With Transaction Control)

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

CREATE OR REPLACE PROCEDURE transfer_funds(
	sender_id INT,
	receiver_id INT,
	amount INT
)
LANGUAGE PLPGSQL
AS $$
DECLARE
	sender_balance INT;
BEGIN
	SELECT balance INTO sender_balance FROM bank_accounts
	WHERE id = sender_id;

	IF sender_balance < amount THEN
		RAISE EXCEPTION 'Insufficient funds. Available: %, Attempted: %', sender_balance, amount;
	END IF;

	-- Sender
	UPDATE bank_accounts
	SET balance = balance - amount
	WHERE id = sender_id;
	
	-- Receiver
	UPDATE bank_accounts
	SET balance = balance + amount
	WHERE id = receiver_id;

	RAISE NOTICE 'Transfer of % from account % to % completed successfully.', amount, sender_id, receiver_id;

EXCEPTION
	WHEN OTHERS THEN
		RAISE info 'Transaction aborted: %', SQLERRM;
END;
$$;

CALL transfer_funds(1, 2, 5000);