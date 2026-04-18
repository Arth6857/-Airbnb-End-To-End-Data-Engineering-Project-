{% snapshot dim_listings %}

{{
    config(
        database='AIRBNB',
        schema='gold',
        unique_key='LISTING_id',
        strategy='timestamp',
        updated_at='CREATED_AT',
        dbt_valid_to_current="to_date('9999-12-31')"
    )
}}

select * from {{ ref('listings') }}

{% endsnapshot %}