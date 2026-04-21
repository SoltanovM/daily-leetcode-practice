from pyspark.sql import Row

from _common import get_spark, print_section


spark = get_spark("practice-dataframe-foundations")

print_section("Create DataFrames")

employees = [
    ("Ava", "Data Platform", 92000),
    ("Noah", "Analytics", 87000),
    ("Ava", "Data Platform", 92000),
    ("Mia", "Machine Learning", 99000),
]

df = spark.createDataFrame(employees, ["employee_name", "team", "salary"])
df.show()

print_section("Distinct Rows")
df.distinct().show()

print_section("Top Rows")
df.show(n=2, truncate=False)

print_section("Sampling")
print("`withReplacement=False` means each input row can be selected at most once in the sample. `fraction=0.1` means Spark aims to return about 10% of the rows on average.")
df.sample(withReplacement=False, fraction=0.1, seed=42).show()


print_section("Rows")
raw_row = Row("Nina", 5)
named_row = Row(course="spark", lessons=12)
print(raw_row)
print(named_row)

spark.stop()
