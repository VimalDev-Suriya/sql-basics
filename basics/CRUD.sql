INSERT INTO students(id, fullname, fathers_name, age, email) VALUES (1, 'Suriya', 'Devaraj', 30, 'sk@eg.com')

-- I can change the keys and change the values also
INSERT INTO students(fathers_name, fullname, age, email) VALUES ('Sivakumar', 'Keerthana', 25, 'sk@eg.com')

-- * Above code fails because we mentioned that email should be uniuq to everyone
-- ERROR:  duplicate key value violates unique constraint "students_email_key"
-- Key (email)=(sk@g.com) already exists. 
-- SQL state: 23505
-- Detail: Key (email)=(sk@g.com) already exists.

-- INSERTING MULTIPLE VALUES
INSERT INTO students(fathers_name, fullname, age, email) VALUES 
('Piyush'/'s Father', 'Piyush',40, 'piyuesh@.com'),
('Suyesh'/'s Father', 'Suyesh', 37, 'suyesh@g.com'),
('Ravi'/'s Father', 'Ravi', 40, NULL);

UPDATE students
SET marks = 10, age = 70
WHERE marks > 90

-- ##################### DELETE

-- Sorting by descinding order
DELETE FROM students
WHERE id IN (
	SELECT id FROM students ORDER BY id DESC LIMIT 2
)

DELETE FROM students
WHERE id = 7

-- ##################### Select

EXPLAIN ANALYZE
SELECT * FROM students; -- To read all the content from the Students table
SELECT id FROM students ORDER BY id DESC LIMIT 2