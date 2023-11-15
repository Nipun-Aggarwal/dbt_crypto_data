{{ config(materialized='view') }}

SELECT
  ci.id_category,
  ci.name_category,
  ci.market_cap_category,
  ci.volume_24h_category,
  ci.updated_at_category,
  ch.id_coin,
  ch.price_coin,
  ch.price_date
FROM
  crypto_data.category_information ci
JOIN
  crypto_data.coin_category_list ccl ON ci.id_category = ccl.id_category
JOIN
  crypto_data.coin_history ch ON ccl.id_coin = ch.id_coin;
