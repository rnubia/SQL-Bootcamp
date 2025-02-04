-- Please write a SQL statement which returns unique pizza names from the `menu` table and orders them
-- by pizza_name column in descending mode. Please pay attention to the Denied section.

SELECT pizza_name
FROM menu
UNION
SELECT pizza_name
FROM menu
ORDER BY pizza_name DESC;
