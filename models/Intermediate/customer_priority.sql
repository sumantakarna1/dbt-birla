{%- set order_priority = ['1-URGENT','2-HIGH','3-MEDIUM','5-LOW'] -%}
 
with orders as (
   select * from {{ ref('stg_orders') }}
),
 
final as (
   select
       status_code,
       {% for opriority in order_priority -%}
 
       sum(case when priority_code = '{{ opriority }}' then total_price else 0 end)
            as {{ opriority [2:8] }}
         
       {%- if not loop.last -%}
         ,
       {% endif -%}
 
       {%- endfor %}
   from orders
   group by 1
)
 
select * from final