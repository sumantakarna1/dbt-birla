{{ config(materialized='incremental', unique_key='nation_id',
query_tag = 'inc_run_04'
)}}

select * from {{ref('stg_nations')}}