{% set configs = [
    {
        'table': 'AIRBNB.SILVER.SILVER_BOOKINGS',
        'columns': 'SILVER_BOOKINGS.BOOKING_ID,SILVER_BOOKINGS.TOTAL_BOOKING_AMOUNT, SILVER_BOOKINGS.BOOKING_DATE, SILVER_BOOKINGS.CLEANING_FEE, SILVER_BOOKINGS.SERVICE_FEE, SILVER_BOOKINGS.BOOKING_STATUS, SILVER_BOOKINGS.CREATED_AT as BOOKING_CREATED_AT',
        'alias': 'SILVER_BOOKINGS',
    },
    {
        'table': 'AIRBNB.SILVER.SILVER_LISTINGS',
        'columns': 'SILVER_LISTINGS.LISTING_ID, SILVER_LISTINGS.property_type, SILVER_LISTINGS.room_type, SILVER_LISTINGS.city, SILVER_LISTINGS.country, SILVER_LISTINGS.accommodates,SILVER_LISTINGS.bedrooms, SILVER_LISTINGS.bathrooms, SILVER_LISTINGS.price_per_night, SILVER_LISTINGS.PRICE_PER_NIGHT_TAG, SILVER_LISTINGS.created_at as LISTING_CREATED_AT',
        'alias': 'SILVER_LISTINGS',
        'join_condition': 'SILVER_BOOKINGS.LISTING_ID = SILVER_LISTINGS.LISTING_ID',
    },
    {
        'table': 'AIRBNB.SILVER.SILVER_HOSTS',
        'columns': 'SILVER_HOSTS.host_id, SILVER_HOSTS.HOST_NAME, SILVER_HOSTS.HOST_SINCE, SILVER_HOSTS.is_SUPERHOST, SILVER_HOSTS.RESPONSE_RATE, SILVER_HOSTS.RESPONSE_RATE_QUALITY, SILVER_HOSTS.HOST_CREATED_AT',
        'alias': 'SILVER_HOSTS',
        'join_condition': 'SILVER_LISTINGS.HOST_ID = SILVER_HOSTS.HOST_ID',
    }
] %}


SELECT
{% for config in configs %}
    {{ config.columns }}{% if not loop.last %},{% endif %}
{% endfor %}
FROM
{% for config in configs %}

    {% if loop.first %}
        {{ config.table }} AS {{ config.alias }}
    {% else %}
        LEFT JOIN {{ config.table }} AS {{ config.alias }}
            ON {{ config.join_condition }}
    {% endif %}
{% endfor %}
 
