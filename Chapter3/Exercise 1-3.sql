DROP DATABASE IF EXISTS Chapter3_Exercise;
CREATE DATABASE Chapter3_Exercise;
USE Chapter3_Exercise;

/*---------- EXERCISE 1-2 ----------*/
CREATE TABLE drivers(
	id INT,
    miles NUMERIC(3,2), /* 3 Digits */
    dia DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

/* ------- EXERCISE 3 --------*/
SELECT CAST(dia AS CHAR(10)) FROM drivers;


