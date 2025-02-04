-- Please find the name of pizzeria Dmitriy visited on January 8, 2022 and could eat pizza for less than 800 rubles.

SELECT pizzeria.name AS pizzeria_name
FROM menu
  JOIN pizzeria
  ON pizzeria.id = menu.pizzeria_id
  JOIN person_visits
  ON menu.pizzeria_id = person_visits.pizzeria_id
  JOIN person
  ON person.id = person_visits.person_id
WHERE person.name = 'Dmitriy'
    AND visit_date = '2022-01-08'
    AND menu.price < 800;

-- SELECT pizzeria.name AS pizzeria_name
-- FROM person_visits, menu, pizzeria, (
--   SELECT id
--   FROM person
--   WHERE name = 'Dmitriy'
--   ) AS dmitriy
-- WHERE dmitriy.id = person_id
--     AND visit_date = '2022-01-08'
--     AND person_visits.pizzeria_id = pizzeria.id
--     AND menu.price < 800;
