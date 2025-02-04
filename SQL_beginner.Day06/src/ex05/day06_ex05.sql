-- To satisfy Data Governance Policies need to add comments for the table and table's columns. Let’s apply this policy for the `person_discounts` table.
-- Please add English or Russian comments (it's up to you) that explain what is a business goal of a table and all included attributes.

COMMENT ON TABLE person_discounts
IS 'Table of personal discounts';

COMMENT ON COLUMN person_discounts.id
IS 'Primary key';

COMMENT ON COLUMN person_discounts.person_id
IS 'Identifier for person';

COMMENT ON COLUMN person_discounts.pizzeria_id
IS 'Identifier for pizzeria';

COMMENT ON COLUMN person_discounts.discount
IS 'Discount for person';
