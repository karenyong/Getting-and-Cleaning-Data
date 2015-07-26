**Introduction**

This is a codebook which describes the variables, the data, and transformations performed to clean the data. 

**Data Source**

Original data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description of the dataset http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Data Set Description**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

**Attribute Information**

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'X_train.txt': Training set.
- 'y_train.txt': Training labels.
- 'X_test.txt': Test set.
- 'y_test.txt': Test labels.

**Variables**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

**Transformations**

1. Load packages required (plyr,dplyr,tidyr) and download zipped file from source link and unzip into UCI HAR Data directory.
2. Read tables from test folder (X_test, y_test, subject_test), train folder (X_train, y_train, subject_train). Read activities and features tables.
3. Combine the feature files(X_test & X_train), the activity files (y_test & y_train) and the subject files (subject_test & subject_train).
4. Add column names to the 3 dataframes created above (after combination of files).
5. Merge all 3 dataframes into a complete dataframe.
6. Extract column indices of variables with 'mean' and 'std' in the column names,including columns #562 and 563 which are subject and activity.
7. Use complete list of column indices to extract the relevant data from the complete dataframe created in step 5.
8. For columns with abbreviated names (i.e. t, f, BodyBody, Acc, Gyro, and Mag), add full descriptions obtained from 'features_info.txt' file. Also, remove hyphens and parentheses from column names.
9. Next, group the data by subject and activity, and calculate the mean for every measurement column. 
10. Data is then written into file called 'Tidy.txt'.

**Columns in output file('Tidy.txt')**

The columns included in the output file are:
- "Subject" 
- "Activity" 
- "TimeBodyAccelerometer_mean_X" 
- "TimeBodyAccelerometer_mean_Y" 
- "TimeBodyAccelerometer_mean_Z" 
- "TimeBodyAccelerometer_std_X" 
- "TimeBodyAccelerometer_std_Y" 
- "TimeBodyAccelerometer_std_Z" 
- "TimeGravityAccelerometer_mean_X" 
- "TimeGravityAccelerometer_mean_Y" 
- "TimeGravityAccelerometer_mean_Z" 
- "TimeGravityAccelerometer_std_X" 
- "TimeGravityAccelerometer_std_Y" 
- "TimeGravityAccelerometer_std_Z" 
- "TimeBodyAccelerometerJerk_mean_X" 
- "TimeBodyAccelerometerJerk_mean_Y" 
- "TimeBodyAccelerometerJerk_mean_Z" 
- "TimeBodyAccelerometerJerk_std_X" 
- "TimeBodyAccelerometerJerk_std_Y" 
- "TimeBodyAccelerometerJerk_std_Z" 
- "TimeBodyGyroscope_mean_X" 
- "TimeBodyGyroscope_mean_Y" 
- "TimeBodyGyroscope_mean_Z" 
- "TimeBodyGyroscope_std_X" 
- "TimeBodyGyroscope_std_Y" 
- "TimeBodyGyroscope_std_Z" 
- "TimeBodyGyroscopeJerk_mean_X" 
- "TimeBodyGyroscopeJerk_mean_Y" 
- "TimeBodyGyroscopeJerk_mean_Z" 
- "TimeBodyGyroscopeJerk_std_X" 
- "TimeBodyGyroscopeJerk_std_Y" 
- "TimeBodyGyroscopeJerk_std_Z" 
- "TimeBodyAccelerometerMagnitude_mean" 
- "TimeBodyAccelerometerMagnitude_std" 
- "TimeGravityAccelerometerMagnitude_mean" 
- "TimeGravityAccelerometerMagnitude_std" 
- "TimeBodyAccelerometerJerkMagnitude_mean" 
- "TimeBodyAccelerometerJerkMagnitude_std" 
- "TimeBodyGyroscopeMagnitude_mean" 
- "TimeBodyGyroscopeMagnitude_std" 
- "TimeBodyGyroscopeJerkMagnitude_mean" 
- "TimeBodyGyroscopeJerkMagnitude_std" 
- "FrequencyBodyAccelerometer_mean_X" 
- "FrequencyBodyAccelerometer_mean_Y" 
- "FrequencyBodyAccelerometer_mean_Z" 
- "FrequencyBodyAccelerometer_std_X" 
- "FrequencyBodyAccelerometer_std_Y" 
- "FrequencyBodyAccelerometer_std_Z" 
- "FrequencyBodyAccelerometer_meanFreq_X" 
- "FrequencyBodyAccelerometer_meanFreq_Y" 
- "FrequencyBodyAccelerometer_meanFreq_Z" 
- "FrequencyBodyAccelerometerJerk_mean_X" 
- "FrequencyBodyAccelerometerJerk_mean_Y" 
- "FrequencyBodyAccelerometerJerk_mean_Z" 
- "FrequencyBodyAccelerometerJerk_std_X" 
- "FrequencyBodyAccelerometerJerk_std_Y" 
- "FrequencyBodyAccelerometerJerk_std_Z" 
- "FrequencyBodyAccelerometerJerk_meanFreq_X" 
- "FrequencyBodyAccelerometerJerk_meanFreq_Y" 
- "FrequencyBodyAccelerometerJerk_meanFreq_Z" 
- "FrequencyBodyGyroscope_mean_X" 
- "FrequencyBodyGyroscope_mean_Y" 
- "FrequencyBodyGyroscope_mean_Z" 
- "FrequencyBodyGyroscope_std_X" 
- "FrequencyBodyGyroscope_std_Y" 
- "FrequencyBodyGyroscope_std_Z" 
- "FrequencyBodyGyroscope_meanFreq_X" 
- "FrequencyBodyGyroscope_meanFreq_Y" 
- "FrequencyBodyGyroscope_meanFreq_Z" 
- "FrequencyBodyAccelerometerMagnitude_mean" 
- "FrequencyBodyAccelerometerMagnitude_std" 
- "FrequencyBodyAccelerometerMagnitude_meanFreq" 
- "FrequencyBodyAccelerometerJerkMagnitude_mean" 
- "FrequencyBodyAccelerometerJerkMagnitude_std"
- "FrequencyBodyAccelerometerJerkMagnitude_meanFreq" 
- "FrequencyBodyGyroscopeMagnitude_mean" 
- "FrequencyBodyGyroscopeMagnitude_std" 
- "FrequencyBodyGyroscopeMagnitude_meanFreq" 
- "FrequencyBodyGyroscopeJerkMagnitude_mean" 
- "FrequencyBodyGyroscopeJerkMagnitude_std" 
- "FrequencyBodyGyroscopeJerkMagnitude_meanFreq" 
- "angle(tBodyAccelerometerMean,gravity)" 
- "angle(tBodyAccelerometerJerkMean),gravityMean)" 
- "angle(tBodyGyroscopeMean,gravityMean)" 
- "angle(tBodyGyroscopeJerkMean,gravityMean)" 
- "angle(X,gravityMean)" 
- "angle(Y,gravityMean)" 
- "angle(Z,gravityMean)" 
- "ActivityLabel"