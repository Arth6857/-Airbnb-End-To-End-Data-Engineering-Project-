{# How can i use/play with  bronze model because for staging  we made souce page #}
{%set nights_booked=1%}
select * from {{ ref('bronze_bookings') }}
where NIGHTS_BOOKED > {{ nights_booked }}