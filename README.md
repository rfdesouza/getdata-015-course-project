# Getting and Cleaning Data - Course Project


## Introduction

This repository (https://github.com/rfdesouza/getdata-015-course-project.git) is my course project submission for the *Getting and Cleaning Data* course (getdata-015), offered by Johns Hopkins University through Coursera as part of the Data Science specialization.


## Repository Files

This repository consists of the following files:

* **.gitignore** -- A file that specifies what files Git should not track (see http://git-scm.com/docs/gitignore)
* **CodeBook.md** -- A markdown file that "describes the variables, the data, and any transformations or work that you performed to clean up the data"
* **getdata-projectfiles-UCI HAR Dataset.zip** -- A zip file that contains the raw dataset
* **README.md** -- A markdown file that describes the repo, the project, and the steps for running the run_analysis script (this file)
* **run_analysis.R** -- An R script file that produces a tidy data set (specified by the Project Description) from the raw data set
* **stepFiveTidyDataSet.txt** -- A tab-deliminated text file containing the tidy data set produced by the run_analysis.R script


## Project Description

From the course project page:

> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
> 
> One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
> 
> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
> 
> Here are the data for the project: 
> 
> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
> 
> You should create one R script called run_analysis.R that does the following. 
> 
1. Merges the training and the test sets to create one data set.
> 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 
3. Uses descriptive activity names to name the activities in the data set
> 
4. Appropriately labels the data set with descriptive variable names. 
> 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
> 
> Good luck!


## Raw Data Information

For details on the raw data, view the README.txt and features_info.txt files in **getdata-projectfiles-UCI HAR Dataset.zip** in the UCI HAR Dataset directory.


## run_analysis.R Script Process

1. Set paths to all the relevant UCI HAR Dataset files
1. Load requisite packages (data.table, dplyr, and tidyr)
1. Unzip getdata-projectfiles-UCI HAR Dataset.zip into the working directory
1. Run stepOne()
    1. Read subjects from both train and test data and bind the rows
    1. Read the activity IDs from both train and test data and bind the rows
    1. Read the feature variablesfrom both train and test data and bind the rows
    1. Combine the three newly created data frames into one data frame through binding the columns
    1. Return the newly combined data set as a tbl_df (useful for viewing the output when running the step functions individually)
1. Run stepTwo() with the data set from stepOne()
    1. Read the features table from the UCI HAR Dataset and combine the row numbers with the labels (otherwise R interprets certain columns as duplicates)
    1. Combine *SubjectId* and *ActivityID* with the feature names
    1. Use grep to determine the indicies of the columns containing *mean()* and *std() *(this pattern ensures that the *meanFreq()* variables and *angle()* vectors are not included)
    1. Use the indicies to extract "only the measurements on the mean and standard deviation for each measurement"
    1. Return the resulting data set
1. Run stepThree() with the data set from stepTwo()
    1. Read the activity labels table from the UCI HAR Dataset
    1. Transform the *ActivityId* column into the *Activity* column through matching the activity labels rows to the activity IDs
    1. Return the resulting data set
1. Run stepFour() with the data set from stepThree()
    1. Read the headings created when the variables were first read from the raw data and remove the "V"s to get their raw data indicies
    1. Read the features table again and use the indicies to obtain the feature labels for the columns extracted in stepTwo()
    1. Combine the *SubjectId* and *Activity* labels with the feature labels
    1. Replace the stepThree() data set labels with the newly created labels
    1. Return the resulting data set
1. Run stepFive() with the data set from stepFour()
    1. Group the data set by *SubjectId* and then by *Activity*
    1. Calculate the mean for each column variable
    1. Return the resulting data set
1. Write the data set from stepFive() to a tab-deliminated text file named **stepFiveTidyDataSet.txt**
1. Open the data set from stepFive() into an R Data Viewer window


## Running run_analysis.R Script

1. Download the full repository
1. Open R
1. Ensure the data.table, dplyr, and tidyr packages are installed
1. Set your working directory to the download location
1. Type `source("run_analysis.R")` into the R console
1. Type `runAnalysisMain()` into the R console


## run_analysis.R Script Output

* A tab-deliminated text file, **stepFiveTidyDataSet.txt**, containing the tidy data set described by step 5 in Project Description above
* An R Data Viewer window displaying the tidy data set

## run_analysis.R Script Information

* Written in R Studio (Version 0.99.441) using R version 3.2.0 (2015-04-16)
* Written using the following packages:
    * data.table (Version 1.9.4)
    * dplyr (Version 0.4.2)
    * tidyr (version 0.2.0)
* The script takes approximately 30 seconds to complete on an Asus UX31A laptop