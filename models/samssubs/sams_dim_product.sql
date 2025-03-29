{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}


select
 {{ dbt_utils.generate_surrogate_key(['p.productid']) }} as productkey,
p.productid,
p.productname,
p.producttype, 
p.productcalories,
p.productcost,
s.breadtype,
s.length
FROM {{ source('samssubs_landing', 'product') }} p
JOIN {{ source('samssubs_landing', 'sandwich')}} s on p.productid = s.productid