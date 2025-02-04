-- Please register new orders from all persons for “greek pizza” on 25th of February 2022.
-- **Warning**: this exercise will probably be the cause  of changing data in the wrong way. Actually, you can restore the initial
-- database model with data from the link in the “Rules of the day” section and replay script from Exercises 07 , 08 ,09 , 10 and 11.

INSERT INTO person_order(id, person_id, menu_id, order_date)
SELECT
  GENERATE_SERIES(
    (SELECT MAX(id) FROM person_order) + 1,
    (SELECT MAX(id) FROM person_order) + (SELECT COUNT(*) FROM person)),
  GENERATE_SERIES(
    (SELECT MIN(id) FROM person), (SELECT MAX(id) FROM person)),
  (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
  '2022-02-25';
