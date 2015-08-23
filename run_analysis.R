############################################
## Getting & Cleaning Data -- Course Project
## Khalil H Najafi
############################################

## run_analysis works on the UCI Human Activity Recognition dataset
## available online (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
## accomplishing several tasks in creating a tidy subset:
##
## 1) Merges the training and test sets to create one data set
## 2) Extracts only the mean and standard deviation for each measurement
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names
## 5) From 4) creates a second tidy set with the average of each variable for each activity and subject

## Set working directory accordingly
setwd("/Users/khnajafi/Library/Mobile Documents/com~apple~CloudDocs/Documents/School Matters/JHU/03 - Getting & Cleaning Data/Project/UCI Dataset")
## load (install, if necessary) relevant libraries for tidying
if(!"dplyr" %in% rownames(installed.packages())){
        install.packages("dplyr")
}
library(dplyr)

##### 1) Merges the training and test sets to create one data set

## Import activity list & features list
features <- read.table("./features.txt", stringsAsFactors = F)
activity <- read.table("./activity_labels.txt")

## Import, clean, and merge Test set
sub_test <- read.table("./test/subject_test.txt")
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/Y_test.txt")

sub_test <- tbl_df(sub_test) %>% rename(SubjectID = V1)
y_test <- tbl_df(y_test) %>% rename(ActivityID = V1)
colnames(x_test) <- features[,2]
test_set <- cbind(sub_test, y_test, x_test)

## Import, clean, and merge Training set
sub_train <- read.table("./train/subject_train.txt")
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/Y_train.txt")

sub_train <- tbl_df(sub_train) %>% rename(SubjectID = V1)
y_train <- tbl_df(y_train) %>% rename(ActivityID = V1)
colnames(x_train) <- features[,2]
train_set <- cbind(sub_train, y_train, x_train)

## Merge Test & Training set
data <- rbind(test_set, train_set)

##### 2) Extracts only the mean and standard deviation for each measurement

## Extracts only columns with either first two moments for each measurement
data <- data[, !duplicated(colnames(data))] %>% select(matches("mean|std|id")) %>% arrange(SubjectID, ActivityID) %>% rename(Activity = ActivityID)

##### 3) Uses descriptive activity names to name the activities in the data set

data[,2] <- as.factor(data[,2])
levels(data[,2]) <- c("WALKING", "WALKING UPSTAIRS", "WALKING DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

##### 4) Appropriately labels the data set with descriptive variable names

## Update all column names into descriptive versions
vars <- read.table("./vars.txt", stringsAsFactors = F)
colnames(data) <- vars[,1]

##### 5) Creates a second tidy set with the average of each variable for each activity and subject
rm(list=setdiff(ls(), "data"))
write.table(data, file = "./tidy.txt")