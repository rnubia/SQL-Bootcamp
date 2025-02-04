-- Please for this task use the command line for PostgreSQL database (psql).
-- You need to check how your changes will be published in the database for other database users.
--
-- Actually, we need two active sessions (meaning 2 parallel sessions in the command lines).
--
-- Let’s check one of the famous “Phantom Reads” database pattern but under `REPEATABLE READ` isolation level.
--
-- Please summarize all ratings for all pizzerias in a transaction mode for session #1 and after that make `UPDATE` of rating
-- to 5 value for “Pizza Hut” restaurant in session #2 (in the same order as in the picture).


-- Session #1 --
BEGIN TRANSACTION ISOLATION LEVEL
REPEATABLE READ;
----------------
-- Session #2 --
BEGIN TRANSACTION ISOLATION LEVEL
REPEATABLE READ;
----------------
-- Session #1 --
SELECT SUM(rating)
FROM pizzeria;
----------------
-- Session #2 --
UPDATE pizzeria
SET rating = 5.0
WHERE name = 'Pizza Hut';

COMMIT;
----------------
-- Session #1 --
SELECT SUM(rating)
FROM pizzeria;

COMMIT;

SELECT SUM(rating)
FROM pizzeria;
----------------
-- Session #2 --
SELECT SUM(rating)
FROM pizzeria;
----------------
