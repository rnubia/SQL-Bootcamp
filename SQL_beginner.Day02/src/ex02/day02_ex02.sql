-- Please write a SQL statement that returns a whole list of person names visited (or not visited) pizzerias during the period
-- from 1st to 3rd of January 2022 from one side and the whole list of pizzeria names which have been visited (or not visited)
-- from the other side. The data sample with needed column names is presented below. Please pay attention to the substitution
-- value ‘-’ for `NULL` values in `person_name` and `pizzeria_name` columns. Please also add ordering for all 3 columns.

SELECT COALESCE(person.name,'-') AS person_name,
  visit_date,
  COALESCE(pizzeria.name,'-') AS pizzeria_name
FROM person
  FULL JOIN (
    SELECT *
    FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
    ) AS person_dates
  ON person_dates.person_id = person.id
  FULL JOIN pizzeria
  ON person_dates.pizzeria_id = pizzeria.id
ORDER BY person_name, visit_date, pizzeria_name;
