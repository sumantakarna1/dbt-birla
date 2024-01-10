{{
    config(
             materialized='table',
             transient=false
    )
}}

select sc.name as customer, address, phone_number, sn.name as nation, sr.name as region
from {{ ref('stg_customers') }} sc
inner join {{ ref('stg_nations') }} sn on  sc.nation_id = sn.nation_id
inner join {{ ref('stg_regions') }} sr on  sr.region_id = sn.region_id