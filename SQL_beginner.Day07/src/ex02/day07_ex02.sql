-- Please write a SQL statement to see 3 favorite restaurants by visits and by orders in one list (please add an action_type column with values
-- ‘order’ or ‘visit’, it depends on data from the corresponding table). Please take a look at the sample of data below.
-- The result should be sorted by action_type column in ascending mode and by count column in descending mode.
--
-- | name | count | action_type |
--

(
SELECT name,
  COUNT(name) AS count,
  'order' AS action_type
FROM person_order
  JOIN menu
  ON person_order.menu_id = menu.id
  JOIN pizzeria
  ON menu.pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY count DESC
LIMIT 3
) UNION (
SELECT name,
  COUNT(name) AS count,
  'visit' AS action_type
FROM person_visits
  JOIN pizzeria
  ON person_visits.pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY count DESC
LIMIT 3
)
ORDER BY action_type, count DESC;
