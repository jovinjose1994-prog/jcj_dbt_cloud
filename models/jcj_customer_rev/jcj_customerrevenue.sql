{{ config(materialized='table') }}

SELECT
    OS.CustomerID,
    C.CustomerName,
    SUM(OS.OrderCount) AS OrderCount,
    SUM(OS.Revenue) AS Revenue
FROM
    {{ ref('jcj_orders_fact') }} OS
JOIN
    {{ ref('jcj_customers_stg') }} C ON OS.CustomerID = C.CustomerID
GROUP BY
    OS.CustomerID,
    C.CustomerName