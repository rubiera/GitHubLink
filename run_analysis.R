#####begin of environment setup######################################
##general use
setwd("~/Tony Work/EID Data Science/work/fitnessdata")
getwd()

library(data.table)
library(dplyr)
#####end of environment setup######################################


#####begin of read for function list commong to test and train#####

features <- fread("features.txt")
head(features)
nrow(features)

functionlist <- features[,2]
head(functionlist)
nrow(functionlist)

names(functionlist)[1] <- "Variable"
head(functionlist)
#end of read for function list commong to test and train#


###############begin of step 1###########################

#1.	Merges the training and the test sets to create one data set.

#y_test.txt contains test labels

y_test_table <- fread("./test/y_test.txt")
head(y_test_table)
nrow(y_test_table)

names(y_test_table)[1] <- "ActivityNumber"

head(y_test_table)
table(y_test_table)

#subject_test.txt: Each row identifies the subject who performed 
#the activity for each window sample. Its range is from 1 to 30

subject_test_table <- fread("./test/subject_test.txt")
head(subject_test_table)
str(subject_test_table)
nrow(subject_test_table)
table(subject_test_table)

names(subject_test_table)[1] <- "SubjectNumber"
head(subject_test_table)

subject_activity_cbind_test <- cbind(subject_test_table,y_test_table)
head(subject_activity_cbind_test)
table(subject_activity_cbind_test)
nrow(subject_activity_cbind_test)

#X_test.txt is Test set.

#https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html
#http://brooksandrew.github.io/simpleblog/articles/advanced-data-table/

#complete file at home

x_test_table <- fread("./test/X_test.txt", fill=TRUE)
nrow(x_test_table)
ncol(x_test_table)

#############train data 

##start from scratch to get wide data set for train as well
#y_test.txt contains test labels

y_train_table <- fread("./train/y_train.txt")
head(y_train_table)
nrow(y_train_table)

names(y_train_table)[1] <- "ActivityNumber"

head(y_train_table)
table(y_train_table)

#subject_test.txt: Each row identifies the subject who performed 
#the activity for each window sample. Its range is from 1 to 30

subject_train_table <- fread("./train/subject_train.txt")
head(subject_train_table)
str(subject_train_table)
nrow(subject_train_table)
table(subject_train_table)

names(subject_train_table)[1] <- "SubjectNumber"
head(subject_train_table)

subject_activity_cbind_train <- cbind(subject_train_table,y_train_table)
head(subject_activity_cbind_train)
table(subject_activity_cbind_train)
nrow(subject_activity_cbind_train)

#X_test.txt is Test set.
#X_train.txt is Train set.

#https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html
#http://brooksandrew.github.io/simpleblog/articles/advanced-data-table/

#complete file at home

x_test_table <- fread("./test/X_test.txt", fill=TRUE)
nrow(x_test_table)
ncol(x_test_table)

x_train_table <- fread("./train/X_train.txt", fill=TRUE)
nrow(x_train_table)
ncol(x_train_table)

########################body acc
#read inertial signals for test
bodyaccX_test_table <- fread("./test/Inertial Signals/body_acc_x_test.txt")
ncol(bodyaccX_test_table)
nrow(bodyaccX_test_table)

bodyaccY_test_table <- fread("./test/Inertial Signals/body_acc_y_test.txt")
ncol(bodyaccY_test_table)
nrow(bodyaccY_test_table)

bodyaccZ_test_table <- fread("./test/Inertial Signals/body_acc_z_test.txt")
ncol(bodyaccZ_test_table)
nrow(bodyaccZ_test_table)

#read inertial signals for train
bodyaccX_train_table <- fread("./train/Inertial Signals/body_acc_x_train.txt")
ncol(bodyaccX_train_table)
nrow(bodyaccX_train_table)

bodyaccY_train_table <- fread("./train/Inertial Signals/body_acc_y_train.txt")
ncol(bodyaccY_train_table)
nrow(bodyaccY_train_table)

bodyaccZ_train_table <- fread("./train/Inertial Signals/body_acc_z_train.txt")
ncol(bodyaccZ_train_table)
nrow(bodyaccZ_train_table)

