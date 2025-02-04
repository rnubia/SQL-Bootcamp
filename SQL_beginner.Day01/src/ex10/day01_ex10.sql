-- Please write a SQL statement which returns a list of the person names which made an order for pizza in the corresponding pizzeria.
-- The sample result (with named columns) is provided below and yes ... please make ordering by 3 columns (`person_name`, `pizza_name`,
-- `pizzeria_name`) in ascending mode.

SELECT person.name AS pesrnon_name,
  menu.pizza_name AS pizza_name,
  pizzeria.name AS pizzeria_name
FROM person_order
  JOIN person
  ON person.id = person_order.person_id
  JOIN menu
  ON menu.id = person_order.menu_id
  JOIN pizzeria
  ON pizzeria.id = menu.pizzeria_id
ORDER BY pesrnon_name, pizza_name, pizzeria_name;
