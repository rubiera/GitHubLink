Tidy-Data Final Project

Cleaning up data into a tidy dataset. This repository contains scripts and data for the (end-of) course project of the Coursera Getting and Cleaning Data (in R) course by Johns Hopkins University.

In this project we deliver the tidy data contained in the file selected_data_grouped.txt. The data_analysis.R script runs of the original test and train data through tidying steps, until the final file is complete.

The original dataset this data is derived is from the dataset made public by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra2 and Jorge L. Reyes-Ortiz as documented in their research paper “A Public Domain Dataset for Human Activity Recognition Using Smartphones.”  The original data comes in two parts: a training dataset, labeled ‘train’ in the original dataset, containing 7,352 observations, and a test dataset, labeled ‘test’ in the original dataset, containing 2,947 observations. 

There are two categories of data in the original dataset. The first category is composed of a sample of the raw inertial signal data for three variables. The second category is composed of a processed sample of 561 variables. In this codebook we describe a selection from the second category for 79 fields measuring mean values and standard deviations. The procedure we follow is as required for this assignment:
 
1.	We merge the training and the test data sets to create one data set.
2.	We extract 79 measurements on the mean and standard deviation for each measurement from the 561 measurements in the original dataset.
3.	We use descriptive activity names to name the activities in the data.
4.	We label the data set columns appropriately with descriptive variable names.
5.	From the data set in step 4, we extract a second, independent tidy data set with the average (men) of each variable (the 79 columns) grouped by activity and subject. It is this extracted, tidy data set that is contained in the file selected_data_grouped.txt.

Data Description (Metadata)
The dataset contained in the file selected_data_grouped.txt has four columns for subjects and activities as group by variables for the mean and standard deviation of the acceleration (m/s^2) and gyroscope measurement (m) extracted from the original dataset 

Subjects and Activities
Subject Number is in the range 1 to 30 and found in the data as the column SubjectNumber. Activity descriptions are in the column ActivityName and activity numbers are in the column ActivityNumber.

Activity  descriptions and their respective numbers are:
1.	Activity Labels and Activity Numbers
2.	WALKING  
3.	WALKING_UPSTAIRS
4.	WALKING_DOWNSTAIRS
5.	SITTING
6.	STANDING
7.	LAYING

The data has a count for the number of observations N (in the range 36 to 95 Observations) for a given subject and a matching activity (subject 1 to 30 X activity 1 to 6, for a total of 180 possible groups). 

In addition to tidying the processed data in the original data set, we also analyzed some of the raw inertial data. This analysis is included in run_analysis.R, and is summarized below:

At first, it is puzzling that the raw inertial data does not have columns labeled and there is no wayto match those columns with other columns in the data. It's a snippet at 50Hz of three measures, and that means each column is a specific relative time (1/50) second later than the column to the left of it.

I added the subject and activity labels to the raw data:
bodyaccX_table_named <- cbind(subject_activity_cbind_named, bodyaccX_table)
Then made sure the result was still a data table.
subject_activity_cbind_named <- setDT(subject_activity_cbind_named) 
I filter each of the inertial files by activity. This data table keeps the acitivty information even though only the subject number is relevant since each data table is specific to one activity. I select out each activity since the time sample should be grouped by activity.
##1 WALKING  
bodyaccX_table_named_1 <- filter(bodyaccX_table_named, ActivityNumber == 1 )
##2 WALKING_UPSTAIRS
bodyaccX_table_named_2 <- filter(bodyaccX_table_named, ActivityNumber == 2 )
##3 WALKING_DOWNSTAIRS
bodyaccX_table_named_3 <- filter(bodyaccX_table_named, ActivityNumber == 3 )
##4 SITTING
bodyaccX_table_named_4 <- filter(bodyaccX_table_named, ActivityNumber == 4 )
##5 STANDING
bodyaccX_table_named_5 <- filter(bodyaccX_table_named, ActivityNumber == 5 )
##6 LAYING
bodyaccX_table_named_6 <- filter(bodyaccX_table_named, ActivityNumber == 6 )

We now have a time series for each activity with 128 time captures at the 50 Hz sampling rate. 
For example:
bodyaccX_table_1_t <- data.table(t(bodyaccX_table_named_1))
This is a transposed data table that can now be plotted as a time series. The tie series is for a subject recorded performing one of the six activities.

This is the raw data, and that means that there are 3 dimensions by 3 variables (body acceleration, gyro relative position, and total acceleration) x 10,299 indiividual time series. That's a lot of possible plots. Here is a tiny sample (from run_analysis.R):

##1 WALKING  
bodyaccX_table_1_t[4:131, plot(4:131, V1)]  
##2 WALKING_UPSTAIRS
bodyaccX_table_2_t[4:131, plot(4:131, V1)]  
##3 WALKING_DOWNSTAIRS
bodyaccX_table_3_t[4:131, plot(4:131, V1)]  
##4 SITTING
bodyaccX_table_4_t[4:131, plot(4:131, V1)]  
##5 STANDING
bodyaccX_table_5_t[4:131, plot(4:131, V1)]  
##6 LAYING
bodyaccX_table_6_t[4:131, plot(4:131, V1)]  






