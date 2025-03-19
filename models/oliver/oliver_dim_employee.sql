{{ config(
    materialized = 'table',
    schema = 'dw_oliver_source'
    )
}}


select
employeeid as employee_key,
employeeid,
employeefirstname,
employeelastname,
empemail,
empphonenumber,
hiredate,
FROM {{ source('oliver', 'employee') }}