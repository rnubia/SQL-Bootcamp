-- Please find the names of all males from Moscow or Samara cities who orders either pepperoni or mushroom pizzas (or both) .
-- Please order the result by person name in descending mode. The sample of output is presented below.

SELECT name
FROM person
  JOIN person_order
  ON person.id = person_order.person_id
  JOIN menu
  ON menu.id = person_order.menu_id
WHERE gender = 'male'
  AND (pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza')
  AND (address = 'Moscow' OR address = 'Samara')
ORDER BY name DESC;

-- SELECT DISTINCT name
-- FROM person, person_order, (
--   SELECT menu.id
--   FROM menu
--   WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza'
--   ) AS two_pizzas
-- WHERE person_order.menu_id = two_pizzas.id
--   AND (address = 'Moscow' OR address = 'Samara')
--   AND gender = 'male'
-- ORDER BY name DESC;
