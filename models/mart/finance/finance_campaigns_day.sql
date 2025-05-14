SELECT
    f.date_date AS date_date,
    (f.operational_margin - c.ads_cost) AS ads_margin,
    f.avg_basket AS avg_basket,
    f.operational_margin AS operational_margin,
    c.ads_cost AS ads_cost,
    c.ads_impression AS ads_impression,
    c.ads_clicks AS ads_clicks,
    f.total_quantity_sold AS quantity,
    f.total_revenue AS revenue,
    f.total_purchase_cost AS purchase_cost, 
    f.margin AS margin,
    f.total_shipping_fee AS shipping_fee,
    f.total_logcost AS logcost,
    f.ship_cost AS ship_cost
FROM 
    {{ref("int_campaigns_day")}} AS c
LEFT JOIN 
    {{ref("finance_days")}} AS f
ON
    c.date_date = f.date_date
ORDER BY
    date_date DESC