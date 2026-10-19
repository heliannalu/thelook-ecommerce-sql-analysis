# TheLook E-commerce Business Analysis

使用 Google BigQuery 和 SQL 对公开的 TheLook 电商示例数据集进行初步业务分析。项目重点练习数据探索、聚合、条件统计和多表连接，并观察订单取消与商品退货相关指标。

> **数据说明：** TheLook 是公开的示例/合成电商数据集，不代表真实企业经营记录。此项目用于展示 SQL 分析过程，不应将观察到的关联解释为因果关系。

## Business Questions / 分析问题

1. 不同订单状态的订单量与占比如何？
2. 订单取消率随月份变化吗？
3. 不同性别的订单取消率是否有明显差异？
4. 不同订单商品数量对应的取消率是否有明显差异？
5. 不同商品类别的取消率是否有明显差异？
6. 不同商品类别的商品明细退货率是否有明显差异？

## Data Source / 数据来源

- BigQuery public dataset: `bigquery-public-data.thelook_ecommerce`
- Tables used:
  - `orders`: order-level information
  - `order_items`: item-level order records
  - `products`: product attributes, including category

The table and column inventory query is in [`sql/00_dataset_exploration.sql`](sql/00_dataset_exploration.sql).

## Repository Structure

```text
.
├── README.md
├── data_dictionary.md
├── sql/
│   ├── 00_dataset_exploration.sql
│   ├── 01_order_status_overview.sql
│   ├── 02_monthly_cancellation_trend.sql
│   ├── 03_cancellation_by_gender.sql
│   ├── 04_cancellation_by_order_item_count.sql
│   ├── 05_cancellation_by_product_category.sql
│   └── 06_item_return_rate_by_product_category.sql
└── results/
    └── initial_findings.md
```

## Key Findings / 初步发现

The first round of queries returned 125,416 orders, including 18,953 cancelled orders, for an overall cancellation rate of 15.11%.

- Cancellation rate by gender was close: 15.00% for `M` and 15.23% for `F`.
- Cancellation rate by order item-count group was also close: 15.13% for 1 item, 15.08% for 2 items, and 15.07% for 3+ items.
- Across product categories, the observed cancellation rate ranged from 14.43% to 15.66% in the query output. The differences are modest; this does not establish that category causes cancellation.
- Item-level return rate is analyzed separately from order cancellation. See `sql/06_item_return_rate_by_product_category.sql`; add the measured results after checking the output.

Full notes and metric definitions are in [`results/initial_findings.md`](results/initial_findings.md).

## How to Reproduce / 复现方法

1. Open [Google BigQuery](https://console.cloud.google.com/bigquery).
2. Select a query file from the `sql/` folder and paste it into the SQL editor.
3. Run it using BigQuery Standard SQL. The queries read from a public dataset; check the billing and query settings in your account before running queries.
4. Compare the output with the notes in `results/initial_findings.md`. Public sample data and query results can change, so later runs may differ from the recorded values.

## Skills Demonstrated / 使用到的技能

- SQL: `SELECT`, `GROUP BY`, `ORDER BY`, `COUNTIF`, `CASE`, `SAFE_DIVIDE`, `ROUND`
- Multi-table analysis: `INNER JOIN`
- Duplicate-aware order counts: `COUNT(DISTINCT order_id)` after joining order-level and item-level tables
- Business metrics: cancellation rate and item-level return rate
- BigQuery metadata exploration through `INFORMATION_SCHEMA`

## Limitations / 局限性

- TheLook is a sample dataset, not a source of verified real-world business outcomes.
- A cancellation-rate difference between categories is descriptive; it does not prove a causal relationship.
- An order may contain products from multiple categories. In the category cancellation query, that order can be counted once in each category it contains, so category totals should not be summed to estimate unique store-wide orders.
- `item_return_rate` is calculated at the order-item-record level. It is not the same metric as the percentage of orders that contain a return.
- Results in this repository are a record of one analysis run; re-running queries may return different numbers.
