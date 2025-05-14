SELECT
    date_date,
    COUNT(orders_id) AS nb_transactions,
    ROUND(SUM(revenue)) AS total_revenue,
    ROUND(AVG(revenue),1) AS avg_basket,
    ROUND(SUM(operational_margin)) AS operational_margin,
    ROUND(SUM(margin)) AS margin,
    ROUND(SUM(purchase_cost)) AS total_purchase_cost,
    ROUND(SUM(shipping_fee)) AS total_shipping_fee,
    ROUND(SUM(logcost)) AS total_logcost,
    ROUND(SUM(quantity)) AS total_quantity_sold    
FROM 
    {{ ref("int_orders_operational") }}
GROUP BY 
    date_date
ORDER BY 
    date_date DESC