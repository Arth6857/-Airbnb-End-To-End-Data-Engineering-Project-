{{ config(materialized='incremental', unique_key='HOST_ID') }}

select 
    HOST_ID,
    HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE,
    CASE 
        WHEN RESPONSE_RATE > 0.9 THEN 'fast'
        WHEN RESPONSE_RATE > 0.7 THEN 'medium'
        ELSE 'slow'
    END AS RESPONSE_TIME_CATEGORY,
    CREATED_AT
from {{ ref('bronze_hosts') }}

{% if is_incremental() %}
where CREATED_AT > (
    select max(CREATED_AT) 
    from {{ this }}
)
{% endif %}