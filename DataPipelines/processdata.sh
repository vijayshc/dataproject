#! /bin/bash
export SPARK_HOME=/home/dexter/anaconda3/lib/python3.9/site-packages/pyspark
export JAVA_HOME=/mnt/c/Users/vijay/Downloads/jdk-18.0.1.1
export PATH=$PATH:$SPARK_HOME:/mnt/c/Users/vijay/Downloads/jdk-18.0.1.1/bin

# Logger function

logger(){
	echo `date +'%Y-%m-%d %H:%M:%S'` $1
	echo `date +'%Y-%m-%d %H:%M:%S'` $1 >> $logDir/$logFile
}


# Initialize values

currDir=`dirname $0`
cd $currDir

currTime=`date +%Y%m%d%H%M%S`
logDir=data/log
logFile=etlprocessor_${currTime}.log

# Copy files in input directory to processing directory and convert to linux format

if [ `find data/in/ -maxdepth 1 -type f | wc -l` -eq 0 ]
then
	logger "No files to process"
	exit 0
fi	

logger "We have files to process. Proceeding to process"

for file in `ls ./data/in/*`
do
	fileName=`basename $file`
	justFileName=`basename $file ".csv"`
	mv $file ./data/processing/${justFileName}_${currTime}.csv
	dos2unix ./data/processing/${justFileName}_${currTime}.csv
done

logger "Submitting spark application"

/home/dexter/anaconda3/bin/spark-submit src/processmaster.py ${currTime}

if [ $? -eq 0 ]
then

	logger "Taking output file and placing in out directory"
	ret=0
	for file in `find data/out/${currTime}/ -maxdepth 1 -type f -name "*.csv"`
	do
		mv $file data/out/outputfile_${currTime}.csv
		if [ $? -ne 0 ]
		then
			ret=1
		fi
		logger "Copied output file data/out/outputfile_${currTime}.csv"
	done
	if [ "$ret" -eq 0 ]
	then
		rm -rf data/out/${currTime} 2>/dev/null
	fi

	logger "File processing succesfully completed. Archiving file"

	for file in `find data/processing/ -maxdepth 1 -type f -name "*${currTime}*"`
	do
		mv $file data/archive/
		cd data/archive
		fileName=`basename $file`
		zip ${fileName}.zip $fileName
		if [ $? -eq 0 ]
		then
			rm $fileName
		fi
		cd -
	done
	exit 0
else
	logger "Error in processing file. Please check"
	exit 1
fi