########################body gyro
#read inertial signals for test
bodygyroX_test_table <- fread("./test/Inertial Signals/body_gyro_x_test.txt")
ncol(bodygyroX_test_table)
nrow(bodygyroX_test_table)

bodygyroY_test_table <- fread("./test/Inertial Signals/body_gyro_y_test.txt")
ncol(bodygyroY_test_table)
nrow(bodygyroY_test_table)

bodygyroZ_test_table <- fread("./test/Inertial Signals/body_gyro_z_test.txt")
ncol(bodygyroZ_test_table)
nrow(bodygyroZ_test_table)

#read inertial signals for train
bodygyroX_train_table <- fread("./train/Inertial Signals/body_gyro_x_train.txt")
ncol(bodygyroX_train_table)
nrow(bodygyroX_train_table)

bodygyroY_train_table <- fread("./train/Inertial Signals/body_gyro_y_train.txt")
ncol(bodygyroY_train_table)
nrow(bodygyroY_train_table)

bodygyroZ_train_table <- fread("./train/Inertial Signals/body_gyro_z_train.txt")
ncol(bodygyroZ_train_table)
nrow(bodygyroZ_train_table)

########################total acc
#read inertial signals for test
totalaccX_test_table <- fread("./test/Inertial Signals/total_acc_x_test.txt")
ncol(totalaccX_test_table)
nrow(totalaccX_test_table)

totalaccY_test_table <- fread("./test/Inertial Signals/total_acc_y_test.txt")
ncol(totalaccY_test_table)
nrow(totalaccY_test_table)

totalaccZ_test_table <- fread("./test/Inertial Signals/total_acc_z_test.txt")
ncol(totalaccZ_test_table)
nrow(totalaccZ_test_table)

#read inertial signals for train
totalaccX_train_table <- fread("./train/Inertial Signals/total_acc_x_train.txt")
ncol(totalaccX_train_table)
nrow(totalaccX_train_table)

totalaccY_train_table <- fread("./train/Inertial Signals/total_acc_y_train.txt")
ncol(totalaccY_train_table)
nrow(totalaccY_train_table)

totalaccZ_train_table <- fread("./train/Inertial Signals/total_acc_z_train.txt")
ncol(totalaccZ_train_table)
nrow(totalaccZ_train_table)
#####end of preparation of data for combining test and train###

###################begin of combining test and train data#############################
####row bind 

subject_activity_cbind <- rbind(subject_activity_cbind_test,subject_activity_cbind_train)
ncol(subject_activity_cbind)
nrow(subject_activity_cbind)
head(subject_activity_cbind)

x_table_raw <- rbind(x_test_table,x_train_table)
ncol(x_table_raw)
nrow(x_table_raw)

########################body acc row bind

bodyaccX_table <- rbind(bodyaccX_test_table,bodyaccX_train_table)
ncol(bodyaccX_table)
nrow(bodyaccX_table)

bodyaccY_table <- rbind(bodyaccY_test_table,bodyaccY_train_table)
ncol(bodyaccY_table)
nrow(bodyaccY_table)

bodyaccZ_table <- rbind(bodyaccZ_test_table,bodyaccZ_train_table)
ncol(bodyaccZ_table)
nrow(bodyaccZ_table)

########################body gyro row bind

bodygyroX_table <- rbind(bodygyroX_test_table,bodygyroX_train_table)
ncol(bodygyroX_table)
nrow(bodygyroX_table)

bodygyroY_table <- rbind(bodygyroY_test_table,bodygyroY_train_table)
ncol(bodygyroY_table)
nrow(bodygyroY_table)

bodygyroZ_table <- rbind(bodygyroZ_test_table,bodygyroZ_train_table)
ncol(bodygyroZ_table)
nrow(bodygyroZ_table)


########################total acc row bind

totalaccX_table <- rbind(totalaccX_test_table,totalaccX_train_table)
ncol(totalaccX_table)
nrow(totalaccX_table)

