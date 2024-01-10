select order_id,
order_date,
total_price as price_usd,
{{ dol_eur('total_price',2) }} as price_euro
from {{ref('stg_orders')}}