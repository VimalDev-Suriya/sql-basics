CREATE DATABASE student_dev;

CREATE TABLE quarterly_assement(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	maths SMALLINT CHECK(maths BETWEEN 0 and 100),
	science SMALLINT CHECK(maths BETWEEN 0 and 100),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE quarterly_assement
ADD COLUMN social_science SMALLINT CHECK(social_science BETWEEN 0 AND 100)

INSERT INTO quarterly_assement(name, maths, science, social_science) VALUES 
('Keerthana', 100, 100, 97),
('Kavya', 75, 90, 100),
('Ravi', 100, 100, 100),
('Abirami', 100, 99, 100),
('Dhoni', 65, 73, 65),
('Rohit', 70, 50, 61),
('Virat', 64, 31, 45);

SELECT * FROM quarterly_assement

-- Always accept only one Column Name
SELECT COUNT(name) FROM quarterly_assement

-- Always accept only one Column Name
SELECT SUM(maths) FROM quarterly_assement

-- Always accept only one Column Name
SELECT AVG(maths) FROM quarterly_assement

-- Always accept only one Column Name
SELECT MAX(maths) FROM quarterly_assement

-- Always accept only one Column Name
SELECT MIN(maths) FROM quarterly_assement

-- All of the above Queries return the single conslidated result

SELECT name, maths, science, social_science, maths + science + social_science as total FROM quarterly_assement

-- Aggrecate Functions should always be used in conjuction with GROUP BY clause and vice versa
-- SELECT name, maths FROM quarterly_assement GROUP BY name => This will throw compile time error
SELECT social_science, COUNT(social_science) FROM quarterly_assement
GROUP BY social_science

SELECT  maths, COUNT(maths) as maths_count, science, COUNT(science) as science_count FROM quarterly_assement
GROUP BY maths, science

-- Having helps to narrow down the result of aggregate functions
SELECT social_science, AVG(social_science) FROM quarterly_assement
GROUP BY social_science
HAVING AVG(social_science) > 60
