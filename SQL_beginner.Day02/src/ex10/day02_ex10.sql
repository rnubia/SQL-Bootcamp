-- Please find the names of persons who live on the same address. Make sure that the result is ordered by 1st person,2nd person's
-- name and common address. The  data sample is presented below. Please make sure your column names are corresponding column names below.

SELECT table1.name AS person_name1,
  table2.name AS person_name2,
  table1.address AS common_adress
FROM person table1
  JOIN person table2
  ON table1.address = table2.address AND table1.id > table2.id
ORDER BY person_name1, person_name2, common_adress;

-- SELECT table1.name AS person_name1,
--   table2.name AS person_name2,
--   table1.address AS common_adress
-- FROM person table1, person table2
-- WHERE table1.address = table2.address AND table1.id > table2.id
-- ORDER BY person_name1, person_name2, common_adress;