totalaccY_table <- rbind(totalaccY_test_table,totalaccY_train_table)
ncol(totalaccY_table)
nrow(totalaccY_table)

totalaccZ_table <- rbind(totalaccZ_test_table,totalaccZ_train_table)
ncol(totalaccZ_table)
nrow(totalaccZ_table)

class(totalaccZ_table)



###################end of STEP 1#############################
#test and train data sets have been combined
###################begin of STEP 2###########################
#2.	Extracts only the measurements on the mean and standard deviation for each measurement

#renameheader function names each column of x_table_raw
#with the corresponding function name from functionlistsimple
renameheader <- function() {
  for (i in 1:ncol(x_table_raw))  {   
    names(x_table_raw)[i] <<- as.character(functionlist[i])
    #print(i)
    #print(names(x_table_raw)[i])
    #print(functionlist[i])
  }
}

#call function to rename columns in raw combined data file
renameheader()
#test results
names(x_table_raw)[1:6]
names(x_table_raw)

#was unable to figure out what SQL NOT LIKE 'Freq' is in R data.table, kept these columns
#even though I did not intend to.
filteredfunctionlist <- functionlist[Variable %like% 'mean' | Variable %like% 'std']
filteredfunctionlist

#raw data file with mean and std columns only
x_table_mean_std <- x_table_raw[,.SD, .SDcols=filteredfunctionlist$Variable] 

#rename columns to make them more readable
colnames(x_table_mean_std)

namestoparse <- colnames(x_table_mean_std)
namestoparse

namestoparse01 <- gsub('^f', 'freq', namestoparse)
namestoparse01
namestoparse02 <- gsub('^t', 'time', namestoparse01)
namestoparse02
namestoparse03 <- gsub('Acc', 'Accerelometer', namestoparse02)
namestoparse03
namestoparse04 <- gsub('Gyro', 'Gyroscope', namestoparse03)
namestoparse04
namestoparse05 <- gsub('Freq', 'Frequency', namestoparse04)
namestoparse05
namestoparse06 <- gsub('Mag', 'Magnitude', namestoparse05)
namestoparse06
class(namestoparse06)

colnames(x_table_mean_std) <- namestoparse06
colnames(x_table_mean_std)

###################end of STEP 2#############################


###################begin of STEP 3###########################
##Add column that puts in Activity description


##activity_labels
##1 WALKING  
##2 WALKING_UPSTAIRS
##3 WALKING_DOWNSTAIRS
##4 SITTING
##5 STANDING
##6 LAYING

# drop later, now for testin to rename correctly
subject_activity_cbind <- rbind(subject_activity_cbind_test,subject_activity_cbind_train)
ncol(subject_activity_cbind)
nrow(subject_activity_cbind)
head(subject_activity_cbind)
tail(subject_activity_cbind)
table(subject_activity_cbind)


subject_activity_cbind_1 <- filter(subject_activity_cbind, ActivityNumber == 1 )
subject_activity_cbind_1$ActivityName = "WALKING"
subject_activity_cbind_2 <- filter(subject_activity_cbind, ActivityNumber == 2 )
subject_activity_cbind_2$ActivityName = "WALKING_UPSTAIRS"
subject_activity_cbind_3 <- filter(subject_activity_cbind, ActivityNumber == 3 )
subject_activity_cbind_3$ActivityName = "WALKING_DOWNSTAIRS"
subject_activity_cbind_4 <- filter(subject_activity_cbind, ActivityNumber == 4 )
subject_activity_cbind_4$ActivityName = "SITTING"
subject_activity_cbind_5 <- filter(subject_activity_cbind, ActivityNumber == 5 )
subject_activity_cbind_5$ActivityName = "STANDING"
subject_activity_cbind_6 <- filter(subject_activity_cbind, ActivityNumber == 6 )
subject_activity_cbind_6$ActivityName = "LAYING"

###tests for correct results using redundant methods
nrow(subject_activity_cbind_1)
nrow(subject_activity_cbind_2)
nrow(subject_activity_cbind_3)
nrow(subject_activity_cbind_4)
nrow(subject_activity_cbind_5)
nrow(subject_activity_cbind_6)

