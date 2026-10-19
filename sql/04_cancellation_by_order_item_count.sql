-- Question: Is the observed cancellation rate different by number of items in an order?
-- This groups orders using orders.num_of_item; it does not count joined order-item rows.
SELECT
  CASE
    WHEN num_of_item = 1 THEN '1 item'
    WHEN num_of_item = 2 THEN '2 items'
    ELSE '3+ items'
  END AS item_count_group,
  COUNT(*) AS total_orders,
  COUNTIF(status = 'Cancelled') AS cancelled_orders,
  ROUND(
    SAFE_DIVIDE(COUNTIF(status = 'Cancelled'), COUNT(*)) * 100,
    2
  ) AS cancellation_rate_pct
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY item_count_group
ORDER BY
  CASE item_count_group
    WHEN '1 item' THEN 1
    WHEN '2 items' THEN 2
    ELSE 3
  END;
