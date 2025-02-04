-- Please write a SQL statement which returns the missing days from 1st to 10th of January 2022 (including all days) for visits
-- of persons with identifiers 1 or 2 (it means days missed by both). Please order by visiting days in ascending mode.
-- The sample of data with column name is presented below.

SELECT missing_date::DATE
FROM GENERATE_SERIES('2022-01-01'::DATE,'2022-01-10'::DATE, INTERVAL '1 DAY')
  AS generate_days(missing_date)
LEFT JOIN (
  SELECT visit_date
  FROM person_visits
  WHERE person_id = 1 OR person_id = 2
  ) AS visits
  ON generate_days.missing_date = visits.visit_date
WHERE visits.visit_date is NULL
ORDER BY missing_date;
