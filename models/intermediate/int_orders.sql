{{
    config
    (
        transient=false,
        materialized='incremental'
    )
}}

with orders as (
        select * from {{ ref('stg_orders') }} )

select 
    orders.order_id,
    orders.customer_id,
    orders.order_date,
    orders.status_code as order_status_code,
    orders.priority_code as order_priority_code,
    orders.ship_priority as order_ship_priority,
    orders.total_price as order_total_price_usd ,
    {{usd_to_eur('orders.total_price',2)}} as order_total_price_eur ,
    orders.comment,
    orders.clerk_name
from
    orders
order by
    orders.order_date