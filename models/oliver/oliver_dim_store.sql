{{ config(
    materialized = 'table',
    schema = 'dw_oliver_source'
    )
}}


select
storeid as store_key,
storeid,
store_name,
store_street,
store_city,
store_state
FROM {{ source('oliver', 'store') }}