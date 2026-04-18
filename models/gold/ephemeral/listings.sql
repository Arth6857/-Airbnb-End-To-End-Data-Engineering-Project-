{{
    config(
        materialized='ephemeral'
    )
}}

with listings as (
    select 
         LISTING_ID,
         ROOM_TYPE,
         PROPERTY_TYPE,
         PRICE_CATEGORY,
         CREATED_AT,
    from {{ ref('obt') }}
)

select * from listings

