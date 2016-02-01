#Code Book

##Study Design
The data was collected using 30 volunteers wearing a Samsung Galaxy S II on their waist. Using the embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured. Experiments were video recorded to label the data manually. 70% of volunteers were identified as training data and 30% were test data. Once the data has been collected, we load it into R and conduct several transformations to turn it into a tidier dataset. This is done by renaming several of the column values and then combining the Training and Test data into a complete dataset. Then subsetting the dataset for any column that contains mean and standard deviation. Finally we make this table unique on Subject Number and Activity Number by taking the average of each field. Then we write this to a tidy data text file.

##Code Book
###Identifiers
*Subject Number: Identifies which subject the readings are for
*Activity Number: Identifies which activity the readings are for (1-Walking, 2-Walking Upstairs, 3-Walking Downstairs, 4-Sitting, 5-Standing, 6-Laying)

###Metrics
BodyAccelerationMagnitude_X_Mean_Time
BodyAccelerationMagnitude_Y_Mean_Time
BodyAccelerationMagnitude_Z_Mean_Time
BodyAccelerationMagnitude_X_Std_Time
BodyAccelerationMagnitude_Y_Std_Time
BodyAccelerationMagnitude_Z_Std_Time
GravityAcceleration_X_Mean_Time
GravityAcceleration_Y_Mean_Time
GravityAcceleration_Z_Mean_Time
GravityAcceleration_X_Std_Time
GravityAcceleration_Y_Std_Time
GravityAcceleration_Z_Std_Time
*BodyAccelerationJerk_X_Mean_Time
*BodyAccelerationJerk_Y_Mean_Time
*BodyAccelerationJerk_Z_Mean_Time
*BodyAccelerationJerk_X_Std_Time
*BodyAccelerationJerk_Y_Std_Time
*BodyAccelerationJerk_Z_Std_Time
*BodyGyro_X_Mean_Time
*BodyGyro_Y_Mean_Time
*BodyGyro_Z_Mean_Time
*BodyGyro_X_Std_Time
*BodyGyro_Y_Std_Time
*BodyGyro_Z_Std_Time
*BodyGyroJerk_X_Mean_Time
*BodyGyroJerk_Y_Mean_Time
*BodyGyroJerk_Z_Mean_Time
*BodyGyroJerk_X_Std_Time
*BodyGyroJerk_Y_Std_Time
*BodyGyroJerk_Z_Std_Time
*BodyAcceleration_X_Mean_Freq
*BodyAcceleration_Y_Mean_Freq
*BodyAcceleration_Z_Mean_Freq
*BodyAcceleration_X_Std_Freq
*BodyAcceleration_Y_Std_Freq
*BodyAcceleration_Z_Std_Freq
*BodyAcceleration_X_MeanFreq_Freq
*BodyAcceleration_Y_MeanFreq_Freq
*BodyAcceleration_Z_MeanFreq_Freq
*BodyAccelerationJerk_X_Mean_Freq
*BodyAccelerationJerk_Y_Mean_Freq
*BodyAccelerationJerk_Z_Mean_Freq
*BodyAccelerationJerk_X_Std_Freq
*BodyAccelerationJerk_Y_Std_Freq
*BodyAccelerationJerk_Z_Std_Freq
*BodyAccelerationJerk_X_MeanFreq_Freq
*BodyAccelerationJerk_Y_MeanFreq_Freq
*BodyAccelerationJerk_Z_MeanFreq_Freq
*BodyGyro_X_Mean_Freq
*BodyGyro_Y_Mean_Freq
*BodyGyro_Z_Mean_Freq
*BodyGyro_X_Std_Freq
*BodyGyro_Y_Std_Freq
*BodyGyro_Z_Std_Freq
*BodyGyro_X_MeanFreq_Freq
*BodyGyro_Y_MeanFreq_Freq
*BodyGyro_Z_MeanFreq_Freq
*BodyAccelerationMagnitude_MeanFreq_Freq
*BodyAccelerationJerkMagnitude_MeanFreq_Freq
*BodyGyroMagnitude_MeanFreq_Freq
*BodyGyroJerkMagnitude_MeanFreq_Freq

