###This is a test script to setup GitHub with R for the Tidy Data project


#####begin of environment setup######################################
##general use

library(data.table)
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
#####end of read for function list commong to test and train#####

#####begin of preparation of data for combining test and train###

#y_test.txt contains test labels

y_test_table <- fread("./y_test.txt")
head(y_test_table)
nrow(y_test_table)

names(y_test_table)[1] <- "ActivityNumber"

head(y_test_table)
table(y_test_table)

#subject_test.txt: Each row identifies the subject who performed 
#the activity for each window sample. Its range is from 1 to 30

subject_test_table <- fread("./subject_test.txt")
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

