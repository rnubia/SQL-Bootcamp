-- Please write a SQL statement that returns the person name and corresponding number of visits in any pizzerias if the person has visited more than 3 times (> 3).
-- Please take a look at the sample of data below.
--
-- | name | count_of_visits |
--

SELECT name,
  COUNT(name) AS count_of_visits
FROM person_visits
  JOIN person
  ON person.id = person_visits.person_id
GROUP BY name
HAVING COUNT(name) > 3;
