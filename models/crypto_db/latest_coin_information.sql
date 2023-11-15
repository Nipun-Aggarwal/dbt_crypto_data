{{ config(materialized='view') }}

WITH ranked_data AS (
  SELECT *,
    ROW_NUMBER() OVER(PARTITION BY id_coin ORDER BY last_updated_coin DESC) AS rn
  FROM adsa-data-management-404510.crypto_data.coin_information
)

SELECT *
FROM ranked_data
WHERE rn = 1
