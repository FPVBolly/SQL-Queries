-- CREATING A TABLE IN HR DB --
-- snake_case_example, OR_UPPER_CASE // camelCaseIsWordUppercase //  PascalIsSnakePlusCamel --
USE HR;
CREATE TABLE employee_details (
 employee_id INT NOT NULL,
 job_title VARCHAR(50) NOT NULL,
 employee_first_name VARCHAR(50) NOT NULL,
 employee_last_name VARCHAR(50) NOT NULL,
 age INT NOT NULL,
 salary DECIMAL (7,2) NOT NULL,
 contact_number VARCHAR(13) NOT NULL,
 dob DATE NOT NULL,
  PRIMARY KEY (employee_id)
);

-- ADD = Amend table strucure --
ALTER TABLE employee_details
ADD COLUMN department VARCHAR(50);

-- MODIFY table strucure --
ALTER TABLE employee_table
MODIFY department VARCHAR(50) NOT NULL;

-- DROP command --
ALTER TABLE employee_details
DROP department;

-- EXPLAIN command shows the details and strucutre of the table, NOT the Contents --
EXPLAIN employee_details;

-- SELECT command shows the contents of the table -- 
SELECT * FROM employee_details;

-- insert data into the table --
INSERT INTO employee_details(employee_id, job_title, employee_first_name, employee_last_name, age, salary, contact_number, dob)
VALUES
(1, "Data Analyst", "John", "Doe", 25, 25000.00, "07834089111", "1999-01-01"),
(2, "Data Engineer", "Jane", "Dee", 25, 15000.00, "07834089112", "1998-02-02"),
(3, "CDO A-Corp", "Oliver", "Donant", 25, 35000.00, "07834089113", "1997-03-03"),
(4, "Salesforce BA", "Alice", "Wonder", 25, 40000.00, "07834089114", "1996-04-04"),
(5, "Salesforce PM", "James", "Bond", 25, 45000.00, "07834089115", "1995-05-05"),
(6, "Salesforce CMO", "Anna", "Bent", 25, 55000.00, "07834089116", "1994-06-06"),
(7, "Product Owner", "Paul", "Orloff", 25, 60000.00, "07834089117", "1993-07-07")
;

-- Update, Delete, +1 new record -- 
UPDATE employee_details
SET contact_number = "07-"
WHERE employee_id = 4;

DELETE FROM employee_details
WHERE employee_first_name = "Oliver";

INSERT INTO employee_details(employee_id, job_title, employee_first_name, employee_last_name, age, salary, contact_number, dob)
VALUES
(8, "Product Manager", "Sid", "07834089118", "1993-08-08");

-- REINSTATE DELETED RECORD --
INSERT INTO employee_details(employee_id, job_title, employee_first_name, employee_last_name, age, salary, contact_number, dob)
VALUES
(2, "Data Engineer", "Jane", "07834089112", "1998-02-02");

-- Logical Operators >> Added Salary & AGE to DB, -- 
SELECT employee_id, job_title, employee_first_name, employee_last_name, age, salary, contact_number, dob
FROM employee_details
WHERE salary >= 45000;

SELECT employee_id, job_title, employee_first_name, employee_last_name, age, salary, contact_number, dob
FROM employee_details
WHERE salary >= 45000 AND < 20000;

SELECT *
FROM employee_details
WHERE salary <= 45000.00 AND > 20000.00;

SELECT dob
FROM employee_details
WHERE dob > 1993-07-07;

SELECT *
FROM employee_details
WHERE employee_id=1 OR 4;

SELECT *
FROM employee_details
WHERE salary NOT <60000.00

SELECT employee_last_name
FROM employee_details
ORDER BY employee_last_name ASC

SELECT sum(salary)
FROM employee_details

SELECT min(salary)
FROM employee_details

SELECT max(salary)
FROM employee_details

SELECT count(salary)
FROM employee_details

SELECT count(*)
FROM employee_details
WHERE salary >40;

SELECT avg(salary)
FROM employee_details
