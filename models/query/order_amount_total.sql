select sum(Amount) total_amount
from {{ ref('orders') }}
