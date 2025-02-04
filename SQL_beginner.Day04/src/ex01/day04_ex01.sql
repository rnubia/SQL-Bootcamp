-- Please use 2 Database Views from Exercise #00 and write SQL to get female and male person names in one list.
-- Please set the order by person name. The sample of data is presented below.

SELECT name
FROM v_persons_male
UNION
SELECT name
FROM v_persons_female
ORDER BY name;
