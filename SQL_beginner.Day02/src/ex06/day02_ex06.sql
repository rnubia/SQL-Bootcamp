-- Please find all pizza names (and corresponding pizzeria names using `menu` table) that Denis or Anna ordered.
-- Sort a result by both columns. The sample of output is presented below.

SELECT pizza_name,
  pizzeria.name AS pizzeria_name
FROM (
  SELECT *
  FROM person
  WHERE name = 'Denis' OR name = 'Anna'
  ) AS pair
  JOIN person_order
  ON pair.id = person_id
  JOIN menu
  ON person_order.menu_id = menu.id
  JOIN pizzeria
  ON menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, pizzeria_name;

-- SELECT pizza_name,
--     pizzeria.name AS pizzeria_name
-- FROM person_order, menu, pizzeria, (
--   SELECT id
--   FROM person
--   WHERE name = 'Denis' OR name = 'Anna'
--   ) AS pair
-- WHERE pair.id = person_id
--     AND menu_id = menu.id
--     AND pizzeria_id = pizzeria.id
-- ORDER BY pizza_name, pizzeria_name;
