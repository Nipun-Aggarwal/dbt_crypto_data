{{ config(materialized='table') }}

with source_data as (

    select id_coin as id
    union all
    select null as id

)

select *
from source_data