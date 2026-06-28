{{
    config
    (
        materialized = 'ephemeral'
    )
}}


with base_orders as (

    select
    ORDER_ID,
    ORDER_DATE,
    CUSTOMER_ID,
    CASE
    WHEN CUSTOMER_NAME IS NULL THEN 'NA'
    ELSE UPPER(CUSTOMER_NAME)
    END AS CUSTOMER_NAME,
    CREATED_AT
    FROM {{source('orders', 'base_orders')}}
    WHERE ORDER_DATE is not null
    order by ORDER_DATE DESC
)

select * from base_orders