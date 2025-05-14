SELECT
    sales.date_date,
    sales.orders_id,
    sales.products_id,
    sales.quantity,
    products.purchase_price,
    sales.revenue,
    sales.quantity * products.purchase_price as purchase_cost,
    ROUND(sales.revenue - (sales.quantity * products.purchase_price),2) as margin
FROM 
    {{ ref("stg_raw__sales") }} AS sales
LEFT JOIN 
    {{ ref("stg_raw__product") }} AS products
ON 
    sales.products_id = products.products_id