sum(subject_activity_cbind[,ActivityNumber == 1])
sum(subject_activity_cbind[,ActivityNumber == 2])
sum(subject_activity_cbind[,ActivityNumber == 3])
sum(subject_activity_cbind[,ActivityNumber == 4])
sum(subject_activity_cbind[,ActivityNumber == 5])
sum(subject_activity_cbind[,ActivityNumber == 6])

table(subject_activity_cbind_1)
table(subject_activity_cbind_2)
table(subject_activity_cbind_3)
table(subject_activity_cbind_4)
table(subject_activity_cbind_5)
table(subject_activity_cbind_6)

#this is a three column table with each activity number described 
subject_activity_cbind_named <- rbind(subject_activity_cbind_1, subject_activity_cbind_2,
                                      subject_activity_cbind_3, subject_activity_cbind_4,
                                      subject_activity_cbind_5, subject_activity_cbind_6)

###tests for correct results using redundant methods
ncol(subject_activity_cbind_named)
nrow(subject_activity_cbind_named)
head(subject_activity_cbind_named)
tail(subject_activity_cbind_named)
table(subject_activity_cbind_named)


###################end of STEP 3###########################

###################begin of STEP 4#########################
#4.	Appropriately labels the data set with descriptive variable names
#column bind the subjects, activities and the mean and std columns 
selected_data <- cbind(subject_activity_cbind_named, x_table_mean_std)

#test results
nrow(selected_data)
class(selected_data)
#need to convert to data table
selected_data_table <- setDT(selected_data)  
class(selected_data)

#the submitted data set will be "selected_data"
#everything I do with the inertial data here is for my own knowledge
#since I can only submit one tidy data set
##Appropriate labels for the inertial data
bodyaccX_table_named <- cbind(subject_activity_cbind_named, bodyaccX_table)
bodyaccY_table_named <- cbind(subject_activity_cbind_named, bodyaccY_table)
bodyaccZ_table_named <- cbind(subject_activity_cbind_named, bodyaccZ_table)
bodygyroX_table_named <- cbind(subject_activity_cbind_named, bodygyroX_table)
bodygyroY_table_named <- cbind(subject_activity_cbind_named, bodygyroY_table)
bodygyroZ_table_named <- cbind(subject_activity_cbind_named, bodygyroZ_table)
totalaccX_table_named <- cbind(subject_activity_cbind_named, totalaccX_table)
totalaccY_table_named <- cbind(subject_activity_cbind_named, totalaccY_table)
totalaccZ_table_named <- cbind(subject_activity_cbind_named, totalaccZ_table)

subject_activity_cbind_named <- setDT(subject_activity_cbind_named) 
class(subject_activity_cbind_named)
class(bodyaccX_table)

#filter each of the inertial files by activity
#this data table keeps the acitivty information even though
#only the subject number is relevant since each
#data table is specific to one activity
##activity_labels
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

nrow(bodyaccX_table)
nrow(subject_activity_cbind_named)

#we know have, for each activity, a time series, with 128 time captures
#at the 50 Hz sampling rate. This means each row(now a time) is 
#(1/50) seconds ahead of the previous row
#no need to rename columns from V# since they are just time slices
bodyaccX_table_1_t <- data.table(t(bodyaccX_table_named_1))
bodyaccX_table_2_t <- data.table(t(bodyaccX_table_named_2))
bodyaccX_table_3_t <- data.table(t(bodyaccX_table_named_3))
bodyaccX_table_4_t <- data.table(t(bodyaccX_table_named_4))
bodyaccX_table_5_t <- data.table(t(bodyaccX_table_named_5))
bodyaccX_table_6_t <- data.table(t(bodyaccX_table_named_6))

nrow(bodyaccX_table_named_1)
nrow(bodyaccX_table_1_t)
# a data.table
class(bodyaccX_table_1_t)

###################end of STEP 4###########################

###################begin of STEP 5#########################
#tidy data set with the average of 
#each variable for each activity and each subject.

