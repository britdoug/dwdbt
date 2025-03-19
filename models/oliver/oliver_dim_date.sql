{{ config(
    materialized = 'table',
    schema = 'oliver_dw_source'
    )
}}

with cte_date as (
{{ dbt_date.get_date_dimension("1990-01-01", "2050-12-31") }}
)

SELECT
orderdate as date_key,
orderdate,
day_of_week,
month_of_year,
quarter_of_year,
year_number
from cte_date