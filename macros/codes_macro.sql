{% macro dol_eur(colm, deci) -%}
    round( 0.91 * {{ colm }}, {{ deci }})
{%- endmacro %}

{% macro testdml() %}

{% set queries %}

create or replace table analytics.sch_birla.protest2(id int, cname varchar);
insert into analytics.sch_birla.protest2 values(10,'murali'),(11,'kannan'),(12,'none');
update analytics.sch_birla.protest2 set cname='Guru' where id=12;

{% endset %}

{% do run_query(queries) %}

{% endmacro %}


{% macro money() -%}

::decimal(16,4)

{%- endmacro %}

