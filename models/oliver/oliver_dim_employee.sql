{{ config(
    materialized = 'table',
    schema = 'oliver_dw'
    )
}}


select
employee_id as employee_key,
employee_id,
first_name,
last_name,
email,
phone_number,
hire_date,
FROM {{ source('oliver_landing', 'employee') }}