SELECT
    orders_id,
    max(date_date) AS date_date,
    SUM(revenue) AS revenu,
    SUM(quantity) AS quantity,
    SUM(purchase_cost) AS purchase_cost,
    SUM(margin) AS margin
FROM
    {{ ref("int_sales_margin") }}
GROUP BY 
    orders_id