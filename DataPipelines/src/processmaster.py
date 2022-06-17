from pyspark.sql import SparkSession
import pyspark.sql.functions
import sys

appName = "ETL_processor"
processId=sys.argv[1]
spark = SparkSession.builder.appName(appName).getOrCreate()

inputData = spark.read.csv("data/processing/",
                           header=True, inferSchema=False)

inputData.printSchema()
inputData.createOrReplaceTempView("inputData")

processQuery = """
select
split(trim(substr(name,instr(replace(name,'Jr.',''),'.')+1,length(name)))," ")[0] as first_name
,split(trim(substr(name,instr(replace(name,'Jr.',''),'.')+1,length(name)))," ")[1] as last_name
,cast(price as decimal(28,8)) as price
,cast(case when cast(price as decimal(28,8)) > 100 then 'true' end as string) as above_100
from inputData
where name is not null
"""
spark.sql(processQuery).coalesce(1).write.option("header",True).csv("data/out/"+str(processId), mode="overwrite")
