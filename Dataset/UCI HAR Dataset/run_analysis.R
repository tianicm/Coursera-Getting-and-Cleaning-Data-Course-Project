## JM Stewart
## Coursera Getting and Cleaning Data
## run_analysis.R

## Running the Script:
## setwd("C:/Users/tiani_000/Desktop/courserarpogramming/Coursera-Getting-and-Cleaning-Data-Course-Project")
## dataset_url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## download.file(dataset_url, "Dataset.zip")
## unzip("Dataset.zip", exdir = "Dataset")
## setwd("C:/Users/tiani_000/Desktop/courserarpogramming/Coursera-Getting-and-Cleaning-Data-Course-Project/Dataset/UCI HAR Dataset")
## source("run_analysis.R")
## data <- read.table("tidyData.txt")


## Assignment: Create one R script called run_analysis.R that does the following:

## Part1. Merges the training and the test sets to create one data set.
## Load, process and bind data

trainDt <- read.table("train/X_train.txt")
testDt <- read.table("test/X_test.txt")
dtX <- rbind(trainDt, testDt)
trainDt <- read.table("train/subject_train.txt")
testDt <- read.table("test/subject_test.txt")
joinDt <- rbind(trainDt, testDt)
trainDt <- read.table("train/y_train.txt")
testDt <- read.table("test/y_test.txt")
dtY <- rbind(trainDt, testDt)

## Part2. Extracts only the measurements on the mean and standard deviation for each measurement.
## Extract the column indices that have either mean or std in them.

features <- read.table("features.txt")
meanIndices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
dtX <- dtX[, meanIndices]
names(dtX) <- features[meanIndices, 2]
names(dtX) <- gsub("\\(|\\)", "", names(dtX))
names(dtX) <- tolower(names(dtX))

## Part3. Uses descriptive activity names to name the activities in the data set.
## Load activity labels

Activity <- read.table("activity_labels.txt")
Activity[, 2] = gsub("_", "", tolower(as.character(Activity[, 2])))
dtY[,1] = Activity[dtY[,1], 2]
names(dtY) <- "activity"

## Part4. Appropriately labels the data set with descriptive activity names.

names(joinDt) <- "subject"
cleaned <- cbind(joinDt, dtY, dtX)
write.table(cleaned, "mergedData.txt")

## Part5. From the data set in step 4, creates a second, independent tidy data set with 
## the average of each variable for each activity and each subject

uniqueSubjects = unique(joinDt)[,1]
subjectLen = length(unique(joinDt)[,1])
activityLen = length(Activity[,1])
colsLen= dim(cleaned)[2]
result = cleaned[1:(subjectLen*activityLen), ]
row = 1
for (s in 1:subjectLen) {
for (a in 1:activityLen) {
result[row, 1] = uniqueSubjects[s]
result[row, 2] = Activity[a, 2]
tidyDt <- cleaned[cleaned$subject==s & cleaned$activity==Activity[a, 2], ]
result[row, 3:colsLen] <- colMeans(tidyDt[, 3:colsLen])
row = row+1
}
}
write.table(result, "tidyData.txt")