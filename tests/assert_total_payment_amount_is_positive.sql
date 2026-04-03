select 
    order_id
    sum(payment_amount) as average_amount
from {{ ref('stg_stripe__payment') }}
group by 1
having not(payment_amount >=  0)