-- Please write a SQL statement which returns a list of pizzerias names with corresponding rating value which have not been visited by persons.

SELECT name AS pizzeria_name, rating
FROM pizzeria
  LEFT JOIN person_visits
  ON pizzeria.id = pizzeria_id
WHERE pizzeria_id IS NULL;
