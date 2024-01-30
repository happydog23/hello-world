with payments as (
    select *
    from {{ref('stg_payments')}}
)

, orders as (

    select *
    from {{ ref('stg_orders') }}

)

, order_payments as (
    select
         order_id
        
        ,sum(amount) as amount

    from payments

    group by order_id
)

, final as (
    
    select 
         o.order_id
        ,o.customer_id
        ,o.order_date
        ,coalesce(p.amount, 0) as amount
    from
        orders o
    left join
        order_payments p using (order_id)
)

select * from final