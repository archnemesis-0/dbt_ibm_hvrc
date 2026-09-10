select n_nationkey nation_id, n_name name, n_regionkey region_id, n_comment comment
from {{source('src','nations')}}
