-- Please write a SQL statement which returns the date of order from the `person_order` table and corresponding person name
-- (name and age are formatted as in the data sample below) which made an order from the `person` table. Add a sort by both columns in ascending mode.

SELECT order_date, (
  SELECT CONCAT(name, ' (age:', age, ')')
  FROM person
  WHERE person_id = id
  ) AS person_information
FROM person_order
ORDER BY order_date, person_information;
