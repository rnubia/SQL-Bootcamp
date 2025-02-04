-- We want to be stronger with data and don’t want to lose any event of changes. Let’s implement an audit feature for INSERT’s incoming changes.
-- Please create a table `person_audit` with the same structure like a person table but please add a few additional changes.
-- Take a look at the table below with descriptions for each column.
--
-- | Column | Type | Description |
-- | ------ | ------ | ------ |
-- | created | timestamp with time zone | timestamp when a new event has been created.  Default value is a current timestamp and NOT NULL |
-- | type_event | char(1) | possible values I (insert), D (delete), U (update). Default value is ‘I’. NOT NULL.
--   - Add check constraint `ch_type_event` with possible values ‘I’, ‘U’ and ‘D’ |
-- | row_id |bigint | copy of person.id. NOT NULL |
-- | name |varchar | copy of person.name (no any constraints) |
-- | age |integer | copy of person.age (no any constraints) |
-- | gender |varchar | copy of person.gender (no any constraints) |
-- | address |varchar | copy of person.address (no any constraints) |
--
-- Actually, let’s create a Database Trigger Function with the name `fnc_trg_person_insert_audit` that should process `INSERT` DML traffic
-- and make a copy of a new row to the person_audit table.
--
-- Just a hint, if you want to implement a PostgreSQL trigger (please read it in PostgreSQL documentation), you need to make 2 objects:
-- Database Trigger Function and Database Trigger.
--
-- So, please define a Database Trigger with the name `trg_person_insert_audit` with the next options
-- - trigger with “FOR EACH ROW” option
-- - trigger with “AFTER INSERT”
-- - trigger calls fnc_trg_person_insert_audit trigger function
--
-- When you are ready with trigger objects then please make an `INSERT` statement into the person table.
-- `INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');`

CREATE TABLE IF NOT EXISTS person_audit(
  created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  type_event CHAR(1) NOT NULL DEFAULT 'I',
  row_id BIGINT NOT NULL,
  name VARCHAR,
  age INTEGER,
  gender VARCHAR,
  address VARCHAR,
  CONSTRAINT ch_type_event CHECK(type_event IN ('I', 'U', 'D'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS
$trg_person_insert_audit$
  BEGIN
    INSERT INTO person_audit(row_id, name, age, gender, address)
    VALUES(NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NULL;
  END;
$trg_person_insert_audit$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
  AFTER INSERT
  ON person
  FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');
