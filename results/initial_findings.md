# Initial Findings / 初步分析结果

Recorded from the user's first analysis runs around October 2026. Re-run results may differ if the public dataset is updated or the query definitions change.

## Overall cancellation

| Metric | Value |
|---|---:|
| Total orders | 125,416 |
| Cancelled orders | 18,953 |
| Cancellation rate | 15.11% |

## Cancellation rate by gender

| Gender | Total orders | Cancelled orders | Cancellation rate |
|---|---:|---:|---:|
| M | 62,990 | 9,448 | 15.00% |
| F | 62,426 | 9,505 | 15.23% |

The observed difference is small (0.23 percentage points). This descriptive result alone does not establish why the rates differ.

## Cancellation rate by number of items in an order

| Group | Total orders | Cancelled orders | Cancellation rate |
|---|---:|---:|---:|
| 1 item | 87,805 | 13,282 | 15.13% |
| 2 items | 25,063 | 3,780 | 15.08% |
| 3+ items | 12,548 | 1,891 | 15.07% |

The observed rates are very close in this dataset.

## Cancellation rate by product category

The query output contained 26 categories, with observed cancellation rates ranging from **14.43% to 15.66%**.

- Highest observed category in the user's output: `Blazers & Jackets` — 15.66% (498 cancelled out of 3,181 orders containing this category).
- Another relatively high category: `Maternity` — 15.52% (769 / 4,954).
- Lowest observed categories in the user's output: `Jumpsuits & Rompers` — 14.43% (131 / 908) and `Suits & Sport Coats` — 14.43% (720 / 4,990).

The total range is about 1.23 percentage points. Because a single order may include products from multiple categories, category counts are not mutually exclusive. The difference is descriptive and does not prove that category causes cancellation.

## Item-level return rate by product category

**To complete:** After running `sql/06_item_return_rate_by_product_category.sql`, record the query date, selected metric definition, and any key observations here. Do not mix this item-record-level metric with order-level cancellation rate.

## Suggested next step

Use this project to demonstrate a clear workflow: identify a question, inspect the schema, write a reproducible SQL query, verify the counting grain, report the observed result, and state the limitation.
