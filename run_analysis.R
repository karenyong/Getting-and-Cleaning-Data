#load required packages
library(plyr)
library(dplyr)
library(tidyr)

#Download file from source and unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "mydata.zip", method = "curl")
unzip("mydata.zip")

#1. Merge training and test sets to create one data set
#read test files
testx <- read.table("./UCI HAR Dataset/test/X_test.txt")
testy <- read.table("./UCI HAR Dataset/test/y_test.txt")
#read train files
trainx <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("./UCI HAR Dataset/train/y_train.txt")
#read subject files
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#read activity labels file
act <- read.table("./UCI HAR Dataset/activity_labels.txt")
#read features file
feat <- read.table("./UCI HAR Dataset/features.txt")

#combine trainx and testx files (feature files)
dat <- rbind(testx, trainx)
#combine trainy and testy files (activity files)
lab <- rbind(testy, trainy)
#combine subject files (subject files)
sub <- rbind(subtest, subtrain)

#add column names to dataframes
colnames(dat) <- feat$V2
colnames(lab) <- "Activity"
colnames(sub) <- "Subject"

#merge data to obtain complete dataframe
comdat <- cbind(dat,sub,lab)
comdat

#2. Extract only measurements on the mean and standard deviation for each measurement
#get column indices with mean or std in them
meanstd <- grep(".*Mean.*|.*Std.*",names(comdat),ignore.case=TRUE)
#add activity and subject to the list (columns 562 & 563)
meanstd <- c(meanstd, 562, 563)
#use complete list of column indices of mean & std to extract data from comdat
meanstd <- comdat[ ,meanstd]
meanstd

#3. Use descriptive activity names to name the activities in the data set
#add column 'ActivityLabel' with names of activities as factors from 'act' dataframe
meanstd$ActivityLabel <- factor(meanstd$Activity,levels=c(1,2,3,4,5,6),labels=act$V2)
meanstd

#4. Label data set with descriptive variable names
#from features_info.txt, t=time, Acc=Accelerometer, Gyro=Gyroscope, BodyBody=Body
#Mag=Magnitude,f=Frequency - replace abbrev. in meanstd column names with full descriptions
#remove parentheses and hyphens 
names(meanstd) <- gsub("^t","Time",names(meanstd))
names(meanstd) <- gsub("^f","Frequency",names(meanstd))
names(meanstd) <- gsub("Acc","Accelerometer",names(meanstd))
names(meanstd) <- gsub("Gyro","Gyroscope",names(meanstd))
names(meanstd) <- gsub("BodyBody","Body",names(meanstd))
names(meanstd) <- gsub("Mag","Magnitude",names(meanstd))
names(meanstd) <- gsub("-","_",names(meanstd))
names(meanstd) <- gsub("\\(\\)","",names(meanstd))
names(meanstd)

#5. From data set in step 4, create a second, independent tidy data set 
#    with the average of each variable for each activity and each subject
#create tidydata dataframe with avg for each subject & activity
#re-label column 'ActivityLabel' with names of activities
tidydata <- aggregate(. ~Subject+Activity,meanstd,mean)
tidydata$ActivityLabel <- factor(tidydata$Activity,levels=c(1,2,3,4,5,6),labels=act$V2)
#order entries in tidydata by subject and then activity
tidydata <- tidydata[order(tidydata$Subject,tidydata$Activity),]
tidydata
#write into data file tidy.txt
write.table(tidydata,file="Tidy.txt",row.names=FALSE)
