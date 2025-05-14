#Join the int_campaigns_day model with finance_daysmodel from the previous unit
WITH sub AS (
    SELECT
        f.date_date AS date_date
        (f.operational_margin - c.ads_cost) AS ads_margin
        f.avg_basket AS avg_basket
        c.ads_cost AS ads_cost
        c.ads_impression AS ads_impression
        c.ads_clicks AS ads_clicks
        f.total_quantity_sold AS quantity
        f.total_revenue AS revenue
        f.total_purchase_cost AS purchase_cost 
        
    FROM 
        {{ref("int_campaigns_day")}} AS c
    LEFT JOIN 
        {{ref("finance_days")}} AS f
)