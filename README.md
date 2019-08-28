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

<code>## Source: local data frame [76 x 3]
## 
##    Speaker  Gram2             data
##     (fctr) (fctr)            (chr)
## 1      s01   past  &lt;tbl_df [58,3]&gt;
## 2      s01   mono &lt;tbl_df [171,3]&gt;
## 3      s02   mono &lt;tbl_df [218,3]&gt;
## 4      s02   past  &lt;tbl_df [46,3]&gt;
## 5      s03   mono &lt;tbl_df [219,3]&gt;
## 6      s03   past  &lt;tbl_df [56,3]&gt;
## 7      s04   mono &lt;tbl_df [240,3]&gt;
## 8      s04   past  &lt;tbl_df [41,3]&gt;
## 9      s05   mono &lt;tbl_df [184,3]&gt;
## 10     s05   past  &lt;tbl_df [38,3]&gt;
## ..     ...    ...              ...
</code>




