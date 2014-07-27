# This R Script is designed to work with the dataset located here: 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# The script has 4 functions:
# 1. checkFilesFunc: checks that the UCI HAR Dataset folder exists in the working directory
# 2. mergeDataFunc: merges the test and training datasets, adds variable names and descriptive activity labels
# 3. subsetDataFunc: creates a subset of the dataset of only the Mean and SD variables
# 4. tidyDataFunc: creates a tidy dataset with the Average of each variable in the dataSubset for each activty and each subject 

# Running this script with the 'UCI HAR Dataset' in the working directory will return 3 dataframes and output the tidy dataset as a csv.
# 1. dataMerged: contains all original data, merging test and train datasets with row/column labels.
# 2. dataSubset: contains a subset of the merged data, selecting only mean() or std() varaibles.
# 3. tidyData: contains average of variables in dataSubset grouped by subject_id and activity.
# 4. tidyData.csv: script will create this file in your working directory, and it will contain the data from the tidyData dataframe.

library(plyr)

checkFilesFunc <- function()
{
  print('Checking for presence of UCI HAR Dataset files...')
  
  # Uses file.exists function to determine that a UCI HAR Dataset folder exists in the working directory.
  fileExists <- file.exists('UCI HAR Dataset')
  print (fileExists)
}


mergeDataFunc <- function()
{
  # Reads in rows (x_test & x_train.txt) for test and train datasets, and merges them using rbind
  mergedRows <- (
    rbind ( read.table(file = 'UCI HAR Dataset/test/X_test.txt'), read.table(file = 'UCI HAR Dataset/train/X_train.txt') )
  )
  
  # Reads in the activity labels, which contain numerical value representing each activity
  activityLabels <- read.table(sep = " ", file = 'UCI HAR Dataset/activity_labels.txt')
  
  # Reads in numeric activity labels (y_test & y_train.txt) for test and train datasets, and merges them using rbind
  mergedYaxis <- (
    rbind ( read.table(file = 'UCI HAR Dataset/test/y_test.txt'), read.table(file = 'UCI HAR Dataset/train/y_train.txt') )
  )
  
  # For each activity label, replaces the numerical value in mergedYAxis (see above) with a desriptive label.
  for (i in 1:nrow(activityLabels))
  {
    mergedYaxis$V1[mergedYaxis$V1 == i] <- paste(activityLabels$V2[i])
  }
  
  # Reads in subjects (subject_test & subject_train.txt) for test and train datasets, and merges them using rbind
  mergedSubjects <- rbind ( read.table(file= 'UCI HAR Dataset/test/subject_test.txt'), read.table(file='UCI HAR Dataset/train/subject_train.txt') )
  
  # Reads in variable names from features.txt and assigns to column names in mergedRows
  columnNames <- read.table( file='UCI HAR Dataset/features.txt')
  names(mergedRows) <- columnNames$V2 
  
  # Merges list of subjects and activity labels and assings column names
  mergedYaxis <- cbind (mergedSubjects, mergedYaxis)
  names(mergedYaxis) <- c("subject_id", "activity")
  
  # Merges row names (subject_id, activity) with rows of data (mergedRows) 
  mergedData <- cbind (mergedYaxis, mergedRows) 
  return (mergedData)
}

subsetDataFunc <- function(x)
{
  # Returns a subset of data where any column name has the text mean() or std()
  dataSubset <- x[,grep("mean\\(\\)|std\\(\\)", names(x), perl = TRUE )]
  dataSubset <- cbind(x[,1:2], dataSubset)
  return (dataSubset)
}

tidyDataFunc <- function(x)
{
  # Makes use of plyr library functions ddply and colwise
  # Uses the ddply function to summarize data grouped by subject_id and activity
  # Uses the colwise function to operate on a vector of column names, applying a function, in this case mean()
  # Returns a dataframe with the average of each column, grouped by subject_id and activity.
  tidyDataMean <- ddply(x, c('subject_id', 'activity'), colwise(mean))
  
  # Updates column names to indicate variables now represent an Average of the original variable
  names(tidyDataMean)[3:ncol(tidyDataMean)] <- paste("Avg of", names(tidyDataMean)[3:ncol(tidyDataMean)])

  return (tidyDataMean)
}


## Main Function, checks if dataset folder exists, merges, subsets, makes tidy dataset, and outputs the data.

foundFiles <- checkFilesFunc()

if ( foundFiles )
{
  dataMerged <- mergeDataFunc()
  dataSubset <- subsetDataFunc(dataMerged)
  tidyData <- tidyDataFunc(dataSubset)
  write.table(tidyData, file="tidyData.csv", sep=",", row.names= FALSE )

} else {
  print( paste("Cannot find directory 'UCI HAR Dataset' folder in the working directory", getwd(), "check your working directory." ))
}

