{{
    config
    (
        materialized='incremental',
        unique_key='s_suppkey',
        incremental_strategy='merge',
        incremental_predicates=["DBT_INTERNAL_SOURCE.s_acctbal>9900"]
    )
}}

with supplier as (
    select s.s_suppkey,n.sname , s.* exclude (s_suppkey,s_name) 
    from {{ref('stg_suppliers')}} s
    join analytics.dbt_hrajchauhan.suppliers_names n 
    on s.s_suppkey=n.skey
    {% if is_incremental() %}
    where updated_time>(select max(updated_time) from {{ this }})
    {% endif %}
)
select * from supplier
