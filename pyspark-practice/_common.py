from pyspark.sql import SparkSession


def get_spark(app_name: str) -> SparkSession:
    return SparkSession.builder.master("local[*]").appName(app_name).getOrCreate()


def print_section(title: str) -> None:
    line = "=" * len(title)
    print(f"\n{line}\n{title}\n{line}")
