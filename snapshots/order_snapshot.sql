{% snapshot orders_snapshot %}

    {{
        config(
          target_schema='dbt_svaghasiya',
          strategy='check',
          unique_key='id',
          check_cols=['status', 'is_cancelled'],
        )
    }}

    select * from {{ source('dbt_svaghasiya', 'raw_orders') }}

{% endsnapshot %}