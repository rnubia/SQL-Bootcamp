-- Please write a SQL statement that returns orders with actual price and price with applied discount for each person in the
-- corresponding pizzeria restaurant and sort by person name, and pizza name. Please take a look at the sample of data below.
--
-- | name | pizza_name | price | discount_price | pizzeria_name |
--

SELECT person.name, pizza_name, price,
  ROUND(price - (price * discount / 100), 2) AS discount_price,
  pizzeria.name AS pizzeria_name
FROM person
  JOIN person_order
  ON person.id = person_order.person_id
  JOIN menu
  ON person_order.menu_id = menu.id
  JOIN pizzeria
  ON menu.pizzeria_id = pizzeria.id
  JOIN person_discounts
  ON person_discounts.person_id = person.id
    AND pizzeria.id = person_discounts.pizzeria_id
ORDER BY name, pizza_name;
