-- Let’s look at pl/pgsql functions right now.
--
-- Please create a pl/pgsql function  `fnc_person_visits_and_eats_on_date` based on SQL statement that finds the names of pizzerias which person
-- (`IN` pperson parameter with default value is ‘Dmitriy’) visited and in which he could buy pizza for less than the given sum in rubles
-- (`IN` pprice parameter with default value is 500) on the specific date
-- (`IN` pdate parameter with default value is 8th of January 2022).
--
-- To check yourself and call a function, you can make a statement like below.
--
--     select * from fnc_person_visits_and_eats_on_date(pprice := 800);
--     select * from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
--

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
  pperson VARCHAR DEFAULT 'Dmitriy',
  pprice NUMERIC DEFAULT 500,
  pdate DATE DEFAULT '2022-01-08'
) RETURNS SETOF VARCHAR AS
$person_visits_and_eats_on_date$
  BEGIN
    RETURN QUERY
    SELECT pizzeria.name
    FROM pizzeria
      JOIN menu
      ON pizzeria.id = menu.pizzeria_id
      JOIN person_visits
      ON pizzeria.id = person_visits.pizzeria_id
      JOIN person
      ON person_visits.person_id = person.id
    WHERE menu.price < pprice
      AND person.name = pperson
      AND person_visits.visit_date = pdate;
  END;
$person_visits_and_eats_on_date$
LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');

