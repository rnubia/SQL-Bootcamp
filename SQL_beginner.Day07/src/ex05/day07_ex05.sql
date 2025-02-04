-- Please write a simple SQL query that returns a list of unique person names who made orders in any pizzerias.
-- The result should be sorted by person name. Please take a look at the sample below.
--
-- | name |
--

SELECT DISTINCT name
FROM person_visits
  JOIN person
  ON person.id = person_visits.person_id
ORDER BY name;
