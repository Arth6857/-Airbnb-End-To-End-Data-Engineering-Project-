{{
    config(
        materialized='ephemeral'
    )
}}

with hosts as (
    select 
       HOST_ID,
       HOST_NAME,
       IS_SUPERHOST,
       RESPONSE_TIME_CATEGORY,
       CREATED_AT
    from {{ ref('obt') }}
)

select * from hosts

