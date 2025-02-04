-- Please find pizzerias that have been visited more often by women or by men. For any SQL operators with sets save duplicates
-- (UNION ALL, EXCEPT ALL, INTERSECT ALL constructions). Please sort a result by the pizzeria name. The data sample is provided below.

(
  SELECT pizzeria.name AS pizzeria_name
  FROM person
    JOIN person_visits
    ON person.id = person_visits.person_id
    JOIN pizzeria
    ON person_visits.pizzeria_id = pizzeria.id
  WHERE  gender = 'female'
  EXCEPT ALL
  SELECT pizzeria.name AS pizzeria_name
  FROM person
    JOIN person_visits
    ON person.id = person_visits.person_id
    JOIN pizzeria
    ON person_visits.pizzeria_id = pizzeria.id
  WHERE  gender = 'male'
)
UNION ALL
(
  SELECT pizzeria.name AS pizzeria_name
  FROM person
    JOIN person_visits
    ON person.id = person_visits.person_id
    JOIN pizzeria
    ON person_visits.pizzeria_id = pizzeria.id
  WHERE  gender = 'male'
  EXCEPT ALL
  SELECT pizzeria.name AS pizzeria_name
  FROM person
    JOIN person_visits
    ON person.id = person_visits.person_id
    JOIN pizzeria
    ON person_visits.pizzeria_id = pizzeria.id
  WHERE  gender = 'female'
)
ORDER  BY pizzeria_name;
