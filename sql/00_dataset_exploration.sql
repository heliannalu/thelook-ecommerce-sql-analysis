-- List tables and views in the dataset.
SELECT
  table_name,
  table_type
FROM `bigquery-public-data.thelook_ecommerce.INFORMATION_SCHEMA.TABLES`
ORDER BY table_name;

-- List every field and its data type for the dataset.
SELECT
  table_name,
  ordinal_position,
  column_name,
  data_type,
  is_nullable
FROM `bigquery-public-data.thelook_ecommerce.INFORMATION_SCHEMA.COLUMNS`
ORDER BY table_name, ordinal_position;
