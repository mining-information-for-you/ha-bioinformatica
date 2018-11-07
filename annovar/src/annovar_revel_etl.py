from pyspark.sql import SparkSession

def get_spark_session(appName = "MI4U"):
    spark = SparkSession.builder\
                        .appName(appName) \
                        .config("spark.jars.packages", "com.datastax.spark:spark-cassandra-connector_2.11:2.3.2") \
                        .config("spark.cassandra.connection.host", "172.3.3.11") \
                        .getOrCreate()

    return spark


def run_revel_etl():
    FILE_PATH = "../data-spark/hg19_revel.txt"
    spark = get_spark_session("Annovar Revel ETL")

    hg19_revel = spark.read.csv(FILE_PATH, header=True, sep="\t")
    hg19_revel.createOrReplaceTempView("hg19_revel")

    hg19_revel = spark.sql("SELECT `#Chr` AS chromosome, \
                                    Start AS start, \
                                    End AS end, \
                                    Ref AS ref, \
                                    Alt AS alt, \
                                    REVEL AS revel \
                            FROM hg19_revel")

    hg19_revel.write\
              .format("org.apache.spark.sql.cassandra")\
              .mode("append")\
              .options(table="hg19_revel", keyspace="sequence_databases")\
              .save()

    spark.stop()


if __name__ == "__main__":
    run_revel_etl()

