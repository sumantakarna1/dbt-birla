{%- set subject = 'dbt' -%}
I do training on {{subject}}
{% set tools = ['dbt','Snowflake','Databricks','BigQuery','Redshift'] -%}
Currently we are working with {{ tools[0]}} and {{ tools[1]}}
 
{% for tool in tools -%}
I do training on {{ tool }}
{% endfor -%}