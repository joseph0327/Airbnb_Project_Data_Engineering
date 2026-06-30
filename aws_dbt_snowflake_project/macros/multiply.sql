{% macro multiply(col1, col2, decimal_places) %}
    ROUND({{ col1 }} * {{ col2 }}, {{ decimal_places }})
{% endmacro %}