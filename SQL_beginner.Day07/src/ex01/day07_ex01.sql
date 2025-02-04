-- Please change a SQL statement from Exercise 00 and return a person name (not identifier). Additional clause is  we need to see only
-- top-4 persons with maximal visits in any pizzerias and sorted by a person name. Please take a look at the example of output data below.
--
-- | name | count_of_visits |
--

SELECT name,
  COUNT(name) AS count_of_visits
FROM person_visits
  JOIN person
  ON person_visits.person_id = person.id
GROUP BY name
ORDER BY count_of_visits DESC, name ASC
LIMIT 4;
