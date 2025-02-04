-- Let’s take a look at the data sources and first logical data layer (ODS - Operational Data Store) in the DWH.
--
-- Please write a SQL statement that returns the total volume (sum of all money) of transactions from user balance aggregated by user and balance type.
-- Please be aware, all data should be processed including data with anomalies. Below presented a table of result columns and corresponding calculation formula.
--
-- | Output Column | Formula (pseudocode) |
-- | ------ | ------ |
-- | name | source: user.name if user.name is NULL then return `not defined` value |
-- | lastname | source: user.lastname if user.lastname is NULL then return `not defined` value |
-- | type | source: balance.type |
-- | volume | source: balance.money need to summarize all money “movements” |
-- | currency_name | source: currency.name if currency.name is NULL then return `not defined` value |
-- | last_rate_to_usd | source: currency.rate_to_usd. take a last currency.rate_to_usd for corresponding currency if currency.rate_to_usd is NULL then return 1 |
-- | total_volume_in_usd | source: volume , last_rate_to_usd. make a multiplication between volume and last_rate_to_usd |
--
-- Please take a look at a sample of output data below. Sort the result by user name in descending mode and then by user lastname and balance type in ascending mode.
--
-- | name | lastname | type | volume | currency_name | last_rate_to_usd | total_volume_in_usd |
-- | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
-- | Петр | not defined | 2 | 203 | not defined | 1 | 203 |
-- | Иван | Иванов | 1 | 410 | EUR | 0.9 | 369 |
-- | ... | ... | ... | ... | ... | ... | ... |
--

WITH quotations AS (
    SELECT id, name,
      MAX(updated) AS last_update
    FROM currency
    GROUP BY id, name
)
SELECT COALESCE("user".name, 'not defined') AS name,
  COALESCE(lastname, 'not defined') AS lastname,
  balance.type AS type,
  SUM(balance.money) AS volume,
  COALESCE(quotations.name, 'not defined') AS currency_name,
  COALESCE(currency.rate_to_usd, '1') AS last_rate_to_usd,
  SUM(balance.money) * COALESCE(currency.rate_to_usd, '1') AS total_volume_in_usd
FROM balance
  LEFT JOIN "user"
  ON balance.user_id = "user".id
  LEFT JOIN quotations
  ON balance.currency_id = quotations.id
  LEFT JOIN currency
  ON quotations.last_update = currency.updated
    AND quotations.name = currency.name
GROUP BY "user".name, lastname, type, quotations.name, currency.rate_to_usd
ORDER BY name DESC, lastname, type;
