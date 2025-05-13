WITH sub AS (
    SELECT 
        orders_id,
        date_date,
        quantity,
        purchase_cost,
        margin
    FROM
    {{ ref("int_orders_margin") }}
),

sub2 AS (
    SELECT  
        orders_id,
        SUM(shipping_fee) AS shipping_fee,
        SUM(logcost) AS logcost,
        SUM(ship_cost) AS ship_cost
    FROM 
        {{ ref("stg_raw__ship") }} AS ship
    GROUP BY 
        orders_id
)

SELECT
    sub.orders_id AS orders_id,
    sub.date_date AS date_date,
    ROUND(sub.margin + sub2.shipping_fee - sub2.logcost - sub2.ship_cost, 2) AS operational_margin,
    sub.quantity AS quantity,
    sub.purchase_cost AS purchase_cost,
    sub.margin AS margin
FROM
    sub
LEFT JOIN 
    sub2
ON 
    sub.orders_id = sub2.orders_id
ORDER BY
    orders_id DESC