from pyspark.sql.functions import (
    approx_count_distinct,
    avg,
    collect_set,
    count,
    count_distinct,
    max,
    min,
    sum,
)
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

from _common import get_spark, print_section


spark = get_spark("practice-aggregations")

orders = [
    ("north", "laptop", 2, 2400),
    ("north", "monitor", 4, 900),
    ("south", "laptop", 1, 1200),
    ("south", "dock", 3, 450),
    ("south", "monitor", 2, 480),
]

data_schema = StructType(
    [
        StructField(name="region", dataType=StringType(), nullable=False),
        StructField(name="product", dataType=StringType(), nullable=False),
        StructField(name="units", dataType=IntegerType(), nullable=False),
        StructField(name="revenue", dataType=IntegerType(), nullable=False),
    ]
)

df = spark.createDataFrame(data=orders, schema=data_schema)

print_section("Region Aggregations")
df.groupBy("region").agg(
    count("*").alias("row_count"),
    sum("units").alias("total_units"),
    avg("revenue").alias("avg_revenue"),
    min("revenue").alias("min_revenue"),
    max("revenue").alias("max_revenue"),
    count_distinct("product").alias("distinct_products"),
).show()

print_section("Collection Aggregations")
"""
Distinct counting is expensive in distributed systems because 
Spark has to track unique values across partitions. Approximate 
counting uses a probabilistic algorithm to estimate cardinality with much lower cost
"""
df.groupBy("region").agg(
    collect_set("product").alias("products_seen"),
    approx_count_distinct("product").alias("approx_distinct_products"),  # approximate result, usually cheaper/scales better
    count_distinct("product").alias("distinct_products"),  # gives the exact number of unique products, more expensive
).show(truncate=False)
df.show()

spark.stop()
