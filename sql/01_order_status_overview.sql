-- Question: What is the order count and share for each status?
SELECT
  status,
  COUNT(*) AS total_orders,
  ROUND(
    SAFE_DIVIDE(COUNT(*), SUM(COUNT(*)) OVER ()) * 100,
    2
  ) AS status_share_pct
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY status
ORDER BY total_orders DESC;
