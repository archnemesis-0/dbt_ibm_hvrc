{{config(materialized='incremental')}}

with supplier as (
    select * from {{ref('stg_suppliers')}}
    {% if is_incremental() %}
    where updated_time>(select max(updated_time) from {{time}})
    {% endif %}
)
select * from supplier