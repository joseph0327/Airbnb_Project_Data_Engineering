SELECT 
    HOST_ID,
    HOST_NAME,
    HOST_SINCE,
    is_SUPERHOST,
    RESPONSE_RATE,
    {{ response_rate_tag('CAST(RESPONSE_RATE AS INT)') }} AS RESPONSE_RATE_QUALITY,
    CREATED_AT as HOST_CREATED_AT
FROM 
    {{ ref('bronze_hosts') }}