DROP DATABASE IF EXISTS Import_Data;
CREATE DATABASE IF NOT EXISTS Import_Data;
USE Import_Data;

CREATE TABLE Imported_data (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Adicionando PRIMARY KEY (opcional)
    nome VARCHAR(50),
    age INT,
    gender ENUM('Male', 'Female')
);

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/WILLIAM/file.csv'
INTO TABLE Imported_data
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

