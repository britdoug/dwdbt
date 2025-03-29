{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}


select
 {{ dbt_utils.generate_surrogate_key(['storeid']) }} as storekey,
storeid,
address,
state, 
city,
zip
FROM {{ source('samssubs_landing', 'store') }}