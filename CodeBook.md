#Code Book


## Raw Data Variable Descriptions

From the features_info.txt file in **getdata-projectfiles-UCI HAR Dataset.zip** in the UCI HAR Dataset directory:

> Feature Selection 
> 
> 
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
> 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
> 
> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
> 
> 
tBodyAcc-XYZ <br>
> tGravityAcc-XYZ <br>
> tBodyAccJerk-XYZ <br>
> tBodyGyro-XYZ <br>
> tBodyGyroJerk-XYZ <br>
> tBodyAccMag <br>
> tGravityAccMag <br>
> tBodyAccJerkMag <br>
> tBodyGyroMag <br>
> tBodyGyroJerkMag <br>
> fBodyAcc-XYZ <br>
> fBodyAccJerk-XYZ <br>
> fBodyGyro-XYZ <br>
> fBodyAccMag <br>
> fBodyAccJerkMag <br>
> fBodyGyroMag <br>
> fBodyGyroJerkMag <br>
> 
> The set of variables that were estimated from these signals are: 
> 
> mean(): Mean value <br>
> std(): Standard deviation <br>
> mad(): Median absolute deviation  <br>
> max(): Largest value in array <br>
> min(): Smallest value in array <br>
> sma(): Signal magnitude area <br>
> energy(): Energy measure. Sum of the squares divided by the number of values.  <br>
> iqr(): Interquartile range  <br>
> entropy(): Signal entropy <br>
> arCoeff(): Autorregresion coefficients with Burg order equal to 4 <br>
> correlation(): correlation coefficient between two signals <br>
> maxInds(): index of the frequency component with largest magnitude <br>
> meanFreq(): Weighted average of the frequency components to obtain a mean frequency <br>
> skewness(): skewness of the frequency domain signal  <br>
> kurtosis(): kurtosis of the frequency domain signal  <br>
> bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window. <br>
> angle(): Angle between to vectors. <br>
> 
> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
> 
> gravityMean <br>
> tBodyAccMean <br>
> tBodyAccJerkMean <br>
> tBodyGyroMean <br>
> tBodyGyroJerkMean <br>
> 
> The complete list of variables of each feature vector is available in 'features.txt'

## Tidy Data Set Generation

The original raw data was split into a training set and a test set. Each set was further subdivided into subject ID, activity ID, and feature data text files, for a total of six files.

The tidy data set was generated in the following process (see README.md for a more detailed description of the script):

* The six text files were merged into one data set
* All variables were discarded apart from the mean and standard deviation variables
* The activity IDs were replaced with the activity labels
* The column names were replaced with more descriptive variable names
* The data set was grouped by subject ID and activity
* The final tidy data set was produced through averaging each variable for each activity and subject


## Tidy Data Set Structure


### Dimensions

180 observations of 68 columns (2 ID columns, 66 variable columns).


### ID Descriptions

| ID Name   | Description                                                       |
|-----------|-------------------------------------------------------------------|
| SubjectId | The subject ID of the 30 subject participants                     |
| Activity  | The activity performed description of the 6 possible activities |


### Extracted Feature Variable Descriptions