#DT[, c(.N, lapply(.SD, sum)), by=x]
setkey(selected_data_grouped,SubjectNumber)
haskey(selected_data_grouped)
selected_data_grouped <- selected_data[,c(.N, lapply(.SD, mean)),
                             by=c("SubjectNumber","ActivityName") ]

write.table(selected_data_grouped, 
            file = "~/Tony Work/EID Data Science/work/selected_data_grouped.txt", 
            row.name=FALSE)

####
#### Submitted dataset: selected_data_grouped,csv
####

#### From here down is not in the data submission 
#### time slide analysis of the inertial raw data
#### there is a lot more that can be done with the raw data

########################not in submission for grading#######
#Get the mean for each of the inertial files for each time slice
#we can plot any of timeslice and it shows the acceleration with respect
#to x for the subject in that column while performing 
#one of the six activities

##1 WALKING  
bodyaccX_table_1_t[4:131, plot(4:131, V1)]  
bodyaccX_table_1_t[4:131, plot(4:131, V2)]
bodyaccX_table_1_t[4:131, plot(4:131, V3)]
##2 WALKING_UPSTAIRS
bodyaccX_table_2_t[4:131, plot(4:131, V1)]  
bodyaccX_table_2_t[4:131, plot(4:131, V2)]
bodyaccX_table_2_t[4:131, plot(4:131, V3)]
##3 WALKING_DOWNSTAIRS
bodyaccX_table_3_t[4:131, plot(4:131, V1)]  
bodyaccX_table_3_t[4:131, plot(4:131, V2)]
bodyaccX_table_3_t[4:131, plot(4:131, V3)]
##4 SITTING
bodyaccX_table_4_t[4:131, plot(4:131, V1)]  
bodyaccX_table_4_t[4:131, plot(4:131, V2)]
bodyaccX_table_4_t[4:131, plot(4:131, V3)]
##5 STANDING
bodyaccX_table_5_t[4:131, plot(4:131, V1)]  
bodyaccX_table_5_t[4:131, plot(4:131, V2)]
bodyaccX_table_5_t[4:131, plot(4:131, V3)]
##6 LAYING
bodyaccX_table_6_t[4:131, plot(4:131, V1)]  
bodyaccX_table_6_t[4:131, plot(4:131, V2)]
bodyaccX_table_6_t[4:131, plot(4:131, V3)]

bodyaccX_table_1_t_mean <- bodyaccX_table_1_t[4:131,]
bodyaccX_table_2_t_mean <- bodyaccX_table_2_t[4:131,]
bodyaccX_table_3_t_mean <- bodyaccX_table_3_t[4:131,]
bodyaccX_table_4_t_mean <- bodyaccX_table_4_t[4:131,]
bodyaccX_table_5_t_mean <- bodyaccX_table_5_t[4:131,]
bodyaccX_table_6_t_mean <- bodyaccX_table_6_t[4:131,]

#change all columns from character to numeric
bodyaccX_table_1_t_mean <- sapply(bodyaccX_table_1_t_mean,as.numeric)
bodyaccX_table_2_t_mean <- sapply(bodyaccX_table_2_t_mean,as.numeric)
bodyaccX_table_3_t_mean <- sapply(bodyaccX_table_3_t_mean,as.numeric)
bodyaccX_table_4_t_mean <- sapply(bodyaccX_table_4_t_mean,as.numeric)
bodyaccX_table_5_t_mean <- sapply(bodyaccX_table_5_t_mean,as.numeric)
bodyaccX_table_6_t_mean <- sapply(bodyaccX_table_6_t_mean,as.numeric)
#from matrix to data table
bodyaccX_table_1_t_mean <- data.table(bodyaccX_table_1_t_mean)
bodyaccX_table_2_t_mean <- data.table(bodyaccX_table_2_t_mean)
bodyaccX_table_3_t_mean <- data.table(bodyaccX_table_3_t_mean)
bodyaccX_table_4_t_mean <- data.table(bodyaccX_table_4_t_mean)
bodyaccX_table_5_t_mean <- data.table(bodyaccX_table_5_t_mean)
bodyaccX_table_6_t_mean <- data.table(bodyaccX_table_6_t_mean)

