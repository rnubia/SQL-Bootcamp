-- Please create a Materialized View `mv_dmitriy_visits_and_eats` (with data included) based on SQL statement that finds the name of pizzeria
-- Dmitriy visited on January 8, 2022 and could eat pizzas for less than 800 rubles (this SQL you can find out at Day #02 Exercise #07).
--
-- To check yourself you can write SQL to Materialized View `mv_dmitriy_visits_and_eats` and compare results with your previous query.

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
  SELECT pizzeria.name AS pizzeria_name
  FROM menu
  JOIN pizzeria
  ON menu.pizzeria_id = pizzeria.id
  JOIN person_visits
  ON menu.pizzeria_id = person_visits.pizzeria_id
  JOIN person
  ON person_visits.person_id = person.id
  WHERE person.name = 'Dmitriy'
    AND visit_date = '2022-01-08'
    AND price < 800;
