from pyspark.sql import SparkSession

def get_spark_session(appName = "MI4U"):
    spark = SparkSession.builder\
                        .appName(appName) \
                        .getOrCreate()

    return spark


def run_abraom_etl():
    FILE_PATH = "/data-spark/hg19_abraom.txt"
    spark = get_spark_session("Annovar Abraom ETL")

    hg19_abraom = spark.read.csv(FILE_PATH, header=True, sep="\t")

    hg19_abraom.createOrReplaceTempView("hg19_abraom")

    hg19_abraom = spark.sql("SELECT `#Chr` AS chromosome, \
                                    Start AS start, \
                                    End AS end, \
                                    Ref AS ref, \
                                    Alt AS alt, \
                                    abraom_freq, \
                                    abraom_filter, \
                                    abraom_cegh_filter \
                            FROM hg19_abraom")

    hg19_abraom.write\
               .format("org.apache.spark.sql.cassandra")\
               .mode("append")\
               .options(table="hg19_abraom", keyspace="ha_bioinformatica")\
               .save()

    spark.stop()


if __name__ == "__main__":
    run_abraom_etl()

