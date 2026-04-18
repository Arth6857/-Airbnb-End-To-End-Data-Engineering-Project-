{% snapshot dim_bookings %}

{{
    config(
        database='AIRBNB',
        schema='gold',
        unique_key='booking_id',
        strategy='timestamp',
        updated_at='CREATED_AT',
        dbt_valid_to_current="to_date('9999-12-31')"
    )
}}

select * from {{ ref('bookings') }}

{% endsnapshot %}