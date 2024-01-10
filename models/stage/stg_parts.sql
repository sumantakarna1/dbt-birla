with source as (
 
    select * from {{ source('src', 'parts') }} parts
    inner join {{ source('src', 'partsupps') }} supp on
    parts.p_partkey = supp.ps_partkey
 
),
 
changed as (
 
    select
 
        -- ids
        p_partkey as part_id,

        -- descriptions
        p_name as name,
        p_type as type,
        p_size as size,
        p_mfgr as manufacturer,
        p_brand as brand,
        p_comment as comment,
        p_container as container,
 
        -- amounts
        p_retailprice as retail_price,
 
        -- supplier
        ps_suppkey as supplier_id,
        ps_availqty as available_quantity,
        ps_supplycost as cost

 
    from source
)

select * from changed