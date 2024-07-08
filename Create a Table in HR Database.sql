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
-- EXPLAIN command shows the details and strucutre of the table, NOT the Contents --
EXPLAIN employee_table;

-- SELECT command shows the contents of the table -- 
SELECT * FROM employee_table;