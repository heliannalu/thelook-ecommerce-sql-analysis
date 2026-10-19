-- Question: Is the observed cancellation rate different by gender?
SELECT
  gender,
  COUNT(*) AS total_orders,
  COUNTIF(status = 'Cancelled') AS cancelled_orders,
  ROUND(
    SAFE_DIVIDE(COUNTIF(status = 'Cancelled'), COUNT(*)) * 100,
    2
  ) AS cancellation_rate_pct
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY gender
ORDER BY gender;
