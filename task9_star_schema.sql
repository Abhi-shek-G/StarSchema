-- total sales by product category 
SELECT
    p.product_category,
    SUM(f.total_amount) AS total_sales
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_sales DESC;

-- monthly sales trend
SELECT
    d.year,
    d.month,
    SUM(f.total_amount) AS monthly_sales
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

-- sales by gender
SELECT
    c.gender,
    SUM(f.total_amount) AS total_sales
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.gender;
