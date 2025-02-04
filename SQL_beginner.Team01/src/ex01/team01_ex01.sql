-- Before deeper diving into this task please apply INSERTs statements below.
--
-- `insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');`
-- `insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');`
--
-- Please write a SQL statement that returns all Users , all Balance transactions (in this task please ignore currencies that do not have
-- a key in the `Currency` table ) with currency name and calculated value of currency in USD for the nearest day.
--
-- Below presented a table of result columns and corresponding calculation formula.
--
-- | Output Column | Formula (pseudocode) |
-- | ------ | ------ |
-- | name | source: user.name if user.name is NULL then return `not defined` value |
-- | lastname | source: user.lastname if user.lastname is NULL then return `not defined` value |
-- | currency_name | source: currency.name |
-- | currency_in_usd | involved sources: currency.rate_to_usd, currency.updated, balance.updated.Take a look at a graphical interpretation of the formula below.|
--
-- - need to find a nearest rate_to_usd of currency at the past (t1)
-- - if t1 is empty (means no any rates at the past) then find a nearest rate_to_usd of currency at the future (t2)
-- - use t1 OR t2 rate to calculate a currency in USD format
--
-- Please take a look at a sample of output data below. Sort the result by user name in descending mode and then by user lastname and currency name in ascending mode.
--
-- | name | lastname | currency_name | currency_in_usd |
-- | ------ | ------ | ------ | ------ |
-- | Иван | Иванов | EUR | 150.1 |
-- | Иван | Иванов | EUR | 17 |
-- | ... | ... | ... | ... |
--

INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH times AS (
  SELECT balance.user_id, currency.id,
    currency.name AS currency_name,
    balance.money AS balance_money, (
      SELECT currency.rate_to_usd
      FROM currency
      WHERE currency.id = balance.currency_id
        AND currency.updated <= balance.updated
      ORDER BY currency.updated DESC
      LIMIT 1
      ) AS t1, ( -- nearest rate_to_usd of currency at the past (t1)
      SELECT currency.rate_to_usd
      FROM currency
      WHERE currency.id = balance.currency_id
        AND currency.updated > balance.updated
      ORDER BY currency.updated
      LIMIT 1
      ) AS t2   -- nearest rate_to_usd of currency at the future (t2)
  FROM currency
    JOIN balance
    ON currency.id = balance.currency_id
  GROUP BY balance.money, currency.name, currency.id, balance.updated, balance.currency_id, balance.user_id
)
SELECT COALESCE("user".name, 'not defined') AS name,
  COALESCE("user".lastname, 'not defined') AS lastname,
  times.currency_name AS currency_name,
  times.balance_money * COALESCE(times.t1, times.t2) AS currency_in_usd
FROM times
  LEFT JOIN "user"
  ON "user".id = times.user_id
ORDER BY name DESC, lastname, currency_name;
