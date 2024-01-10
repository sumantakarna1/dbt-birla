{% snapshot orders_snapshot %}
 
{{
    config(
      target_database='analytics',
      target_schema='snapshots',
      unique_key='o_orderkey',
 
      strategy='timestamp',
      updated_at='o_orderdate',
    )
}}
 
select * from {{ source('src', 'orders') }}
 
{% endsnapshot %}