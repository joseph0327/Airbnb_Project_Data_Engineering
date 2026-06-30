{%- macro response_rate_tag(response_rate) -%}
 CASE
    WHEN {{ response_rate }} < 75 THEN 'POOR'
    WHEN {{ response_rate }} >= 50 AND {{ response_rate }} < 100 THEN 'GOOD'
    ELSE 'VERY GOOD'
END
{%- endmacro -%}