-- Please find the names of all females who ordered both pepperoni and cheese pizzas (at any time and in any pizzerias).
-- Make sure that the result is ordered by person name. The sample of data is presented below.

SELECT name
FROM person
  JOIN person_order
  ON person.id = person_order.person_id
  JOIN menu
  ON menu.id = person_order.menu_id
WHERE menu.pizza_name IN ('pepperoni pizza', 'cheese pizza')
  AND  gender = 'female'
GROUP BY name
HAVING COUNT(menu.pizza_name) > 1;
