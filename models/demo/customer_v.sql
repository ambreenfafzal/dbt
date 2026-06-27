{{
    config
    (
        materialized = 'view'
    )
}}

SELECT * FROM {{ ref('customer') }}
WHERE country = 'USA'