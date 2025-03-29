{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}


select
 {{ dbt_utils.generate_surrogate_key(['page_url']) }} as pagekey,
page_url AS pageurl
FROM {{ source('samssubs_landing2', 'web_traffic_events') }}