{% test order_values (model, column_name,v) %}

select * 
from {{ model }}  where {{ column_name }} <= {{var('v_min_order')}}

{% endtest %}

