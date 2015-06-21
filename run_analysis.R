Path_subject_train <- 'UCI HAR Dataset/train/subject_train.txt'
Path_subject_test <- 'UCI HAR Dataset/test/subject_test.txt'
Path_y_train <- 'UCI HAR Dataset/train/y_train.txt'
Path_y_test <- 'UCI HAR Dataset/test/y_test.txt'
Path_x_train <- 'UCI HAR Dataset/train/X_train.txt'
Path_x_test <- 'UCI HAR Dataset/test/x_test.txt'
Path_features <- 'UCI HAR Dataset/features.txt'
Path_activity_labels <- 'UCI HAR Dataset/activity_labels.txt'

runAnalysisMain <- function() {
  library(data.table)
  library(dplyr)
  library(tidyr)
  
  unzip('getdata-projectfiles-UCI HAR Dataset.zip')
  
  dfStepFive <-  stepOne() %>%
                  stepTwo() %>%
                  stepThree() %>%
                  stepFour() %>%
                  stepFive()
  
  write.table(dfStepFive, 'stepFiveTidyDataSet.txt', row.names = FALSE)
  View(dfStepFive)
}

stepOne <- function() {
  subject_train <- read.table(Path_subject_train)
  subject_test <- read.table(Path_subject_test)
  subject <- bind_rows(subject_train, subject_test)
  subject <- rename(subject, SubjectId = V1)
  
  y_train <- read.table(Path_y_train)
  y_test <- read.table(Path_y_test)
  y <- bind_rows(y_train, y_test)
  y <- rename(y, ActivityId = V1)

  x_train <- read.table(Path_x_train)
  x_test <- read.table(Path_x_test)
  x <- bind_rows(x_train, x_test)

  merge <- bind_cols(subject, y, x)
  dfStepOne <- tbl_df(merge)
  
  dfStepOne
}

stepTwo <- function(dfStepOne) {
  features <- read.table(Path_features)
  featureNames <- paste(features[,1],features[,2])
  colNames <- c('SubjectId','ActivityId',featureNames)
  
  pattern <- "mean\\(\\)|std\\(\\)"
  meanAndStdIndicies <- grep(pattern, colNames)

  dfStepTwo <- select(dfStepOne, SubjectId, ActivityId, meanAndStdIndicies)
  
  dfStepTwo
}

stepThree <- function(dfStepTwo) {
  activity_labels <- read.table(Path_activity_labels)
  
  dfStepThree <- mutate(dfStepTwo, ActivityId = activity_labels[ActivityId, 2])
  
  dfStepThree
}

stepFour <- function(dfStepThree) {
  oldDfNames <- names(dfStepThree)
  dfVariableNames <- oldDfNames[-(1:2)]
  dfVariableIndicies <- as.numeric(gsub('V','',dfVariableNames))
  
  features <- read.table(Path_features)
  featureLabels <- as.character(features[dfVariableIndicies, 2])
  newDfNames <- c('SubjectId', 'Activity', featureLabels)
  
  dfStepFour <-  rename_(dfStepThree, .dots=setNames(oldDfNames,newDfNames))
  
  dfStepFour
}

stepFive <- function(dfStepFour) {
  dfStepFour <- group_by(dfStepFour, SubjectId, Activity)
  dfStepFive <- summarise_each(dfStepFour, funs(mean))
  
  dfStepFive
}