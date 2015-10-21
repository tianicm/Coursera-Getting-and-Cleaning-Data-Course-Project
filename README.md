# Coursera-Getting-and-Cleaning-Data-Course-Project
Coursera Getting and Cleaning Data Course Project


Introduction:
This Course Project is based on Human Activity Recognition Using Smartphones Dataset. This README file explains details around what files are included and what are their features.

Objective:
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Activities to be done:
1.	Create one R script called run_analysis.R that does the following. 
2.	Merges the training and the test sets to create one data set.
3.	Extracts only the measurements on the mean and standard deviation for each measurement. 
4.	Uses descriptive activity names to name the activities in the data set
5.	Appropriately labels the data set with descriptive variable names. 
6.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

How run_analysis.R script works:
•	First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "data".
•	Make sure the folder "data" and the run_analysis.R script are both in the current working directory.
•	Second, use source ("run_analysis.R") command in RStudio. 
•	Third, you will find two output files are generated in the current working directory: 
o	mergedData.txt
o	tidyData.txt
o	Finally, use data <- read.table ("tidyData.txt) command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features. 

What you find in this repository
•	CodeBook.md: information about raw and tidy data set and elaboration made to transform them
•	README.md: this file
•	run_analysis.R: R script to transform raw data set in a tidy one

