-- Looks like 2 functions from exercise 04 need a more generic approach. Please before our further steps drop these functions from the database.
-- Write a common SQL-function (please be aware, not pl/pgsql-function) with the name `fnc_persons`.
-- This function should have an `IN` parameter pgender with default value = ‘female’.
--
-- To check yourself and call a function, you can make a statement like below
-- (wow! you can work with a function like with a virtual table but with more flexibilities!).
--
--     select * from fnc_persons(pgender := 'male');
--     select * from fnc_persons();
--

DROP FUNCTION IF EXISTS fnc_persons_male;
DROP FUNCTION IF EXISTS fnc_persons_female;

CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS SETOF person AS
$persons$
  SELECT *
  FROM person
  WHERE gender = pgender;
$persons$
LANGUAGE sql;

SELECT * FROM fnc_persons(pgender := 'male');
SELECT * FROM fnc_persons();

-- CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
-- RETURNS TABLE (
--   id BIGINT,
--   name VARCHAR,
--   age INTEGER,
--   gender VARCHAR,
--   address VARCHAR
-- ) AS
-- $persons$
--   SELECT *
--   FROM person
--   WHERE gender = pgender;
-- $persons$
-- LANGUAGE sql;
