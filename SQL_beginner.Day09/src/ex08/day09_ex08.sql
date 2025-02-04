-- Please write a SQL or pl/pgsql function `fnc_fibonacci` (it’s up to you) that has an input parameter pstop with type integer
-- (by default is 10) and the function output is a table with all Fibonacci numbers less than pstop.
--
-- To check yourself and call a function, you can make a statements like below.
--
--     select * from fnc_fibonacci(100);
--     select * from fnc_fibonacci();
--

CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS SETOF INTEGER AS
$fibonacci$
  WITH RECURSIVE fibo(a, b) AS (
    VALUES (0, 1)
    UNION ALL
    SELECT b, a + b
    FROM fibo
    WHERE b < pstop
  )
  SELECT a
  FROM fibo;
$fibonacci$
LANGUAGE sql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
