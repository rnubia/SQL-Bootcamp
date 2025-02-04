-- Please rewrite a SQL statement from exercise #07 by using NATURAL JOIN construction. The result must be the same like for exercise #07.

SELECT order_date, CONCAT(name, ' (age:', age, ')') AS person_information
FROM person
  NATURAL JOIN (
    SELECT order_date, person_id AS id
    FROM person_order
    )
ORDER BY order_date, person_information;
