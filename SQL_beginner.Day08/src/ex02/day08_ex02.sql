-- Please for this task use the command line for PostgreSQL database (psql).
-- You need to check how your changes will be published in the database for other database users.
--
-- Actually, we need two active sessions (meaning 2 parallel sessions in the command lines).
--
-- Let’s check one of the famous “Lost Update Anomaly” database pattern but under `REPEATABLE READ` isolation level.
--
-- Please check a rating for “Pizza Hut” in a transaction mode for both Sessions and after that make `UPDATE` of rating to 4 value in session #1
-- and make `UPDATE` of rating to 3.6 value in session #2 (in the same order as in the picture).


-- Session #1 --
BEGIN TRANSACTION ISOLATION LEVEL
REPEATABLE READ;
----------------
-- Session #2 --
BEGIN TRANSACTION ISOLATION LEVEL
REPEATABLE READ;
----------------
-- Session #1 --
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
----------------
-- Session #2 --
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
----------------
-- Session #1 --
UPDATE pizzeria
SET rating = 4
WHERE name = 'Pizza Hut';
----------------
-- Session #2 --
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';
----------------
-- Session #1 --
COMMIT;
----------------
-- Session #2 --
COMMIT;
----------------
-- Session #1 --
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
----------------
-- Session #2 --
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
----------------
