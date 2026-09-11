{{
    config
        (
            materialized='incremental', unique_key='customer_id'
        )
}}--config block--

with customers as(
select c.*, r.name as region_name,n.name as nation_name 
from {{ref('stg_customers')}} c join {{ref('stg_nations')}} n 
on c.nation_id=n.nation_id
join {{ref('stg_regions')}} r on r.region_id=n.region_id)
select * from customers