#tests that the means are all there
bodyaccX_table_1_t_mean[,V1]
bodyaccX_table_2_t_mean[,V1]
bodyaccX_table_3_t_mean[,V1]
bodyaccX_table_4_t_mean[,V1]
bodyaccX_table_5_t_mean[,V1]
bodyaccX_table_6_t_mean[,V1]

#mean acceleration for a time slice
bodyaccX_table_1_t_mean[,mean(V1)]
bodyaccX_table_2_t_mean[,mean(V1)]
bodyaccX_table_3_t_mean[,mean(V1)]
bodyaccX_table_4_t_mean[,mean(V1)]
bodyaccX_table_5_t_mean[,mean(V1)]
bodyaccX_table_6_t_mean[,mean(V1)]

bodyaccX_table_1_t_meancalc <- data.table(t(bodyaccX_table_1_t_mean[,c(.N,lapply(.SD,mean))]))

names(bodyaccX_table_1_t_meancalc)<- "Mean.Acceleration.X.Walking.All.Subjects" 
head(bodyaccX_table_1_t_meancalc)

###the maimum acceleration is more interesting since 
#the mean can be small even when you are walking or running
bodyaccX_table_1_t_max <- bodyaccX_table_1_t[4:131,]
bodyaccX_table_2_t_max <- bodyaccX_table_2_t[4:131,]
bodyaccX_table_3_t_max <- bodyaccX_table_3_t[4:131,]
bodyaccX_table_4_t_max <- bodyaccX_table_4_t[4:131,]
bodyaccX_table_5_t_max <- bodyaccX_table_5_t[4:131,]
bodyaccX_table_6_t_max <- bodyaccX_table_6_t[4:131,]

#change all columns from character to numeric
bodyaccX_table_1_t_max <- sapply(bodyaccX_table_1_t_max,as.numeric)
bodyaccX_table_2_t_max <- sapply(bodyaccX_table_2_t_max,as.numeric)
bodyaccX_table_3_t_max <- sapply(bodyaccX_table_3_t_max,as.numeric)
bodyaccX_table_4_t_max <- sapply(bodyaccX_table_4_t_max,as.numeric)
bodyaccX_table_5_t_max <- sapply(bodyaccX_table_5_t_max,as.numeric)
bodyaccX_table_6_t_max <- sapply(bodyaccX_table_6_t_max,as.numeric)
#from matrix to data table
bodyaccX_table_1_t_max <- data.table(bodyaccX_table_1_t_max)
bodyaccX_table_2_t_max <- data.table(bodyaccX_table_2_t_max)
bodyaccX_table_3_t_max <- data.table(bodyaccX_table_3_t_max)
bodyaccX_table_4_t_max <- data.table(bodyaccX_table_4_t_max)
bodyaccX_table_5_t_max <- data.table(bodyaccX_table_5_t_max)
bodyaccX_table_6_t_max <- data.table(bodyaccX_table_6_t_max)

#tests that the maxs are all there
bodyaccX_table_1_t_max[,V1]
bodyaccX_table_2_t_max[,V1]
bodyaccX_table_3_t_max[,V1]
bodyaccX_table_4_t_max[,V1]
bodyaccX_table_5_t_max[,V1]
bodyaccX_table_6_t_max[,V1]

#max acceleration for a time slice
bodyaccX_table_1_t_max[,max(V1)]
bodyaccX_table_2_t_max[,max(V1)]
bodyaccX_table_3_t_max[,max(V1)]
bodyaccX_table_4_t_max[,max(V1)]
bodyaccX_table_5_t_max[,max(V1)]
bodyaccX_table_6_t_max[,max(V1)]

bodyaccX_table_1_t_maxcalc <- data.table(t(bodyaccX_table_1_t_max[,c(.N,lapply(.SD,max))]))

names(bodyaccX_table_1_t_maxcalc)<- "max.Acceleration.X.Walking.All.Subjects" 
head(bodyaccX_table_1_t_maxcalc)