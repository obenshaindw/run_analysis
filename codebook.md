Codebook for tidyData.csv
=========
This codebook describes the output from running run_analysis.R on the /UCI HAR Dataset/ (see readme.md for more details on the source for this dataset).

#Tidy Dataset

##Merging of Data
Please see the readme.md file for a description of how this dataset is assembled from the various files provided in the UCI HAR Dataset.

##Subset of original data
This dataset represents a subset of the original dataset (see Original Dataset below).  The Tidy Dataset is intended to include only those values from the original dataset that represent mean or standard deviation.  The original codebook indicates that variables with *mean()* or *std()* represent a Mean value, or Standard deviation, respectively. Therefore, variables for selected for inclusion in the Tidy Dataset if the variable name included *mean()* or *std()*.  A total of 66 out of the original 561 variables, represent a mean or standard deviation.

In addition to creating a subset of the original data, the Tidy Dataset represents the average of each selected variable for each subject and each activity.  
##Rows
The first two columns in the dataset represent row labels, identifying the subject and activity combination for each row:
There are total of 30 subjects represented with values from 1 to 30, these are contained in the *subject_id* column.
There are a total of 6 activity types, these are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING, and this is contained in the *activity* column.

Thus for 30 subjects, for each of 6 activities, there are a total of 180 rows.

##Columns
Each of the columns (excluding columns that represent row labels, see above) provide the Average value for each of the selected variables from the original dataset, for a given subject and activity combination.
The average is calculated using the R function, mean().  A description of the origin for the original dataset, including what each of the original variables represent, is provided in the (Original Dataset section below).
The variables provided in tidyData.csv are as follows:

Avg of tBodyAcc-mean()-X,
Avg of tBodyAcc-mean()-Y,
Avg of tBodyAcc-mean()-Z,
Avg of tBodyAcc-std()-X,
Avg of tBodyAcc-std()-Y,
Avg of tBodyAcc-std()-Z,
Avg of tGravityAcc-mean()-X,
Avg of tGravityAcc-mean()-Y,
Avg of tGravityAcc-mean()-Z,
Avg of tGravityAcc-std()-X,
Avg of tGravityAcc-std()-Y,
Avg of tGravityAcc-std()-Z,
Avg of tBodyAccJerk-mean()-X,
Avg of tBodyAccJerk-mean()-Y,
Avg of tBodyAccJerk-mean()-Z,
Avg of tBodyAccJerk-std()-X,
Avg of tBodyAccJerk-std()-Y,
Avg of tBodyAccJerk-std()-Z,
Avg of tBodyGyro-mean()-X,
Avg of tBodyGyro-mean()-Y,
Avg of tBodyGyro-mean()-Z,
Avg of tBodyGyro-std()-X,
Avg of tBodyGyro-std()-Y,
Avg of tBodyGyro-std()-Z,
Avg of tBodyGyroJerk-mean()-X,
Avg of tBodyGyroJerk-mean()-Y,
Avg of tBodyGyroJerk-mean()-Z,
Avg of tBodyGyroJerk-std()-X,
Avg of tBodyGyroJerk-std()-Y,
Avg of tBodyGyroJerk-std()-Z,
Avg of tBodyAccMag-mean(),
Avg of tBodyAccMag-std(),
Avg of tGravityAccMag-mean(),
Avg of tGravityAccMag-std(),
Avg of tBodyAccJerkMag-mean(),
Avg of tBodyAccJerkMag-std(),
Avg of tBodyGyroMag-mean(),
Avg of tBodyGyroMag-std(),
Avg of tBodyGyroJerkMag-mean(),
Avg of tBodyGyroJerkMag-std(),
Avg of fBodyAcc-mean()-X,
Avg of fBodyAcc-mean()-Y,
Avg of fBodyAcc-mean()-Z,
Avg of fBodyAcc-std()-X,
Avg of fBodyAcc-std()-Y,
Avg of fBodyAcc-std()-Z,
Avg of fBodyAccJerk-mean()-X,
Avg of fBodyAccJerk-mean()-Y,
Avg of fBodyAccJerk-mean()-Z,
Avg of fBodyAccJerk-std()-X,
Avg of fBodyAccJerk-std()-Y,
Avg of fBodyAccJerk-std()-Z,
Avg of fBodyGyro-mean()-X,
Avg of fBodyGyro-mean()-Y,
Avg of fBodyGyro-mean()-Z,
Avg of fBodyGyro-std()-X,
Avg of fBodyGyro-std()-Y,
Avg of fBodyGyro-std()-Z,
Avg of fBodyAccMag-mean(),
Avg of fBodyAccMag-std(),
Avg of fBodyBodyAccJerkMag-mean(),
Avg of fBodyBodyAccJerkMag-std(),
Avg of fBodyBodyGyroMag-mean(),
Avg of fBodyBodyGyroMag-std(),
Avg of fBodyBodyGyroJerkMag-mean(),
Avg of fBodyBodyGyroJerkMag-std()


#Original Dataset
This section is taken almost entirely verbatim from the features_info.txt file contained in the 'UCI HAR Dataset'.  The entire dataset, including the features_info.txt file can be obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#.  Please see the readme.md file for a description of how the tidyData.csv file is assembled from the originial dataset.

The original dataset contains features selected from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ from a Samsung Galaxy S II smartphone worn on the waist. 
The time domain signals a prefixed with a 't' to denote time, and were captured at a constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
 
The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt' contained in the original UCI HAR Dataset.





