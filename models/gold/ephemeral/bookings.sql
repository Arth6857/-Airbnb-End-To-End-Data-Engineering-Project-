{{
    config(
        materialized='ephemeral'
    )
}}

with bookings as (
    select 
       BOOKING_ID,
       BOOKING_STATUS,
       BOOKING_DATE,
       CREATED_AT
    from {{ ref('obt') }}
)

select * from bookings

