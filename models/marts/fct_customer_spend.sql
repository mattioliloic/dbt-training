{{config(materialized='table') }} 

with orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),

payments as (
    select * from {{ ref('stg_stripe__payment') }}
),

final as (
    select 
        orders.customer_id,
        sum(payments.payment_amount) as total_amount
    from orders
    left join payments on orders.order_id = payments.order_id
    where orders.order_status = 'completed'
    group by 1
)

select * from final
{{ limit_data_env() }}
