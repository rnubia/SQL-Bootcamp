-- Please register new visits into Dominos restaurant from Denis and Irina on 24th of February 2022.
-- **Warning**: this exercise will probably be the cause  of changing data in the wrong way. Actually, you can restore the
-- initial database model with data from the link in the “Rules of the day” section and replay script from Exercises 07 and 08..

INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES (
  (SELECT MAX(id) FROM person_visits) + 1,
  (SELECT id FROM person WHERE name = 'Denis'),
  (SELECT id FROM pizzeria WHERE name = 'Dominos'),
  '2022-02-24'
  ), (
  (SELECT MAX(id) FROM person_visits) + 2,
  (SELECT id FROM person WHERE name = 'Irina'),
  (SELECT id FROM pizzeria WHERE name = 'Dominos'),
  '2022-02-24'
  );
