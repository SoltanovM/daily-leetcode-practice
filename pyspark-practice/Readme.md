# PySpark Practice

This folder contains an original set of PySpark practice scripts designed to keep core data engineering skills fresh.

The focus is on the fundamentals that show up again and again in real work:

- creating DataFrames from Python data
- selecting, renaming, and transforming columns
- filtering and cleaning data
- working with arrays, maps, and structs
- aggregations and summary statistics
- pivoting and window functions
- RDD basics and key-value patterns
- partitioning concepts and simple performance awareness

The scripts are intentionally self-contained, written in English, and organized as a compact learning path instead of a large collection of nearly identical examples.

## Suggested order

1. `01_dataframe_foundations.py`
2. `02_column_transformations.py`
3. `03_dates_and_timestamps.py`
4. `04_complex_types.py`
5. `05_filtering_and_null_handling.py`
6. `06_aggregations.py`
7. `07_pivot_and_windows.py`
8. `08_rdd_basics.py`
9. `09_rdd_key_value_patterns.py`
10. `10_partitioning_patterns.py`
11. `11_udf_examples.py`

## Run an example

```bash
python pyspark-practice/01_dataframe_foundations.py
```

If your local setup uses `spark-submit`, that works too:

```bash
spark-submit pyspark-practice/01_dataframe_foundations.py
```
