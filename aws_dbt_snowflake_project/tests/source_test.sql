{{config(
    severity='warn',
)}}

SELECT 
    *
FROM
    {{ ref('bronze_bookings') }}
WHERE
    BOOKING_AMOUNT IS NULL