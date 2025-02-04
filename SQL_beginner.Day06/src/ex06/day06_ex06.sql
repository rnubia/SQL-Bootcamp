-- Let’s create a Database Sequence with the name `seq_person_discounts` (starting from 1 value) and set a default value for id attribute of
-- `person_discounts` table to take a value from `seq_person_discounts` each time automatically.
-- Please be aware that your next sequence number is 1, in this case please set an actual value for database sequence based on formula
-- “amount of rows in person_discounts table” + 1. Otherwise you will get errors about Primary Key violation constraint.

CREATE SEQUENCE IF NOT EXISTS seq_person_discounts
INCREMENT BY 1 START 1;

ALTER TABLE person_discounts
ALTER COLUMN id
SET DEFAULT NEXTVAL('seq_person_discounts');

SELECT SETVAL(
  'seq_person_discounts',
  (SELECT COUNT(*) + 1 FROM person_discounts)
);
