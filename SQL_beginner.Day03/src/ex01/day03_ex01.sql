-- Please find all menu identifiers which are not ordered by anyone. The result should be sorted by identifiers.
-- The sample of output data is presented below.

SELECT id AS menu_id
FROM menu
EXCEPT
SELECT menu_id
FROM person_order
ORDER BY menu_id;

-- SELECT id AS menu_id
-- FROM menu
-- WHERE id NOT IN (
--   SELECT menu_id
--   FROM person_order
--   )
-- ORDER BY menu_id;
