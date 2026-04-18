{{ config(materialized='table') }}

{% set incremental_col = 'CREATED_AT' %}

select * from {{ source('staging', 'listings') }}

{% if is_incremental() %}
where {{ incremental_col }} > (
    select COALESCE(max({{ incremental_col }}), '1970-01-01') 
    from {{ ref('bronze_listings') }}
)
{% endif %}