-- Question: How does the cancellation rate vary by order-creation month?
SELECT
  DATE_TRUNC(DATE(created_at), MONTH) AS order_month,
  COUNT(*) AS total_orders,
  COUNTIF(status = 'Cancelled') AS cancelled_orders,
  ROUND(
    SAFE_DIVIDE(COUNTIF(status = 'Cancelled'), COUNT(*)) * 100,
    2
  ) AS cancellation_rate_pct
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY order_month
ORDER BY order_month;
