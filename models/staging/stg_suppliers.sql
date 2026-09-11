with supplier as (
    select *
     
    from {{source('src','suppliers')}}
)
select * from supplier