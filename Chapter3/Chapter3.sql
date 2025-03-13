DROP DATABASE IF EXISTS Chapter3;
CREATE DATABASE Chapter3;
USE Chapter3;

CREATE TABLE char_data_types (
	varchar_column VARCHAR(10),
	char_column CHAR(10),
	text_column TEXT /* TEXT is a string type but without limit */
);

INSERT INTO char_data_types
VALUES
('abc', 'abc', 'abc'),
('defghi', 'defghi', 'defghi');

CREATE TABLE people (
	id SERIAL, /* --- SERIAL is a shortcut to create a int column
						with auto increment */
	person_name VARCHAR(100)
);

CREATE TABLE number_data_types (
	numeric_column NUMERIC(20,5), /* NUMERIC Here we define the digits and decimals
    (20 dígitos, 5 decimais) */
	real_column REAL, /* REAL is used to not precise values, like the ones used
    in scientific number */
	double_column DOUBLE PRECISION /* PRECISION keyword is used to precise values
    in wider range */
);

INSERT INTO number_data_types
VALUES
(.7, .7, .7),
(2.13579, 2.13579, 2.13579),
(2.1357987654, 2.1357987654, 2.1357987654);
SELECT * FROM number_data_types;

/* "AS" keyword is used rename a column for that query */
SELECT numeric_column * 10000000 AS "Fixed",
real_column * 10000000 AS "Float"
FROM number_data_types WHERE numeric_column = .7;

CREATE TABLE date_time_types (
	timestamp_column TIMESTAMP,
	interval_column DATE
);

/* Type conversion in MYSQL is used with a function "CAST()" and "AS TYPE" structure" */
SELECT timestamp_column, CAST(timestamp_column AS CHAR(10)) AS "timestamp_column as CHAR"
FROM date_time_types;

SELECT numeric_column,
       CAST(numeric_column AS SIGNED) AS int_value,
       /* INT cannot be used in CAST functions*/
       CAST(numeric_column AS CHAR(6)) AS varchar_value
       /* VARCHAR cannot be used in CAST functions*/
FROM number_data_types;

SELECT timestamp_column, CAST(timestamp_column AS CHAR(10))
FROM date_time_types;


