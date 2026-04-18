{{ config(materialized='incremental', unique_key='LISTING_ID') }}

select 
    LISTING_ID,
    HOST_ID,
    ROOM_TYPE,
    PROPERTY_TYPE,
    ACCOMMODATES,
    BEDROOMS,
    BATHROOMS,
    PRICE_PER_NIGHT,
    {{ tag('CAST(PRICE_PER_NIGHT AS INT)') }} as PRICE_CATEGORY,
    CREATED_AT 
from {{ ref('bronze_listings') }}

{# {% if is_incremental() %}
where CREATED_AT > (
    select max(CREATED_AT) 
    from {{ this }}
)
{% endif %} #}