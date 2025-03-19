{{ config(
    materialized = 'table',
    schema = 'dw_oliver_source'
    )
}}


select
customerid as customer_key,
customerid,
firstname,
lastname,
custemail,
custphonenumber,
state
FROM {{ source('oliver', 'customer') }}