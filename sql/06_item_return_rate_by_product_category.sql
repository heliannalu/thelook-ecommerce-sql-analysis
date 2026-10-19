-- Question: What share of order-item records are marked Returned in each product category?
-- This is item-record-level return rate, not order-level return rate.
SELECT
  p.category,
  COUNT(*) AS total_item_records,
  COUNTIF(oi.status = 'Returned') AS returned_item_records,
  ROUND(
    SAFE_DIVIDE(COUNTIF(oi.status = 'Returned'), COUNT(*)) * 100,
    2
  ) AS item_return_rate_pct
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
INNER JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
GROUP BY p.category
ORDER BY item_return_rate_pct DESC;
