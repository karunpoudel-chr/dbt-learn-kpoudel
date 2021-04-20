with Orders as (
    select * from {{ ref('stg_orders') }}
)
,Payments as (
    select * from {{ ref('stg_payments') }}
)
,Order_Payments as (
    select
        Order_Id
        ,sum(Amount) Amount
    from Payments
    where Status <> 'fail'
    group by Order_id
)
,final as (
    select
        o.Customer_id
        ,o.order_id
        ,o.status
        ,op.Amount
    from Orders o
    left join Order_Payments op
        on o.Order_Id = op.Order_Id 
)
select * from final