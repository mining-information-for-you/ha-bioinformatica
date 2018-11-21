from pyspark.sql import SparkSession

def get_spark_session(appName = "MI4U"):
    spark = SparkSession.builder\
                        .appName(appName) \
                        .getOrCreate()

    return spark


def run_avsnp150_etl():
    FILE_PATH = "/data-spark/hg19_avsnp150.txt"
    spark = get_spark_session("Annovar avsnp150 ETL")

    hg19_avsnp150 = spark.read.csv(FILE_PATH, header=False, sep="\t")
    hg19_avsnp150.createOrReplaceTempView("hg19_avsnp150")

    hg19_avsnp150 = spark.sql("SELECT `_c0` AS chromosome, \
                                      `_c1` AS start, \
                                      `_c2` AS end, \
                                      `_c3` AS ref, \
                                      `_c4` AS alt, \
                                      `_c5` AS human_varianty \
                               FROM hg19_avsnp150")

    hg19_avsnp150.write\
                 .format("org.apache.spark.sql.cassandra")\
                 .mode("append")\
                 .options(table="hg19_avsnp150", keyspace="sequence_databases")\
                 .save()

    spark.stop()


if __name__ == "__main__":
    run_avsnp150_etl()

