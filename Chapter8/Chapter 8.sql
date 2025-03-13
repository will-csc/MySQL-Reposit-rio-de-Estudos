/*------------- COUNT --------------*/
SELECT count(salaries)
FROM pls_fy2014_pupld14a;

/*------------- COUNT DISTINCT --------------*/
SELECT count(libname)
FROM pls_fy2014_pupld14a;

SELECT count(DISTINCT libname)
FROM pls_fy2014_pupld14a;

/*------------- GROUP BY  --------------*/
SELECT stabr
FROM pls_fy2014_pupld14a
GROUP BY stabr ORDER BY stabr;

