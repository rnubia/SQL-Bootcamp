-- Please write a SQL statement which satisfies a formula `(R - S)∪(S - R)` .
-- Where R is the `person_visits` table with filter by 2nd of January 2022, S is also `person_visits` table but with a different filter
-- by 6th of January 2022. Please make your calculations with sets under the `person_id` column and this column will be alone in a result.
-- The result please sort by `person_id` column and your final SQL please present in `v_symmetric_union` (*) database view.
--
-- (*) to be honest, the definition “symmetric union” doesn’t exist in Set Theory. This is the author's interpretation, the main idea
-- is based on the existing rule of symmetric difference.

CREATE VIEW v_symmetric_union AS (
  SELECT person_id
  FROM person_visits
  WHERE visit_date = '2022/01/02'
  EXCEPT
  SELECT person_id
  FROM person_visits
  WHERE visit_date = '2022/01/06'
  ) UNION (
  SELECT person_id
  FROM person_visits
  WHERE visit_date = '2022/01/06'
  EXCEPT
  SELECT person_id
  FROM person_visits
  WHERE visit_date = '2022/01/02'
  )
  ORDER BY person_id;
