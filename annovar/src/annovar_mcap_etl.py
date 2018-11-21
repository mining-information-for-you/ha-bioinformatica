from pyspark.sql import SparkSession

def get_spark_session(appName = "MI4U"):
    spark = SparkSession.builder\
                        .appName(appName) \
                        .getOrCreate()

    return spark


def run_mcap_etl():
    FILE_PATH = "/data-spark/hg19_mcap.txt"
    spark = get_spark_session("Annovar MCAP ETL")

    hg19_mcap = spark.read.csv(FILE_PATH, header=True, sep="\t")
    hg19_mcap.createOrReplaceTempView("hg19_mcap")

    hg19_mcap = spark.sql("SELECT `#Chr` AS chromosome,\
                                  Start AS start, \
                                  End AS end, \
                                  Ref AS ref, \
                                  Alt AS alt, \
                                  MCAP AS mcap \
                          FROM hg19_mcap")

    hg19_mcap.write\
             .format("org.apache.spark.sql.cassandra")\
             .mode("append")\
             .options(table="hg19_mcap", keyspace="sequence_databases")\
             .save()

    spark.stop()


if __name__ == "__main__":
    run_mcap_etl()

