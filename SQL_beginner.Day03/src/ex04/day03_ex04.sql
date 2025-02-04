-- Please find a union of pizzerias that have orders either from women or  from men. Other words, you should find set of pizzerias
-- names have been ordered by females only and make "UNION" operation with set of pizzerias names have been ordered by males only.
-- Please be aware with word “only” for both genders. For any SQL operators with sets don’t save duplicates (`UNION`, `EXCEPT`, `INTERSECT`).
-- Please sort a result by the pizzeria name. The data sample is provided below.

(
  SELECT pizzeria.name AS pizzeria_name
  FROM   person
    JOIN person_order
    ON person.id = person_order.person_id
    JOIN menu
    ON person_order.menu_id = menu.id
    JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
  WHERE  gender = 'female'
  EXCEPT
  SELECT pizzeria.name AS pizzeria_name
  FROM   person
    JOIN person_order
    ON person.id = person_order.person_id
    JOIN menu
    ON person_order.menu_id = menu.id
    JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
  WHERE  gender = 'male'
)
UNION
(
  SELECT pizzeria.name AS pizzeria_name
  FROM   person
    JOIN person_order
    ON person.id = person_order.person_id
    JOIN menu
    ON person_order.menu_id = menu.id
    JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
  WHERE  gender = 'male'
  EXCEPT
  SELECT pizzeria.name AS pizzeria_name
  FROM   person
    JOIN person_order
    ON person.id = person_order.person_id
    JOIN menu
    ON person_order.menu_id = menu.id
    JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
  WHERE  gender = 'female'
)
ORDER  BY pizzeria_name;
