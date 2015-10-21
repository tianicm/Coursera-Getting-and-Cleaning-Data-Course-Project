#Getting and Cleaning Course Data Project

Dataset Background:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain

Data Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data for the Project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Saved in the Working Directory as folder named: UCI-HAR-Dataset

Working Directory: "C:/Users/tiani_000/Desktop/courserarpogramming/Coursera-Getting-and-Cleaning-Data-Course-Project/Dataset/UCI HAR Dataset"

run_analysis.R
The run_analysis.R script performs the following steps to clean the data and writes in our desire files:
1.	Merges the training and test sets to create one data set, namely train/X_train.txt with test/X_test.txt, the result of which is a 10299x561 data frame, as in the original description ("Number of Instances: 10299" and "Number of Attributes: 561"), train/subject_train.txt with test/subject_test.txt, the result of which is a 10299x1 data frame with subject IDs, and train/y_train.txt with test/y_test.txt, the result of which is also a 10299x1 data frame with activity IDs.

2.	Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder and store them in trainDt, testDt variables respectively.

3.	Bind testDt to trainDt to generate data frames dtX, dtY and joinDt.

4.	Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement. The result is a 10299x66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation. All measurements appear to be floating point numbers in the range (-1, 1).

5.	Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called activity which applies descriptive activity names to name the activities in the data set.

6.	Clean the activity names in the second column of activity. We first make all names to lower cases. 

7.	Transform the values of dtY according to the activity data frame.

8.	Combine the joinDt, dtY and dtX by column to get a new cleaned 10299x68 data frame, cleaned Data. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.

9.	The file mergedData.txt is created.

10.	The final part generates a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the result data frame and performing the two for-loops, we get a 180x68 data frame and the file tidyData.txt is created.

Desired Outputted files:
    mergedData.txt

    tidyData.txt

