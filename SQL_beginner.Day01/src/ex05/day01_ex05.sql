-- Please write a SQL statement which returns all possible combinations between `person` and `pizzeria` tables and please set
-- ordering by person identifier and then by pizzeria identifier columns. Please take a look at the result sample below.
-- Please be aware column's names can be different for you.

SELECT *
FROM person, pizzeria
ORDER BY person.id, pizzeria.id;
