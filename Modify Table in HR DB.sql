-- CREATING A TABLE IN HR DB --
-- snake_case_example, OR_UPPER_CASE // camelCaseIsWordUppercase //  PascalIsSnakePlusCamel --
USE HR;
CREATE TABLE employee_table (
 employee_id INT NOT NULL,
 job_title VARCHAR(50) NOT NULL,
 employee_first_name VARCHAR(50) NOT NULL,
 contact_number VARCHAR(13) NOT NULL,
 dob DATE NOT NULL,
  PRIMARY KEY (employee_id)
);

-- ADD = Amend table strucure --
ALTER TABLE employee_table
ADD COLUMN department VARCHAR(50);

-- MODIFY table strucure --
ALTER TABLE employee_table
MODIFY department VARCHAR(50) NOT NULL;

-- DROP command --
ALTER TABLE employee_table
DROP department;

-- EXPLAIN command shows the details and strucutre of the table, NOT the Contents --
EXPLAIN employee_table;

-- SELECT command shows the contents of the table -- 
SELECT * FROM employee_table;

-- insert data into the table --
INSERT INTO employee_table(employee_id, job_title, employee_first_name, contact_number, dob)
VALUES
(1, "Data Analyst", "John", "07834089111", "1999-01-01"),
(2, "Data Engineer", "Jane", "07834089112", "1998-02-02"),
(3, "CDO A-Corp", "Oliver", "07834089113", "1997-03-03"),
(4, "Salesforce BA", "Alice", "07834089114", "1996-04-04"),
(5, "Salesforce PM", "James", "07834089115", "1995-05-05"),
(6, "Salesforce CMO", "Anna", "07834089116", "1994-06-06"),
(7, "Product Owner", "Paul", "07834089117", "1993-07-07")
;

-- Update, Delete, +1 new record -- 
UPDATE employee_table
SET contact_number = "07-"
WHERE employee_id = 4;

DELETE FROM employee_table
WHERE employee_first_name = "Oliver";

INSERT INTO employee_table(employee_id, job_title, employee_first_name, contact_number, dob)
VALUES
(8, "Product Manager", "Sid", "07834089118", "1993-08-08");

-- REINSTATE DELETED RECORD --
INSERT INTO employee_table(employee_id, job_title, employee_first_name, contact_number, dob)
VALUES
(2, "Data Engineer", "Jane", "07834089112", "1998-02-02");

-- Logical Operators >> Add Salary & DOB to DB, -- 
