WITH sub AS (
    SELECT 
        orders_id,
        date_date,
        operational_margin,
        quantity,
        revenue,
        purchase_cost,
        margin
    FROM
    {{ ref("int_orders_operational") }}
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
    sub.date_date,
    COUNT(sub.orders_id) AS nb_transactions,
    ROUND(SUM(sub.revenue)) AS total_revenue,
    ROUND(AVG(sub.revenue),1) AS avg_basket,
    ROUND(SUM(sub.operational_margin)) AS operational_margin,
    ROUND(SUM(sub.purchase_cost)) AS total_purchase_cost,
    ROUND(SUM(sub2.shipping_fee)) AS total_shipping_fee,
    ROUND(SUM(sub2.logcost)) AS total_logcost,
    ROUND(SUM(sub.quantity)) AS total_quantity_sold
FROM 
    sub
LEFT JOIN
    sub2
ON 
    sub.orders_id = sub2.orders_id
GROUP BY 
    date_date
ORDER BY 
    date_date DESC