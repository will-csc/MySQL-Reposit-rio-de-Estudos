DROP DATABASE IF EXISTS mybase;
CREATE DATABASE mybase;
USE mybase;

CREATE TABLE departments (
	dept_id INT AUTO_INCREMENT PRIMARY KEY,
	dept VARCHAR(100) UNIQUE,
	city VARCHAR(100) UNIQUE
);
CREATE TABLE employees (
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	salary INT,
	dept_id INT,
	CONSTRAINT fk_dept_id FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
);
INSERT INTO departments (dept, city)
VALUES
('Tax', 'Atlanta'),
('IT', 'Boston');
INSERT INTO employees (first_name, last_name, salary, dept_id)
VALUES
('Nancy', 'Jones', 62500, 1),
('Lee', 'Smith', 59300, 1),
('Soo', 'Nguyen', 83000, 2),
('Janet', 'King', 95000, 2);

/*--------------- JOIN -----------------*/

-- JOIN already is a inner join
SELECT * FROM employees AS e JOIN departments AS d 
WHERE e.dept_id = d.dept_id;

SELECT * FROM employees JOIN departments
ON departments.dept_id = departments.dept_id;

/*-------------- OTHERS JOINS ----------------*/
CREATE TABLE schools_left (
	id INT PRIMARY KEY,
	left_school varchar(30)
);
CREATE TABLE schools_right (
	id INT PRIMARY KEY,
	right_school varchar(30)
);
INSERT INTO schools_left (id, left_school) VALUES
(1, 'Oak Street School'),
(2, 'Roosevelt High School'),
(5, 'Washington Middle School'),
(6, 'Jefferson High School');
INSERT INTO schools_right (id, right_school) VALUES
(1, 'Oak Street School'),
(2, 'Roosevelt High School'),
(3, 'Morrison Elementary'),
(4, 'Chase Magnet Academy'),
(6, 'Jefferson High School');

SELECT * FROM schools_left JOIN schools_right
ON schools_left.id = schools_right.id;

/*--------------- LEFT,RIGHT JOIN --------------*/
SELECT * FROM schools_left LEFT JOIN schools_right
ON schools_left.id = schools_right.id;

SELECT * FROM schools_left RIGHT JOIN schools_right
ON schools_left.id = schools_right.id;

/*-------------- FULL JOIN ---------------*/
SELECT * FROM schools_left FULL JOIN schools_right;

/*-------------- CROSS JOIN --------------*/
SELECT * FROM schools_left CROSS JOIN schools_right;

/*-------------- OTHERS JOIN --------------*/
SELECT *
FROM schools_left LEFT JOIN schools_right
ON schools_left.id = schools_right.id
WHERE schools_right.id IS NULL;

SELECT schools_left.id
FROM schools_left LEFT JOIN schools_right
ON schools_left.id = schools_right.id;

SELECT schools_left.id,
schools_left.left_school,
schools_right.right_school
FROM schools_left LEFT JOIN schools_right
ON schools_left.id = schools_right.id;

/*----------- JOINING MULTIPLE TABLES ------------*/
CREATE TABLE schools_enrollment (
	id integer,
	enrollment integer
);
CREATE TABLE schools_grades (
	id integer,
	grades varchar(10)
);
INSERT INTO schools_enrollment (id, enrollment)
VALUES
(1, 360),
(2, 1001),
(5, 450),
(6, 927);
INSERT INTO schools_grades (id, grades)
VALUES
(1, 'K-3'),
(2, '9-12'),
(5, '6-8'),
(6, '9-12');
SELECT lt.id, lt.left_school, en.enrollment, gr.grades
FROM schools_left AS lt LEFT JOIN schools_enrollment AS en
ON lt.id = en.id
LEFT JOIN schools_grades AS gr
ON lt.id = gr.id;