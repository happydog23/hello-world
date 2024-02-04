with source as (
    select * from {{ source("jaffle_shop","raw_payments")}}
)

, payments as (

    select
        id as payment_id,
        order_id,
        payment_method,
        amount / 100 as amount

    from source

)

select * from payments