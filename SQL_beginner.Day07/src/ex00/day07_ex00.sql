-- Let’s make a simple aggregation, please write a SQL statement that returns person identifiers and corresponding number of visits in any pizzerias
--  and sorting by count of visits in descending mode and sorting in `person_id` in ascending mode. Please take a look at the sample of data below.
--
-- | person_id | count_of_visits |
--

SELECT person_id,
  COUNT(person_id) AS count_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY count_of_visits DESC, person_id ASC;
