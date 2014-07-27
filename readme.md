run_analysis.R
=========

This R script is designed to work with the Human Activity Recognition Using Smartphones Data Set from [UCI].  The script is designed to do the following:

  - Merge the test and training datasets
  - Label the rows and columns with descriptive labels
  - Create a subset of the data ( selecting mean and standard deviation variables)
  - Create a tidy dataset from the subset, with the average of each variable for each activity and each subject. 


##Data Files

The actual zip file with data can be downloaded directly from [here].  The files should be extracted, including the root folder 'UCI HAR Dataset' directory and placed in the same folder as this script.  The script will check to see that the folder is available before executing.

##Requirements
The script requires the original UCI HAR Dataset folder and the plyr library.

##Running the Script

Sourcing the run_analysis.R script will execute the script

```sh
# Make sure run_analsis.R and /UCI HAR Dataset/ folder are in your working directory
setwd(dir='run_analysis/')
source('~/run_analysis.R')
```

##Explanation of what the script does
The script merges together the various files provided in the UCI HAR Dataset, into data frames using *rbind()* and *cbind()*; the *x_test.txt* and *x_train.txt* files contain the rows of data, each with 561 features, which are listed (in order) in *features.txt*.  The rows are labeled with the *subjects_* and *y_* files.  

The script labels the columns with feature labels using *names()* funciton and the values from *features.txt*.  The script also labels rows with subject_id, given in *subjects_test.txt* and *subjects_train.txt*, and actvity label givn in *y_test.txt* and *y_train.txt*.  The activity labels in these text files are numerical and correspond to the labels given in *activity_labels.txt*.  The script replaces the numerical values with actual descriptive lables.

The script then creates a subset of the merged data, selecting out column names with 'mean()' or 'std()' representing mean and standard deviation variables using the *grep()* function and a regular expression that identifies column names that match.

Finally the script generates a tidy dataset with the average of each variable for each activity and each subject.  This is done with *ddply()* and *colwise()* two functions from the *plyr* library.  The ddply function allows you to apply functions on a grouping of data, in this case data are grouped by subject_id and activity; the function applied is colwise(), which enables us to apply a function to each column in the dataset, like *mean()* to get the average of each variable.


The run_analysis.R script includes comments in each of the functions to describe what is being done.  After running the script you should expect three data frames to be returned:

1. dataMerged: contains all original data, merging test and train datasets with row/column labels.
2. dataSubset: contains a subset of the merged data that has columns with only mean and standard deviation, selects only variables with names that include mean() or std().
3. tidyData: contains average of variables in dataSubset grouped by subject_id and activity.