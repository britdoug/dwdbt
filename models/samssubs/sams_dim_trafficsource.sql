{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}


select
 {{ dbt_utils.generate_surrogate_key(['traffic_source']) }} as traffickey,
traffic_source AS trafficsource
FROM {{ source('samssubs_landing2', 'web_traffic_events') }}