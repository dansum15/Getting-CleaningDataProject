
##Clear work space
rm(list=ls())

##Download data
if (!file.exists("getdata_dataset.zip")){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, "getdata_dataset.zip")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip("getdata_dataset.zip") 
}

##Import Datasets
features     = read.table('UCI HAR Dataset/features.txt',header=FALSE)
activityType = read.table('UCI HAR Dataset/activity_labels.txt',header=FALSE) 
subjectTrain = read.table('UCI HAR Dataset/train/subject_train.txt',header=FALSE) 
xTrain       = read.table('UCI HAR Dataset/train/x_train.txt',header=FALSE)
yTrain       = read.table('UCI HAR Dataset/train/y_train.txt',header=FALSE)
subjectTest  = read.table('UCI HAR Dataset/test/subject_test.txt',header=FALSE) 
xTest        = read.table('UCI HAR Dataset/test/x_test.txt',header=FALSE)
yTest        = read.table('UCI HAR Dataset/test/y_test.txt',header=FALSE)

#Name Columns
colnames(activityType) = c("ActivityNumber", "Activity")
colnames(subjectTrain) = "SubjectNumber"
colnames(xTrain) = features[,2]
colnames(yTrain) = "ActivityNumber"
colnames(subjectTest) = "SubjectNumber"
colnames(xTest) = features[,2]
colnames(yTest) = "ActivityNumber"

#Combine Training and Test Rows
TrainingData<-cbind(subjectTrain,yTrain,xTrain)
TestData<-cbind(subjectTest,yTest,xTest)
CompleteData<-rbind(TrainingData,TestData)

#Extract only mean and standard deviation
colNames<-colnames(CompleteData)
logicalVector <- (grepl("Activity..",colNames) | grepl("Subject..",colNames) | grepl("...mean...",colNames)  | grepl("...std...",colNames))
CompleteData_MeanStd <- CompleteData[logicalVector==TRUE]

#Merge ActivityType lookup with Complete Dataset
CompleteData_Merge<-merge(CompleteData_MeanStd,activityType,by='ActivityNumber',all.x=TRUE)

#Rename Columns with more logical names
colNames_Edit<-c("ActivityNumber","SubjectNumber","BodyAccelerationMagnitude_X_Mean_Time","BodyAccelerationMagnitude_Y_Mean_Time","BodyAccelerationMagnitude_Z_Mean_Time","BodyAccelerationMagnitude_X_Std_Time","BodyAccelerationMagnitude_Y_Std_Time","BodyAccelerationMagnitude_Z_Std_Time","GravityAcceleration_X_Mean_Time","GravityAcceleration_Y_Mean_Time","GravityAcceleration_Z_Mean_Time","GravityAcceleration_X_Std_Time","GravityAcceleration_Y_Std_Time","GravityAcceleration_Z_Std_Time","BodyAccelerationJerk_X_Mean_Time","BodyAccelerationJerk_Y_Mean_Time","BodyAccelerationJerk_Z_Mean_Time","BodyAccelerationJerk_X_Std_Time","BodyAccelerationJerk_Y_Std_Time","BodyAccelerationJerk_Z_Std_Time","BodyGyro_X_Mean_Time","BodyGyro_Y_Mean_Time","BodyGyro_Z_Mean_Time","BodyGyro_X_Std_Time","BodyGyro_Y_Std_Time","BodyGyro_Z_Std_Time","BodyGyroJerk_X_Mean_Time","BodyGyroJerk_Y_Mean_Time","BodyGyroJerk_Z_Mean_Time","BodyGyroJerk_X_Std_Time","BodyGyroJerk_Y_Std_Time","BodyGyroJerk_Z_Std_Time","BodyAcceleration_X_Mean_Freq","BodyAcceleration_Y_Mean_Freq","BodyAcceleration_Z_Mean_Freq","BodyAcceleration_X_Std_Freq","BodyAcceleration_Y_Std_Freq","BodyAcceleration_Z_Std_Freq","BodyAcceleration_X_MeanFreq_Freq","BodyAcceleration_Y_MeanFreq_Freq","BodyAcceleration_Z_MeanFreq_Freq","BodyAccelerationJerk_X_Mean_Freq","BodyAccelerationJerk_Y_Mean_Freq","BodyAccelerationJerk_Z_Mean_Freq","BodyAccelerationJerk_X_Std_Freq","BodyAccelerationJerk_Y_Std_Freq","BodyAccelerationJerk_Z_Std_Freq","BodyAccelerationJerk_X_MeanFreq_Freq","BodyAccelerationJerk_Y_MeanFreq_Freq","BodyAccelerationJerk_Z_MeanFreq_Freq","BodyGyro_X_Mean_Freq","BodyGyro_Y_Mean_Freq","BodyGyro_Z_Mean_Freq","BodyGyro_X_Std_Freq","BodyGyro_Y_Std_Freq","BodyGyro_Z_Std_Freq","BodyGyro_X_MeanFreq_Freq","BodyGyro_Y_MeanFreq_Freq","BodyGyro_Z_MeanFreq_Freq","BodyAccelerationMagnitude_MeanFreq_Freq","BodyAccelerationJerkMagnitude_MeanFreq_Freq","BodyGyroMagnitude_MeanFreq_Freq","BodyGyroJerkMagnitude_MeanFreq_Freq","Activity")
colnames(CompleteData_Merge) = colNames_Edit

#Create tidy dataset of means across the various subjects and activities
library(plyr)
library(dplyr)
CompleteData_Merge2<-aggregate(. ~SubjectNumber + ActivityNumber, CompleteData_Merge, mean)
CompleteData_Merge3<-select(CompleteData_Merge2,-Activity)
write.table(CompleteData_Merge3, file = "TidyData.txt",row.name=FALSE)
