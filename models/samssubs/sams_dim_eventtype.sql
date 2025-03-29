{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}


select
 {{ dbt_utils.generate_surrogate_key(['event_name']) }} as eventkey,
event_name AS eventname
FROM {{ source('samssubs_landing2', 'web_traffic_events') }}