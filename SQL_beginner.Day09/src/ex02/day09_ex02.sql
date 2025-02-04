-- Finally, we need to handle `DELETE` statements and make a copy of OLD states for all attribute’s values. Please create a trigger
-- `trg_person_delete_audit` and corresponding trigger function `fnc_trg_person_delete_audit`.
--
-- When you are ready please apply the SQL statement below.
--
-- `DELETE FROM person WHERE id = 10;`

CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER AS
$trg_person_delete_audit$
  BEGIN
    INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
    VALUES('D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    RETURN NULL;
  END;
$trg_person_delete_audit$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
  AFTER DELETE
  ON person
  FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;
