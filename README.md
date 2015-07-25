INTRODUCTION:
This project is provided to extract and clean data from the accelerometers from the Samsung Galaxy S smartphone. Some data manipulation has already been performed and this project runs scripts to create a finally summary data set describing the mean and standard deviations from the provided data.

In order to obtain the final data set execute this script:run_analysis.R

The original data was obtained through the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

SCRIPT EXPLANATIONS:

create_file_names_vars.R
  This script is used to load R variables with the names of files and their locations.
  
data_readers.R
  A script to read the data files and load then into R variables. It only loads a series of variables and it seperated in order to make the primary script neater.
  
download_and_unpack.R
  A script to download and unpack the original zip file containing the untidy data sets. It contains code run as the R file is sourced.
  
export_functions.R
  A script to write the final tidy data set to a file. It contains two functions 
  
run_analysis.R
  The main script. Run this to obtain the target data set.