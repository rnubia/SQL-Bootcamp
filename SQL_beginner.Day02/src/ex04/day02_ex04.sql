-- Find full information about all possible pizzeria names and prices to get mushroom or pepperoni pizzas. Please sort the result
-- by pizza name and pizzeria name then. The result of sample data is below (please use the same column names in your SQL statement).

SELECT pizza_name, pizzeria.name AS pizzeria_name, price
FROM pizzeria
  LEFT JOIN menu
  ON pizzeria.id = pizzeria_id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name;
