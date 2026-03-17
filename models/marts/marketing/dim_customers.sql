with customers as (
    select * from {{ ref ('stg_jaffle_shop__customers')}}
),
orders as (
    select * from {{ ref ('stg_jaffle_shop__orders')}}
),

 final as (
    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
    from customers
)

select * from final