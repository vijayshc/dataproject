# Data Pipelines

## Tools

1. pySpark

2. Shell script

3. crontab


## Sources

Input data `dataset1.csv` and `dataset2.csv`

## Approach

We have following directories,

`src/` - Directory for pyspark code

`data/in` - Input directory for file arrival

`data/out` - Output directory to place processed file

`data/processing` - Intermediate processing directory 

`data/archive` - zip and archive the processed files

Current directory contains script `processdata.sh` which orchestrate all the operations. 

Below are the steps performed,

1. Receive file in `in` directory
2. Move the file to processing directory and perform preprocessing of remove Ctrl+M char
3. Invoke spark code to perform necessary transformation
    
    a. Read all the files in processing directory. We can have more than one file to process

    b. Transform name - Split by first name and last time (after cleanup of titles)

    c. Transform price - Convert to decimal ( decimal conversion will automatically remove leading 0)

    d. Filter the records where name is not available

4. Once data processed, output files are written in `out` directory
5. Script Deletes intermediate processing files
6. Input file archived with zip in `archive` directory
    
Crontab file `crontab` contains command to schedule in crontab to trigger everyday at 1am after file arrival. Necessary profile files are imported in crontab and python code to get SPARK_HOME and other properties. 


