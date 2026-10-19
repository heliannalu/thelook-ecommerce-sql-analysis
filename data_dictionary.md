# Data Dictionary / 数据字典

This is a working guide to the tables used in this project. Confirm table and column names with the live BigQuery metadata query before extending the analysis.

| Table | Expected grain (one row represents) | Key fields used here | Purpose in this project |
|---|---|---|---|
| `orders` | One order | `order_id`, `status`, `created_at`, `gender`, `num_of_item` | Order counts, cancellation status, month, gender, and number-of-items grouping |
| `order_items` | One order-item record | `order_id`, `product_id`, `status` | Item-level return analysis; joins orders to products |
| `products` | One product | `id`, `category` | Product category used for category-level grouping |

## Join paths used

```text
orders.order_id = order_items.order_id
order_items.product_id = products.id
```

## Grain matters

- `orders` is order-level data.
- `order_items` is item-record-level data. A single order can produce multiple rows after joining to `order_items`.
- For cancellation rate by category, the SQL uses `COUNT(DISTINCT order_id)` so an order is counted at most once within a category, even if it has multiple item records in that category.
- An order containing products in multiple categories can appear in each applicable category's count. Therefore, category totals are not mutually exclusive.
- For item-level return rate, each row in `order_items` is counted as one item record. This should not be described as order-level return rate.

## Metadata query

See `sql/00_dataset_exploration.sql` to list all tables, table types, columns, ordinal positions, and data types in the dataset.
