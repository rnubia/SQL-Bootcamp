-- Please write a SQL or pl/pgsql function `func_minimum` (it’s up to you) that has an input parameter is an array of numbers
-- and the function should return a minimum value.
--
-- To check yourself and call a function, you can make a statement like below.
--
--     SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
--

CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS
$minimum$
  BEGIN
    RETURN MIN(arr[i])
    FROM generate_subscripts(arr, 1) ind(i);
  END;
$minimum$
LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
