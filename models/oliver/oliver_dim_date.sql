{{ config(
    materialized = 'table',
    schema = 'oliver_dw'
    )
}}

with cte_date as (
{{ dbt_date.get_date_dimension("1990-01-01", "2050-12-31") }}
)

SELECT
date_day as date_key,
date_day,
day_of_week,
month_of_year,
quarter_of_year,
year_number
from cte_date