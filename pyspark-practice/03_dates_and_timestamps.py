from pyspark.sql.functions import (
    add_months,
    col,
    current_date,
    current_timestamp,
    datediff,
    to_date,
    to_timestamp,
)

from _common import get_spark, print_section


spark = get_spark("practice-dates-and-timestamps")

events = [
    ("job_101", "2026-01-15", "2026-01-15 08:15:00"),
    ("job_102", "2026-02-10", "2026-02-10 11:45:30"),
    ("job_103", "2026-03-01", "2026-03-01 06:05:10"),
]

df = spark.createDataFrame(events, ["job_id", "run_date_text", "run_timestamp_text"])

print_section("Parsed Dates")
df_parsed = (
    df.withColumn(colName="run_date", col=to_date(col="run_date_text", format="yyyy-MM-dd"))
    .withColumn(colName="run_timestamp", col=to_timestamp(col="run_timestamp_text", format="yyyy-MM-dd HH:mm:ss"))
    .withColumn(colName="date_plus_two_months", col=add_months(start=col("run_date"), months=2))
)
df_parsed.show(truncate=False)

print_section("Date Differences")
df_date_diff = df_parsed.select(
    "job_id",
    "run_date",
    datediff(end=current_date(), start=col("run_date")).alias("days_since_run"),
    current_timestamp().alias("captured_at"),
)
df_date_diff.show(truncate=False)

spark.stop()
