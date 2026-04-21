from pyspark.sql.functions import col, concat_ws, current_date, expr, lit, when

from _common import get_spark, print_section


spark = get_spark("practice-column-transformations")

people = [
    ("Liam", "Carter", "active", 3),
    ("Emma", "Stone", "inactive", 1),
    ("Zoe", "Kim", "active", 6),
]

df = spark.createDataFrame(people, ["first_name", "last_name", "status", "years_in_role"])

print_section("Base Data")
df.show()

print_section("Add Columns")
enriched = (
    df.withColumn(colName="full_name", col=concat_ws(" ", *[col("first_name"), col("last_name")]))
    .withColumn(colName="snapshot_date", col=current_date())
    .withColumn(colName="team", col=lit("data"))
    .withColumn(colName="seniority", col=when(condition=col("years_in_role") >= 5, value="senior").otherwise(value="mid"))
)
enriched.show()


print_section("Expression Columns")
df_expr_columns = enriched.select(
    "full_name",
    "status",
    expr("years_in_role * 12").alias("months_in_role"),
    expr("upper(status)").alias("status_upper"),
)
df_expr_columns.show()
type(df_expr_columns)

spark.stop()
