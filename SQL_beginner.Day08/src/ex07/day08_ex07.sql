-- Please for this task use the command line for PostgreSQL database (psql).
-- You need to check how your changes will be published in the database for other database users.
--
-- Actually, we need two active sessions (meaning 2 parallel sessions in the command lines).
--
-- Let’s reproduce a deadlock situation in our database.
--
-- Please write any SQL statement with any isolation level (you can use default setting) on the `pizzeria` table to reproduce this deadlock situation.


-- Session #1 --
BEGIN TRANSACTION ISOLATION LEVEL
READ COMMITTED;
----------------
-- Session #2 --
BEGIN TRANSACTION ISOLATION LEVEL
READ COMMITTED;
----------------
-- Session #1 --
UPDATE pizzeria
SET rating = 3.0
WHERE id = 1;
----------------
-- Session #2 --
UPDATE pizzeria
SET rating = 4.0
WHERE id = 2;
----------------
-- Session #1 --
UPDATE pizzeria
SET rating = 3.0
WHERE id = 2;
----------------
-- Session #2 --
UPDATE pizzeria
SET rating = 4.0
WHERE id = 1;
----------------
-- Session #1 --
COMMIT WORK;
----------------
-- Session #2 --
COMMIT WORK;
----------------
