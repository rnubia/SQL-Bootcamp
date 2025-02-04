-- Please for this task use the command line for PostgreSQL database (psql).
-- You need to check how your changes will be published in the database for other database users.
--
-- Actually, we need two active sessions (meaning 2 parallel sessions in the command lines).
--
-- Let’s check one of the famous “Non-Repeatable Reads” database pattern but under `SERIALIZABLE` isolation level.
--
-- Please check a rating for “Pizza Hut” in a transaction mode for session #1 and after that make `UPDATE` of rating
-- to 3.0 value in session #2 (in the same order as in the picture).


-- Session #1 --
BEGIN TRANSACTION ISOLATION LEVEL
SERIALIZABLE;
----------------
-- Session #2 --
BEGIN TRANSACTION ISOLATION LEVEL
SERIALIZABLE;
----------------
-- Session #1 --
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
----------------
-- Session #2 --
UPDATE pizzeria
SET rating = 3.0
WHERE name = 'Pizza Hut';

COMMIT;
----------------
-- Session #1 --
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

COMMIT;

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
----------------
-- Session #2 --
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
----------------
