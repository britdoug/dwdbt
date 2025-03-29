{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
) }}

SELECT
    p.pagekey,
    t.trafficsourcekey,
    d.datekey,
    e.eventtypekey,
    u.userkey
FROM {{ source('samssubs_landing2', 'web_traffic_events') }} w
INNER JOIN {{ ref('sams_dim_page') }} p ON p.pageurl = w.page_url
INNER JOIN {{ ref('sams_dim_trafficsource') }} t ON t.trafficsource = w.traffic_source
INNER JOIN {{ ref('sams_dim_date') }} d ON d.date = w.event_timestamp
INNER JOIN {{ ref('sams_dim_eventtype') }} e ON e.eventname = w.event_name
INNER JOIN {{ ref('sams_dim_user') }} u ON u.useremail = w.user_email