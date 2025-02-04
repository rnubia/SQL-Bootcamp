-- Please write a SQL statement that returns the amount of orders, average of price, maximum and minimum prices for sold pizza by
-- corresponding pizzeria restaurant. The result should be sorted by pizzeria name. Please take a look at the data sample below.
-- Round your average price to 2 floating numbers.
--
-- | name | count_of_orders | average_price | max_price | min_price |
--

SELECT pizzeria.name AS name,
  COUNT(pizzeria.name) AS count_of_orders,
  ROUND(AVG(price), 2) AS average_price,
  MAX(price) AS max_price,
  MIN(price) AS min_price
FROM pizzeria
  JOIN menu
  ON pizzeria.id = menu.pizzeria_id
  JOIN person_order
  ON menu.id = person_order.menu_id
GROUP BY pizzeria.name
ORDER BY pizzeria.name;
