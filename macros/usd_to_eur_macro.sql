{% macro usd_to_eur(col,dec) -%}
    round({{col}}*0.86,{{dec}})
{% endmacro %}
