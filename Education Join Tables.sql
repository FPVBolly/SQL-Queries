
DROP DATABASE education;

-- Creating a database --

CREATE DATABASE education;
	-- Telling SQL to use the education database --

USE education;
	-- Checking the database (refresh in SCHEMAS to see) --

SHOW DATABASES;
    -- Creating a table called: 'student' = (Structure of the FIELD Names) --

CREATE TABLE students(
	student_id INT NOT NULL AUTO_INCREMENT,
    student_fname VARCHAR (50) NOT NULL,
    student_lname VARCHAR (50) NOT NULL,
    student_age INT NOT NULL,
    PRIMARY KEY (student_id)
    );

EXPLAIN students; 
    -- See the 'student' Table Structure without Data --

	-- Creating the table DATA/values for the table called: 'student' --

    INSERT INTO students(student_fname, student_lname, student_age)
    VALUES
	('Ayesha', 'Anwar',  30),
    ('Anna',     'Dow',  25),
    ('Niouma',  'Gaku',  50),
    ('Ayaan',  'Haque',  38),
    ('Elenor', 'Thyme',  43),
    ('Mowreen',  'Fay',  29),
    ('Harman', 'Smith',  45);

	SELECT * FROM students; 
    -- See the final table with data records inserted into the table structure --

	-- Creating a table called: 'courses' = (Structure of the FIELD Names) --

CREATE TABLE course(
	course_id INT NOT NULL AUTO_INCREMENT,
    course_name VARCHAR (50) NOT NULL,
    duration_weeks INT NOT NULL,
    PRIMARY KEY (course_id)
	);

	EXPLAIN course; 
    -- See the 'course' Table Structure without Data --

	-- Creating the table DATA/values for the table called: course --

INSERT INTO course(course_name, duration_weeks)
    VALUES
	('Maths', 13),
    ('Physics', 26),
    ('Art', 50),
    ('English', 38),
    ('History', 43),
    ('Geography', 29),
    ('Drama', 45);

	SELECT * FROM course; 
    -- See the final 'course' table with data records inserted --

	-- Creating the relational table called: enrolment --

CREATE TABLE enrolment(
	enrolment_id INT NOT NULL AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    PRIMARY KEY (enrolment_id),
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (course_id) REFERENCES course (course_id)
   ) ;

EXPLAIN enrolment;
-- See the 'enrolment' Table Structure without Data --
 
INSERT INTO enrolment(student_id, course_id)
    VALUES
	(1,7),
    (2,6),
    (5,4),
    (3,7),
    (1,1),
    (5,7),
    (3,3);

SELECT * FROM enrolment; 

    -- See the final 'course' table with data records inserted --
    
-- This is showing Queries on the relational (enrollment) table, using Declarations & Joins  --
SELECT s.student_id, s.student_fname, s.student_lname, s.student_age, c.course_id, c.course_name, c.duration_weeks
FROM enrolment e
JOIN students s ON s.student_id = e.student_id
JOIN course c ON c.course_id = e.course_id
ORDER BY student_id DESC, course_id ASC
;

-- Queries on the tables above --

-- Students Table

SELECT *
FROM students
WHERE student_age >= 25;

SELECT *
FROM students
WHERE student_fname LIKE "%aa%";

SELECT student_age, student_fname, student_lname
FROM students
WHERE student_age >25 AND student_fname LIKE "a%";

-- Courses queries

SELECT duration_weeks
FROM course
WHERE course_name LIKE "P%";

SELECT duration_weeks, course_name
FROM course
WHERE NOT duration_weeks<14;

SELECT duration_weeks, course_name
FROM course
WHERE NOT duration_weeks<14;
