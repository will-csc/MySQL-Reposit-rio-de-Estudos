USE mybase;

/*-------- EXERCISE 1 ---------*/
SELECT 
    COALESCE(c2000.county_name, c2010.county_name) AS county_name,
    COALESCE(c2000.state, c2010.state) AS state,
    c2000.county_name AS in_2000,
    c2010.county_name AS in_2010
FROM us_counties_2000 c2000
LEFT JOIN us_counties_2010 c2010
ON c2000.county_name = c2010.county_name
AND c2000.state = c2010.state
WHERE c2010.county_name IS NULL

UNION ALL

SELECT 
    COALESCE(c2000.county_name, c2010.county_name) AS county_name,
    COALESCE(c2000.state, c2010.state) AS state,
    c2000.county_name AS in_2000,
    c2010.county_name AS in_2010
FROM us_counties_2000 c2000
RIGHT JOIN us_counties_2010 c2010
ON c2000.county_name = c2010.county_name
AND c2000.state = c2010.state
WHERE c2000.county_name IS NULL;

/*-------- EXERCISE 2 ---------*/
SELECT 
    county_name,
    state,
    ((pop_2010 - pop_2000) / pop_2000) * 100 AS percent_change
FROM us_counties_population;

/*-------- EXERCISE 3 ---------*/
SELECT 
    county_name, 
    state, 
    ((pop_2010 - pop_2000) / pop_2000) * 100 AS percent_change
FROM us_counties_population
ORDER BY percent_change ASC
LIMIT 1;

