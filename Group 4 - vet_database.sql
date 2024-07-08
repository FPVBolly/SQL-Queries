-- create DB --
CREATE DATABASE vet_database;

-- SHOW DATABASES --
SHOW DATABASES;

USE vet_database;

-- create table --

CREATE TABLE pet_details (
 chip_id INT NOT NULL,
 animal_type VARCHAR(50) NOT NULL,
 pet_name VARCHAR(50) NOT NULL,
 breed VARCHAR(50) NOT NULL,
 age INT NOT NULL,
 dob DATE NOT NULL,
 PRIMARY KEY (chip_id)
);

-- insert data into the table --
INSERT INTO pet_details(chip_id, animal_type, pet_name, breed, age, dob)
VALUES
(001, "Cat", "Ginger", "Tabby", 5, "1999-01-01"),
(002, "Dog", "James", "Labradoodle", 6, "1998-02-02"),
(003, "Bird", "Oliver", "Parrot", 25, "1997-03-03"),
(004, "Fish", "Tango", "Goldfish", 2, "1996-04-04"),
(005, "Goat", "Barry", "Billy", 13, "1995-05-05"),
(006, "Snake", "Sid", "Asp", 34, "1994-06-06"),
(007, "Iguana", "Ian", "Great", 17, "1993-07-07")
;

Explain Table pet_details;

select *
from pet_details
where age>4 and age <12;
-- 1	Cat 2	Dog --

select *
from pet_details
where chip_id>004 or chip_id<002;
-- 1	Cat 5	Goat 6	Snake 7	Iguana --

select *
from pet_details
where Not animal_type = 'Cat';
-- Dog Bird Fish Goat Snake Iguana --

select sum(age)
from pet_details;
-- =102 --

select min(age)
from pet_details;
-- = 2 --

select max(age)
from pet_details;
-- =34 --

SELECT count(age)
from pet_details;
-- 7 --

SELECT count(*)
from pet_details
where age >14;
-- 3 --

SELECT avg(age)
from pet_details;
-- 14.5714 --

-- Add, Modify, drop -- 

Drop database vet_database;

-- ADD = Amend table strucure --
ALTER TABLE pet_details
ADD COLUMN pet_age INT;

-- MODIFY table strucure --
ALTER TABLE pet_details
MODIFY pet_age INT NOT NULL;

-- DROP command --
ALTER TABLE pet_details
DROP pet_age;

-- EXPLAIN command shows the details and strucutre of the table, NOT the Contents --
EXPLAIN pet_details;

-- SELECT command shows the contents of the table -- 
SELECT * FROM pet_details;
