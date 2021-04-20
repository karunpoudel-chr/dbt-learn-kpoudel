select 
    Id Payment_Id
    ,OrderId Order_Id
    ,PaymentMethod Payment_Method
    ,Status
    ,Amount/100 Amount
    ,Created Created_At
from raw.stripe.payment