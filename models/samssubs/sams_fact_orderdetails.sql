{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
) }}

SELECT
    c.customerkey,
    d.datekey,
    e.employeekey,
    p.productkey,
    s.storekey,
    od.orderlineqty,
    od.orderlineprice,
    od.pointsearned,
    o.ordertotal
FROM {{ source('samssubs_landing', '"ORDER"') }} o
INNER JOIN {{ source('samssubs_landing', 'orderdetails') }} od ON o.ordernumber = od.ordernumber
INNER JOIN {{ source('samssubs_landing', 'employee') }} em ON o.employeeid = em.employeeid
INNER JOIN {{ ref('sams_dim_product') }} p ON p.productid = od.productid 
INNER JOIN {{ ref('sams_dim_customer') }} c ON c.customerid = o.customerid
INNER JOIN {{ ref('sams_dim_employee') }} e ON e.employeeid = o.employeeid
INNER JOIN {{ ref('sams_dim_store') }} s ON s.storeid = em.storeid
INNER JOIN {{ ref('sams_dim_date') }} d ON d.date = o.orderdate