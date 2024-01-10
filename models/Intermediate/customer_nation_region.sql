{{ config(materialized='ephemeral') }}
 
With customer_nation_region as (
  SELECT * from snowflake_sample_data.tpch_sf1.customer
    JOIN snowflake_sample_data.tpch_sf1.nation
        ON n_nationkey=c_nationkey
            JOIN snowflake_sample_data.tpch_sf1.region
                ON n_regionkey=r_regionkey
)
 
SELECT
r_name as region,
n_name as nation,
n_nationkey as nation_key,
c_name as customer_name,
c_acctbal as account_balance,
c_mktsegment as market_segment
    FROM customer_nation_region