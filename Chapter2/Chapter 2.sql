DROP DATABASE IF EXISTS mybase;
CREATE DATABASE mybase;
USE mybase;
CREATE TABLE my_table(id INT,nome VARCHAR(50),age INT);
CREATE TABLE teachers (id INT, first_name VARCHAR(50), last_name VARCHAR(50),
						school VARCHAR(50), hire_date DATE, salary NUMERIC);
INSERT INTO teachers (id, first_name, last_name, school, hire_date, salary)
VALUES 
(1, 'Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
(2, 'Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
(3, 'Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
(4, 'Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
(5, 'Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
(6, 'Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);

/*------------ CHAPTER 2 -------------*/
SELECT * FROM my_table;

SELECT * FROM teachers;

/* Syntax for querying subset of columns
SELECT some_column, another_column, amazing_column FROM table_name;
*/
SELECT last_name, first_name, salary FROM teachers;

SELECT DISTINCT school FROM teachers; /* "DISTINCT" keyword eliminates any duplicates */
SELECT DISTINCT hire_date FROM teachers;
SELECT DISTINCT school, salary FROM teachers;

SELECT first_name, last_name, salary FROM teachers
ORDER BY salary; /* "ORDER BY" order a query by some column */
SELECT first_name, last_name, salary FROM teachers
ORDER BY salary DESC; /* "ORDER BY" with "DESC" order a query in reverse order 
						by some column */
SELECT last_name, school, hire_date
FROM teachers ORDER BY school ASC, hire_date DESC; /* More columns ordered */

SELECT last_name, school, hire_date
FROM teachers
WHERE school = 'Myers Middle School';

/*-------------- OTHERS OPERATORS --------------*/
SELECT * FROM teachers WHERE school = 'Baker Middle';
SELECT * FROM teachers WHERE school != 'Baker Middle';
SELECT * FROM teachers WHERE salary > 20000;
SELECT * FROM teachers WHERE salary < 60500;
SELECT * FROM teachers WHERE salary >= 20000;
SELECT * FROM teachers WHERE salary <= 60500;
SELECT * FROM teachers WHERE salary BETWEEN 20000 AND 40000;
SELECT * FROM teachers WHERE last_name IN ('Bush','Roush');
SELECT * FROM teachers WHERE first_name LIKE 'Sam%';
SELECT * FROM teachers WHERE first_name LIKE 'sam%';
SELECT * FROM teachers WHERE first_name NOT LIKE 'sam%';

SELECT first_name, last_name, school
FROM teachers WHERE first_name = 'Janet';

SELECT school FROM teachers
WHERE school != 'F.D. Roosevelt HS';

SELECT first_name, last_name, hire_date
FROM teachers WHERE hire_date < '2000-01-01';

SELECT first_name, last_name, salary
FROM teachers WHERE salary >= 43500;

SELECT first_name, last_name, school, salary
FROM teachers WHERE salary BETWEEN 40000 AND 65000;

/*  Percent sign (%) A wildcard matching one or more characters
	Underscore (_) A wildcard matching just one character */
SELECT first_name FROM teachers 
WHERE first_name LIKE 'sam%';

/* AND and OR operators */
SELECT * FROM teachers WHERE school = 'Myers Middle School' AND salary < 40000;

SELECT * FROM teachers WHERE last_name = 'Cole'OR last_name = 'Bush';

SELECT * FROM teachers WHERE school = 'F.D. Roosevelt HS' 
AND (salary < 38000 OR salary > 40000);

/* ALL OPERATORS USED IN SENTENCE */
SELECT first_name, last_name, school, hire_date, salary
FROM teachers WHERE school LIKE '%Roos%'
ORDER BY hire_date DESC;











