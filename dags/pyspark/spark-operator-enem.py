from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession


aws_access_key_id = Variable.get('aws_access_key_id')
aws_secret_access_key = Variable.get('aws_secret_access_key')
# apply config
sc = SparkContext().getOrCreate()
    

if __name__ == "__main__":

    # init spark session
    spark = SparkSession\
            .builder\
            .appName("Repartition Job")\
            .getOrCreate()

    spark.sparkContext.setLogLevel("WARN")

    df = (
        spark
        .read
        .format("csv")
        .options(header='true', inferSchema='true', delimiter=';')
        .load("s3://dl-landing-zone-608636080729/enem/")
    )
    
    df.printSchema()

    (df
    .write
    .mode("overwrite")
    .format("parquet")
    .save("s3://dl-processing-zone-608636080729/enem/")
    )

    print("*****************")
    print("Escrito com sucesso!")
    print("*****************")

    spark.stop()