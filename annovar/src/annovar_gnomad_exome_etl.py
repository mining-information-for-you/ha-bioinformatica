from pyspark.sql import SparkSession

def get_spark_session(appName = "MI4U"):
    spark = SparkSession.builder.appName(appName).getOrCreate()

    return spark


def run_gnomad_exome_etl():
    FILE_PATH = "../data/hg19_gnomad_exome.txt"
    spark = get_spark_session("Annovar gnomAD exome ETL")

    hg19_gnomad_exome = spark.read.csv(FILE_PATH, header=True, sep="\t")
    hg19_gnomad_exome.createOrReplaceTempView("hg19_gnomad_exome")

    hg19_gnomad_exome = spark.sql("SELECT `#Chr` AS chromosome, \
                                          Start AS start, \
                                          End AS end, \
                                          Ref AS ref, \
                                          Alt AS alt, \
                                          gnomAD_exome_ALL AS gnomad_exome_all, \
                                          gnomAD_exome_AFR AS gnomad_exome_afr, \
                                          gnomAD_exome_AMR AS gnomad_exome_amr, \
                                          gnomAD_exome_ASJ AS gnomad_exome_asj, \
                                          gnomAD_exome_EAS AS gnomad_exome_eas, \
                                          gnomAD_exome_FIN AS gnomad_exome_fin, \
                                          gnomAD_exome_NFE AS gnomad_exome_nfe, \
                                          gnomAD_exome_OTH AS gnomad_exome_oth, \
                                          gnomAD_exome_SAS AS gnomad_exome_sas \
                                    FROM hg19_gnomad_exome")

    hg19_gnomad_exome.write.format("org.apache.spark.sql.cassandra").mode("append").options(table="hg19_gnomad_exome", keyspace="sequence_databases").save()
    spark.stop()


if __name__ == "__main__":
    run_gnomad_exome_etl()

