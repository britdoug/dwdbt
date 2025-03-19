{{ config(
    materialized = 'table',
    schema = 'dw_oliver_source'
    )
}}


select
productid as product_key,
productid,
productname,
description
FROM {{ source('oliver', 'product') }}