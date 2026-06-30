SELECT 
    *
FROM
    {{ ref('bronze_bookings') }}
WHERE
    BOOKING_AMOUNT IS NULL OR BOOKING_AMOUNT < 0