| Variable                    | Description                                                                               |
|-----------------------------|-------------------------------------------------------------------------------------------|
| tBodyAcc-mean()-X           | Mean of body acceleration time domain signal for the X direction                          |
| tBodyAcc-mean()-Y           | Mean of body acceleration time domain signal for the Y direction                          |
| tBodyAcc-mean()-Z           | Mean of body acceleration time domain signal for the Z direction                          |
| tBodyAcc-std()-X            | Standarad deviation of body acceleration time domain signal for the X direction           |
| tBodyAcc-std()-Y            | Standarad deviation of body acceleration time domain signal for the Y direction           |
| tBodyAcc-std()-Z            | Standarad deviation of body acceleration time domain signal for the Z direction           |
| tGravityAcc-mean()-X        | Mean of gravity acceleration time domain signal for the X direction                       |
| tGravityAcc-mean()-Y        | Mean of gravity acceleration time domain signal for the Y direction                       |
| tGravityAcc-mean()-Z        | Mean of gravity acceleration time domain signal for the Z direction                       |
| tGravityAcc-std()-X         | Standarad deviation of gravity acceleration time domain signal for the X direction        |
| tGravityAcc-std()-Y         | Standarad deviation of gravity acceleration time domain signal for the Y direction        |
| tGravityAcc-std()-Z         | Standarad deviation of gravity acceleration time domain signal for the Z direction        |
| tBodyAccJerk-mean()-X       | Mean of body jerk acceleration time domain signal for the X direction                     |
| tBodyAccJerk-mean()-Y       | Mean of body jerk acceleration time domain signal for the Y direction                     |
| tBodyAccJerk-mean()-Z       | Mean of body jerk acceleration time domain signal for the Z direction                     |
| tBodyAccJerk-std()-X        | Standarad deviation of body jerk acceleration time domain signal for the X direction      |
| tBodyAccJerk-std()-Y        | Standarad deviation of body jerk acceleration time domain signal for the Y direction      |
| tBodyAccJerk-std()-Z        | Standarad deviation of body jerk acceleration time domain signal for the Z direction      |
| tBodyGyro-mean()-X          | Mean of body gyroscope time domain signal for the X direction                             |
| tBodyGyro-mean()-Y          | Mean of body gyroscope time domain signal for the Y direction                             |
| tBodyGyro-mean()-Z          | Mean of body gyroscope time domain signal for the Z direction                             |
| tBodyGyro-std()-X           | Standarad deviation of body gyroscope time domain signal for the X direction              |
| tBodyGyro-std()-Y           | Standarad deviation of body gyroscope time domain signal for the Y direction              |
| tBodyGyro-std()-Z           | Standarad deviation of body gyroscope time domain signal for the Z direction              |
| tBodyGyroJerk-mean()-X      | Mean of body jerk gyroscope time domain signal for the X direction                        |
| tBodyGyroJerk-mean()-Y      | Mean of body jerk gyroscope time domain signal for the Y direction                        |
| tBodyGyroJerk-mean()-Z      | Mean of body jerk gyroscope time domain signal for the Z direction                        |
| tBodyGyroJerk-std()-X       | Standarad deviation of body jerk gyroscope time domain signal for the X direction         |
| tBodyGyroJerk-std()-Y       | Standarad deviation of body jerk gyroscope time domain signal for the Y direction         |
| tBodyGyroJerk-std()-Z       | Standarad deviation of body jerk gyroscope time domain signal for the Z direction         |
| tBodyAccMag-mean()          | Mean of body acceleration time domain signal magnitude                                    |
| tBodyAccMag-std()           | Stndard deviation of body acceleration time domain signal magnitude                       |
| tGravityAccMag-mean()       | Mean of gravity acceleration time domain signal magnitude                                 |
| tGravityAccMag-std()        | Stndard deviation of gravity acceleration time domain signal magnitude                    |
| tBodyAccJerkMag-mean()      | Mean of body jerk acceleration time domain signal magnitude                               |
| tBodyAccJerkMag-std()       | Stndard deviation of body jerk acceleration time domain signal magnitude                  |
| tBodyGyroMag-mean()         | Mean of body gyroscope time domain signal magnitude                                       |
| tBodyGyroMag-std()          | Stndard deviation of body gyroscope time domain signal magnitude                          |
| tBodyGyroJerkMag-mean()     | Mean of body jerk gyroscope time domain signal magnitude                                  |
| tBodyGyroJerkMag-std()      | Stndard deviation of body jerk gyroscope time domain signal magnitude                     |
| fBodyAcc-mean()-X           | Mean of body acceleration frequency domain signal for the X direction                     |
| fBodyAcc-mean()-Y           | Mean of body acceleration frequency domain signal for the Y direction                     |
| fBodyAcc-mean()-Z           | Mean of body acceleration frequency domain signal for the Z direction                     |
| fBodyAcc-std()-X            | Standarad deviation of body acceleration frequency domain signal for the X direction      |
| fBodyAcc-std()-Y            | Standarad deviation of body acceleration frequency domain signal for the Y direction      |
| fBodyAcc-std()-Z            | Standarad deviation of body acceleration frequency domain signal for the Z direction      |
| fBodyAccJerk-mean()-X       | Mean of body jerk acceleration frequency domain signal for the X direction                |
| fBodyAccJerk-mean()-Y       | Mean of body jerk acceleration frequency domain signal for the Y direction                |
| fBodyAccJerk-mean()-Z       | Mean of body jerk acceleration frequency domain signal for the Z direction                |
| fBodyAccJerk-std()-X        | Standarad deviation of body jerk acceleration frequency domain signal for the X direction |
| fBodyAccJerk-std()-Y        | Standarad deviation of body jerk acceleration frequency domain signal for the Y direction |
| fBodyAccJerk-std()-Z        | Standarad deviation of body jerk acceleration frequency domain signal for the Z direction |
| fBodyGyro-mean()-X          | Mean of body gyroscope frequency domain signal for the X direction                        |
| fBodyGyro-mean()-Y          | Mean of body gyroscope frequency domain signal for the Y direction                        |
| fBodyGyro-mean()-Z          | Mean of body gyroscope frequency domain signal for the Z direction                        |
| fBodyGyro-std()-X           | Standarad deviation of body gyroscope frequency domain signal for the X direction         |
| fBodyGyro-std()-Y           | Standarad deviation of body gyroscope frequency domain signal for the Y direction         |
| fBodyGyro-std()-Z           | Standarad deviation of body gyroscope frequency domain signal for the Z direction         |
| fBodyAccMag-mean()          | Mean of body acceleration time domain signal magnitude                                    |
| fBodyAccMag-std()           | Stndard deviation of body acceleration time domain signal magnitude                       |
| fBodyBodyAccJerkMag-mean()  | Mean of body jerk acceleration frequency domain signal magnitude                          |
| fBodyBodyAccJerkMag-std()   | Stndard deviation of body jerk acceleration frequency domain signal magnitude             |
| fBodyBodyGyroMag-mean()     | Mean of body gyroscope frequency domain signal magnitude                                  |
| fBodyBodyGyroMag-std()      | Stndard deviation of body gyroscope frequency domain signal magnitude                     |
| fBodyBodyGyroJerkMag-mean() | Mean of body jerk gyroscope frequency domain signal magnitude                             |
| fBodyBodyGyroJerkMag-std()  | Stndard deviation of body jerk gyroscope frequency domain signal magnitude                |

### Activity Labels

| ID | Label              |
|----|--------------------|
| 1  | WALKING            |
| 2  | WALKING_UPSTAIRS   |
| 3  | WALKING_DOWNSTAIRS |
| 4  | SITTING            |
| 5  | STANDING           |
| 6  | LAYING             |
