from pyspark.sql import SparkSession

def get_spark_session(appName = "MI4U"):
    spark = SparkSession.builder\
                        .appName(appName)\
                        .getOrCreate()

    return spark


def run_clinvar_etl():
    FILE_PATH = "/tmp/data/hg19_clinvar_20170905.txt"
    spark = get_spark_session("Annovar Clinvar ETL")

    hg19_clinvar = spark.read.csv(FILE_PATH, header=True, sep="\t")
    hg19_clinvar.createOrReplaceTempView("hg19_clinvar")

    hg19_clinvar = spark.sql("SELECT `#Chr` AS chromosome, \
                                     Start AS start, \
                                     End AS end, \
                                     Ref AS ref, \
                                     Alt AS alt, \
                                     CLINSIG AS clinsig, \
                                     CLNDBN AS clndbn, \
                                     CLNACC AS clnacc, \
                                     CLNDSDB AS clndsdb, \
                                     CLNDSDBID AS clndsdbid \
                             FROM hg19_clinvar")

    hg19_clinvar.write\
                .format("org.apache.spark.sql.cassandra")\
                .mode("append")\
                .options(table="hg19_clinvar", keyspace="sequence_databases")\
                .save()

    spark.stop()


if __name__ == "__main__":
    run_clinvar_etl()

