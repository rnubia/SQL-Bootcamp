-- Please write a SQL statement which returns missing days for persons’ visits in January of 2022. Use `v_generated_dates` view
-- for that task and sort the result by missing_date column. The sample of data is presented below.

SELECT generated_date AS missing_date
FROM v_generated_dates
EXCEPT
SELECT visit_date
FROM person_visits
ORDER BY missing_date;
