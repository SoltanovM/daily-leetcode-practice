from pyspark.sql.functions import col, coalesce, lit
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

from _common import get_spark, print_section


spark = get_spark("practice-filtering-and-null-handling")

customers = [
    ("C001", "enterprise", "new-york", 120000, "active"),
    ("C002", "startup", None, 18000, "active"),
    ("C003", "enterprise", "chicago", None, "paused"),
    ("C004", "mid-market", "austin", 52000, None),
]

data_schema = StructType(
    [
        StructField(name="customer_id", dataType=StringType(), nullable=False),
        StructField(name="segment", dataType=StringType(), nullable=False),
        StructField(name="city", dataType=StringType(), nullable=True),
        StructField(name="annual_value", dataType=IntegerType(), nullable=True),
        StructField(name="status", dataType=StringType(), nullable=True),
    ]
)

df = spark.createDataFrame(
    data=customers,
    schema=data_schema,
)

print_section("Filter Active Enterprise Customers")
df.filter((col("segment") == "enterprise") & (col("status") == "active")).show()

print_section("Find Nulls")
df.filter(col("city").isNull() | col("annual_value").isNull() | col("status").isNull()).show()

print_section("Fill and Clean")
df_cleaned = df.fillna({"city": "unknown", "status": "pending"}).withColumn("annual_value", coalesce(col("annual_value"), lit(0))).drop("segment")
df_cleaned = df.fillna({"city": "unknown", "status": "pending", "annual_value": 0}).drop("segment")
df_cleaned.show()

print_section("Drop Rows With Nulls In Important Fields")
df.dropna(subset=["city", "status"]).show()

spark.stop()
