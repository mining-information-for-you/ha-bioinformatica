from pyspark.sql import SparkSession

def get_spark_session(appName = "MI4U"):
    spark = SparkSession.builder\
                        .appName(appName)\
                        .getOrCreate()

    return spark


def run_gerp_elem_etl():
    FILE_PATH = "/tmp/data/hg19_gerp++elem.txt"
    spark = get_spark_session("Annovar gerp++elem ETL")

    hg19_gerp_elem = spark.read.csv(FILE_PATH, header=False, sep="\t")
    hg19_gerp_elem.createOrReplaceTempView("hg19_gerp_elem")

    hg19_gerp_elem = spark.sql("SELECT SUBSTRING(`_c0`, 4, 10) AS chromosome,"
              "       `_c1` AS start,"
              "       `_c2` AS end, "
              "       `_c3` AS rs_score, "
              "       `_c4` AS p_value "
              "FROM hg19_gerp_elem")

    hg19_gerp_elem.write\
                  .format("org.apache.spark.sql.cassandra")\
                  .mode("append")\
                  .options(table="hg19_gerp_elem", keyspace="sequence_databases")\
                  .save()

    spark.stop()


if __name__ == "__main__":
    run_gerp_elem_etl()

