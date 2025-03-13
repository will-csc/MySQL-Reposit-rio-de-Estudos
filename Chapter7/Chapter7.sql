DROP DATABASE IF EXISTS mybase;
CREATE DATABASE mybase;
USE mybase;

/*----------------- PRIMARY KEY SYNTAX ------------------*/
CREATE TABLE natural_key_example (
	license_id VARCHAR(10) PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);
DROP TABLE natural_key_example;
CREATE TABLE natural_key_example (
	license_id VARCHAR(10),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	CONSTRAINT license_key PRIMARY KEY (license_id)
);

INSERT INTO natural_key_example (license_id, first_name, last_name)
VALUES ('T229901', 'Lynn', 'Malero');
/* The statement below is not going to work because of the
   same key
INSERT INTO natural_key_example (license_id, first_name, last_name)
VALUES ('T229901', 'Sam', 'Tracy');
Error Code: 1062. Duplicate entry 'T229901' for key 'natural_key_example.PRIMARY'
*/

CREATE TABLE natural_key_composite_example (
	student_id VARCHAR(10),
	school_day DATE,
	present BOOLEAN,
	CONSTRAINT student_key PRIMARY KEY (student_id, school_day)
);
/* The statement below is not going to work because of the
   same key
INSERT INTO natural_key_composite_example (student_id, school_day, present)
VALUES(775, '1-22-2017', 'Y');
INSERT INTO natural_key_composite_example (student_id, school_day, present)
VALUES(775, '1-23-2017', 'Y');
INSERT INTO natural_key_composite_example (student_id, school_day, present)
VALUES(775, '1-23-2017', 'N');
Error Code: 1292. Incorrect date value: '1-22-2017' for column 'school_day' at row 1
*/
CREATE TABLE surrogate_key_example (
	order_number INT AUTO_INCREMENT,
	product_name VARCHAR(50),
	order_date DATE,
	CONSTRAINT order_key PRIMARY KEY (order_number)
);
INSERT INTO surrogate_key_example (product_name, order_date)
VALUES ('Beachball Polish', '2015-03-17'),
('Wrinkle De-Atomizer', '2017-05-22'),
('Flux Capacitor', '1985-10-26');

SELECT * FROM surrogate_key_example;

/*----------------- FOREIGN KEYS -----------------*/
CREATE TABLE licenses (
	license_id VARCHAR(10),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	CONSTRAINT licenses_key PRIMARY KEY (license_id)
);
/* Key error and date

CREATE TABLE registrations (
	registration_id varchar(10),
	registration_date date,
	license_id varchar(10) REFERENCES licenses (license_id),
	CONSTRAINT registration_key PRIMARY KEY (registration_id, license_id)
);
INSERT INTO licenses (license_id, first_name, last_name)
VALUES ('T229901', 'Lynn', 'Malero');
INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A203391', '3/17/2017', 'T229901');
INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A75772', '3/17/2017', 'T000001');

Error Code: 1292. Incorrect date value: '3/17/2017' for column 'registration_date' at row 1 */
CREATE TABLE registrations (
	registration_id VARCHAR(10),
	registration_date DATE,
	license_id VARCHAR(10) REFERENCES licenses (license_id) ON DELETE CASCADE,
    /* "ON DELETE CASCADE" deletes all of the information about that registration */
	CONSTRAINT registration_key PRIMARY KEY (registration_id, license_id)
);

/*------------------------ CONSTRAINTS CHECKS  ------------------------*/

/* CONSTRAINTS CHECKS Are used to validate a condition before insert on a table */
CREATE TABLE check_constraint_example (
	user_id INT,
	user_role VARCHAR(50),
	salary INT,
	CONSTRAINT user_id_key PRIMARY KEY (user_id),
	CONSTRAINT check_role_in_list CHECK (user_role IN('Admin', 'Staff')),
	CONSTRAINT check_salary_not_zero CHECK (salary > 0)
);

/*ALTER TABLE registrations 
ADD CONSTRAINT grad_check CHECK (credits >= 120 AND tuition = 'Paid');*/

/*ALTER TABLE registrations
ADD CONSTRAINT sale_check CHECK (sale_price < retail_price);*/

/*------------------------ UNIQUE CHECKS  ------------------------*/

CREATE TABLE unique_constraint_example (
	contact_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(200),
	CONSTRAINT email_unique UNIQUE (email)
);

CREATE TABLE not_null_example (
	student_id INT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	CONSTRAINT student_id_key PRIMARY KEY (student_id)
);

/*------------------- REMOVE CONSTRAINTS ------------------*/
/*ALTER TABLE not_null_example DROP CONSTRAINT student_id_key;
ALTER TABLE not_null_example ADD CONSTRAINT student_id_key PRIMARY KEY
(student_id);
ALTER TABLE not_null_example ALTER COLUMN first_name DROP NOT NULL;
ALTER TABLE not_null_example ALTER COLUMN first_name SET NOT NULL;*/

