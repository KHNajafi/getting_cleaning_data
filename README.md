==================================================================
###COURSE PROJECT (GETTING & CLEANING DATA; JOHNS HOPKINS UNIVERSITY)
==================================================================
#UCI Human Activity Recognition dataset available online:
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Khalil H Najafi
==================================================================

##OVERVIEW:
==================================
The repository contains an R-script that accomplishes several tasks, culminating in the 
creation of a tidy subset containing the statistical mean and standard deviation for 
each activity, for each subject.  The tasks are as follows:
	1) Merges the training and test sets to create one data set
	2) Extracts only the mean and standard deviation for each measurement
	3) Uses descriptive activity names to name the activities in the data set
	4) Appropriately labels the data set with descriptive variable names
	5) From 4) creates a second tidy set with the average of each variable for each 
	   activity and subject
	   
##RUNNING THE SCRIPT:
==================================
To run the script successfully, amend the working directory set on line 17 locally,
ensuring the UCI HAR dataset is unzipped in the same directory.

##THE REPOSITORY INCLUDES THE FOLLOWING FILES:
==================================
- README
- Codebook (explains the variables of the UCI HAR dataset, and modifications from the 
script)
- run_analysis.R (R script accomplishing the above)