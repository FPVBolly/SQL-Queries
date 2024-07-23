
DROP DATABASE car_database;

CREATE DATABASE car_database;

SHOW DATABASES;

USE car_database;

CREATE TABLE car_details(
	car_id INT NOT NULL AUTO_INCREMENT,
	car_brand VARCHAR (50) NOT NULL,
    car_model VARCHAR (50) NOT NULL,
    car_price DECIMAL NOT NULL,
    PRIMARY KEY (car_id)
);

DROP TABLE car_details;

EXPLAIN car_details;

    INSERT INTO car_details(car_brand, car_model, car_price)
    VALUES
	('Audi','Q4 Sportback etron',57500.00),
    ('BMW','i3s 120 Ah', 41526.00),
    ('Byton','MByte 95 kWh 4WD',64000.00),
    ('Ford','Mustang MachE ER RWD',54475.00),
    ('Jaguar','IPace',75351.00),
    ('Porsche','Taycan Turbo S',180781.00),
    ('Tesla','Roadster',215000.00)
    ;
 
SELECT * FROM car_details;

INSERT INTO car_details(car_brand, car_model, car_price)
VALUES
('INSERT VALUE','Roadster',66000.00);

-- UPDATE car_details
-- SET car_brand = "INSERTED VALUE"
-- WHERE car_brand = 8;

-- > imported table: car_spec 
-- 'car_speed','car_range','car_efficiency','car_charge'
-- '180 ','410 ','188 ','550 '
-- '190 ','390 ','244 ','460 '
-- '180 ','450 ','200 ','430 '
-- '200 ','365 ','232 ','340 '
-- '260 ','375 ','223 ','780 '
-- '410 ','970 ','206 ','920 '

EXPLAIN car_spec;

SELECT * FROM car_spec;

ALTER TABLE car_spec
ADD COLUMN spec_id INT AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER TABLE car_spec
DROP spec_id;

-- > Join table = car_search

CREATE TABLE car_search(
search_id INT NOT NULL AUTO_INCREMENT,
car_id INT NOT NULL,
spec_id INT NOT NULL,
PRIMARY KEY (search_id),
FOREIGN KEY (car_id) REFERENCES car_details (car_id),
FOREIGN KEY (spec_id) REFERENCES car_spec (spec_id)
);

EXPLAIN car_search;

    INSERT INTO car_search(car_id, spec_id)
    VALUES
	(1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
	(2, 1),
    (3, 2),
    (4, 3),
    (5, 4),
    (3, 1)
    ;

SELECT * FROM car_search;

SELECT d.car_id, d.car_brand, d.car_model, d.car_price, s.spec_id, s.car_speed, s.car_range, s.car_efficiency, s.car_charge
FROM car_search c
JOIN car_details d ON d.car_id = c.car_id 
JOIN car_spec s ON s.spec_id = c.spec_id
ORDER BY car_id DESC, s.spec_id ASC
;

-------------> -- Queries on the Join data --

SELECT d.car_id, d.car_brand, d.car_model, d.car_price, s.spec_id, s.car_speed, s.car_range, s.car_efficiency, s.car_charge
FROM car_search c
JOIN car_details d ON d.car_id = c.car_id 
JOIN car_spec s ON s.spec_id = c.spec_id
WHERE car_price >= '64000';


SELECT d.car_id, d.car_brand, d.car_model, d.car_price, s.spec_id, s.car_speed, s.car_range, s.car_efficiency, s.car_charge
FROM car_search c
JOIN car_details d ON d.car_id = c.car_id 
JOIN car_spec s ON s.spec_id = c.spec_id
WHERE car_model LIKE "M%";

-- Here are the operators you can use in the WHERE clause for a join table:
-- Comparison operators: These operators compare values between columns or between a column and a constant value. Examples include =, !=, <, >, <=, >=.
-- Logical operators: These operators combine conditions within the WHERE clause. Examples include AND, OR, NOT.
-- Set operators: These operators are used for set-based comparisons between results. However, they are not typically used within the WHERE clause for joins (more common in subqueries). Examples include IN, NOT IN, ANY, ALL.
-- BETWEEN operator: This operator checks if a value falls within a specific range.

SELECT d.car_id, d.car_brand, d.car_model, d.car_price, s.spec_id, s.car_speed, s.car_range, s.car_efficiency, s.car_charge
FROM car_search c
JOIN car_details d ON d.car_id = c.car_id 
JOIN car_spec s ON s.spec_id = c.spec_id
WHERE car_price != '57500';

SELECT d.car_id, d.car_brand, d.car_model, d.car_price, s.spec_id, s.car_speed, s.car_range, s.car_efficiency, s.car_charge
FROM car_search c
JOIN car_details d ON d.car_id = c.car_id 
JOIN car_spec s ON s.spec_id = c.spec_id
WHERE car_price > '54475' AND car_speed >= '150';

SELECT d.car_id, d.car_brand, d.car_model, d.car_price, s.spec_id, s.car_speed, s.car_range, s.car_efficiency, s.car_charge
FROM car_search c
JOIN car_details d ON d.car_id = c.car_id 
JOIN car_spec s ON s.spec_id = c.spec_id
WHERE car_price < '57500' OR car_speed <= '150';

SELECT d.car_id, d.car_brand, d.car_model, d.car_price, s.spec_id, s.car_speed, s.car_range, s.car_efficiency, s.car_charge
FROM car_search c
JOIN car_details d ON d.car_id = c.car_id 
JOIN car_spec s ON s.spec_id = c.spec_id
WHERE NOT car_speed >180;

SELECT d.car_id, d.car_brand, d.car_model, d.car_price, s.spec_id, s.car_speed, s.car_range, s.car_efficiency, s.car_charge
FROM car_search c
JOIN car_details d ON d.car_id = c.car_id 
JOIN car_spec s ON s.spec_id = c.spec_id
WHERE car_speed BETWEEN '160' AND '190'; 






