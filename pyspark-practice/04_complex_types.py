from pyspark.sql.functions import (
    array,
    array_contains,
    col,
    create_map,
    explode,
    flatten,
    lit,
    split,
)
from pyspark.sql.types import StructType, StructField, StringType, ArrayType, IntegerType

from _common import get_spark, print_section


spark = get_spark("practice-complex-types")

engineers = [
    ("Ivy Chen", "python,sql,spark", [["batch", "streaming"], ["airflow"]], "berlin", "senior"),
    ("Owen Diaz", "scala,spark", [["etl"], ["testing", "monitoring"]], "madrid", "mid"),
]

data_schema = StructType(
    [
        StructField("full_name", StringType(), False),
        StructField("skills_text", StringType(), False),
        StructField("project_groups", ArrayType(ArrayType(StringType())), False),
        StructField("city", StringType(), False),
        StructField("level", StringType(), False),
    ]
)


df = spark.createDataFrame(
    data=engineers,
    schema=data_schema,
)
df.show(truncate=False)

print_section("Arrays From Strings")
df_skills = df.withColumn(colName="skills", col=split(col("skills_text"), pattern=","))
df_skills.select("full_name", "skills", array_contains("skills", "spark").alias("knows_spark")).show(truncate=False)

print_section("Explode Arrays")
df_engineer_skill_table = df_skills.select("full_name", explode("skills").alias("skill"))
df_engineer_skill_table.show()

print_section("Flatten Nested Arrays")
df_skills.show()
df_extend_lists = df_skills.withColumn("all_topics", flatten(col("project_groups"))).select("full_name", "all_topics")
df_skills.select("full_name", "project_groups").show(truncate=False)
df_extend_lists.show(truncate=False)


print_section("Maps")
df_skills.show(truncate=False)
df_mapped = df_skills.withColumn(
    "profile",
    create_map(lit("city"), col("city"), lit("level"), col("level")),
)
df_mapped.show(truncate=False)
df_mapped.select("full_name", "profile").show(truncate=False)

spark.stop()
