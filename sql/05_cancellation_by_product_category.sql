-- Question: What is the cancellation rate among orders containing each product category?
-- An order that includes multiple categories may appear once in each category.
SELECT
  p.category,
  COUNT(DISTINCT o.order_id) AS total_orders,
  COUNT(DISTINCT IF(o.status = 'Cancelled', o.order_id, NULL)) AS cancelled_orders,
  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT IF(o.status = 'Cancelled', o.order_id, NULL)),
      COUNT(DISTINCT o.order_id)
    ) * 100,
    2
  ) AS cancellation_rate_pct
FROM `bigquery-public-data.thelook_ecommerce.orders` AS o
INNER JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON o.order_id = oi.order_id
INNER JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
GROUP BY p.category
ORDER BY cancellation_rate_pct DESC;
