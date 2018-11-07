from pyspark.sql import SparkSession

def get_spark_session(appName = "MI4U"):
    spark = SparkSession.builder\
                        .appName(appName) \
                        .config("spark.jars.packages", "com.datastax.spark:spark-cassandra-connector_2.11:2.3.2") \
                        .config("spark.cassandra.connection.host", "172.3.3.11") \
                        .getOrCreate()

    return spark


def run_cadd13_etl():
    FILE_PATH = "../data-spark/hg19_cadd13.txt"
    spark = get_spark_session("Annovar cadd13 ETL")

    hg19_cadd13 = spark.read.csv(FILE_PATH, header=True, sep="\t")
    hg19_cadd13 = hg19_cadd13.limit(1000)
    hg19_cadd13.createOrReplaceTempView("hg19_cadd13")

    hg19_cadd13 = spark.sql("SELECT `#Chr` AS chromosome,"
                            "       Start AS start,"
                            "       End AS end,"
                            "       Ref AS ref,"
                            "       Alt AS alt,"
                            "       CADD13_RawScore AS cadd13_rawscore,"
                            "       CADD13_PHRED AS cadd13_phred "
                            "FROM hg19_cadd13 ")

    hg19_cadd13.write\
               .format("org.apache.spark.sql.cassandra")\
               .mode("append")\
               .options(table="hg19_cadd13", keyspace="sequence_databases")\
               .save()

    spark.stop()


if __name__ == "__main__":
    run_cadd13_etl()

