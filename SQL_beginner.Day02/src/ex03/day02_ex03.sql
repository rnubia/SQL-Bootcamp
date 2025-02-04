-- Let’s return back to Exercise #01, please rewrite your SQL by using the CTE (Common Table Expression) pattern.
-- Please move into the CTE part of your "day generator". The result should be similar like in Exercise #01

WITH generate_days(missing_date) AS (
    SELECT GENERATE_SERIES('2022-01-01'::DATE,'2022-01-10'::DATE, INTERVAL '1 DAY')::DATE
  )
SELECT missing_date
FROM generate_days
  LEFT JOIN (
    SELECT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
    ) AS visits
  ON generate_days.missing_date = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY missing_date;
