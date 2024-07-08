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
 breed VARCHAR(13) NOT NULL,
 dob DATE NOT NULL,
 PRIMARY KEY (chip_id)
);

-- Add, Modify, drop -- 

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