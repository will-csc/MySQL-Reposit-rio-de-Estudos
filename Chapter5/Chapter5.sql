USE mybase;

/* -------------- ADDING, SUBTRACTING AND MULTIPLYING --------------*/
SELECT 2 + 2;
SELECT 9 - 1;
SELECT 3 * 4;

/* --------------  DIVISION AND MODULO --------------*/
SELECT 11 / 6;
SELECT 11 % 6;
SELECT 11.0 / 6;
SELECT CAST(11 AS DOUBLE) / 6;

/* ------------- EXPONENTS, ROOTS AND FACTORIALS --------------*/
/*
DELIMITER //


CREATE FUNCTION FACTORIAL(n INT) RETURNS BIGINT
DETERMINISTIC
BEGIN
    DECLARE result BIGINT DEFAULT 1;
    DECLARE i INT DEFAULT 1;
    WHILE i <= n DO
        SET result = result * i;
        SET i = i + 1;
    END WHILE;
    RETURN result;
END //

DELIMITER ;
*/

SELECT POW(3, 4);
SELECT SQRT(10);
SELECT POWER(10, 1/3);
SELECT FACTORIAL(4);

/*------------ MINDING THE ORDER OF OPERATIONS ---------------*/
SELECT 7 + 8 * 9;
SELECT (7 + 8) * 9;

SELECT POW(3,3) - 1;
SELECT POW(3,(3-1));

/* ------------ Finding the Median with Percentile Functions --------------*/
CREATE TABLE percentile_test (
	numbers INT
);

INSERT INTO percentile_test (numbers) VALUES
(1), (2), (3), (4), (5), (6);

SELECT 
    numbers AS percentile_cont
FROM (
    SELECT numbers, 
           NTILE(100) OVER (ORDER BY numbers) AS percentile_rank
    FROM percentile_test
) ranked
WHERE percentile_rank = 50;

CREATE TABLE dados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    valor DOUBLE NOT NULL
);
INSERT INTO dados (valor) VALUES
(10), (20), (30), (40), (50), (60), (70), (80), (90), (100);


SELECT AVG(subquery.valor) AS mediana
FROM (
    SELECT valor
    FROM dados
    ORDER BY valor
    LIMIT 2 - (SELECT COUNT(*) FROM dados) % 2  -- Pega 1 ou 2 valores centrais
    OFFSET FLOOR((SELECT COUNT(*) FROM dados) / 2)  -- Pula metade dos registros
) AS subquery;

DELIMITER $$

CREATE FUNCTION median_from_table(table_name VARCHAR(64), column_name VARCHAR(64))
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    SET @sql = CONCAT(
        'SELECT AVG(t.', column_name, ') 
         FROM (SELECT ', column_name, '
               FROM ', table_name, '
               ORDER BY ', column_name, '
               LIMIT 2 - (SELECT COUNT(*) FROM ', table_name, ') % 2
               OFFSET FLOOR((SELECT COUNT(*) FROM ', table_name, ') / 2)
              ) AS t'
    );
    
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
    RETURN NULL;
END $$

DELIMITER ;

SELECT median_from_table('dados', 'valor') AS mediana;


