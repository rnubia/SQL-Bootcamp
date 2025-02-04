-- Please for this task use the command line for PostgreSQL database (psql).
-- You need to check how your changes will be published in the database for other database users.
--
-- Actually, we need two active sessions (meaning 2 parallel sessions in the command lines).
-- Please provide a proof that your parallel session can’t see your changes until you will make a `COMMIT`;
--
-- Take a look at the steps below.
--
-- **Session #1**
-- - update of rating for “Pizza Hut” to 5 points in a transaction mode .
-- - check that you can see a changes in session #1
--
-- **Session #2**
-- - check that you can’t see a changes in session #2
--
-- **Session #1**
-- - publish your changes for all parallel sessions.
--
-- **Session #2**
-- - check that you can see a changes in session #2
--

-- Session #1 --
BEGIN;

UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
----------------
-- Session #2 --
SELECT *
FROM pizzeria
WHERE name  = 'Pizza Hut';
----------------
-- Session #1 --
COMMIT;
----------------
-- Session #2 --
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
----------------
