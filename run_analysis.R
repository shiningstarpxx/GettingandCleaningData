#!/usr/bin/R
# Download zip file and unzip this file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="project.zip", mod='wb', method='curl')
unzip("project.zip")

## STEP ONE ##
# Merge Training Dataset
# 1. read data from train files in the directory
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

# 2. merge train data
train_data <- cbind(subject_train, y_train, x_train)

# Merge Test Dataset
# 1. read data from test files in the directory
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

# 2. merge test data
test_data <- cbind(subject_test, y_test, x_test)

# Merge train data and test data
data <- rbind(train_data, test_data)

## STEP TWO ##
# get column name 
features <- read.table("./UCI HAR Dataset/features.txt")
colnames_vector <- as.vector(features[,2])

# Append "subject" and "activity" to vector
colnames_vector <- append(c("subject", "activity"), colnames_vector)
colnames(data) <- colnames_vector

library(dplyr)
# column names are duplicated
colnames(data) <- make.unique(colnames(data))
filtered_data_set <- select(data, matches("subject"),
              matches("activity"), contains("mean()"), contains("std()"))

## STEP THREE ##
# name the activity: replace indices(1 to 6) with activity names
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
# loop over rows of filtered_data_set to replace the items in the second column
for(i in 1:nrow(filtered_data_set)) {
  filtered_data_set[i,2] <- as.character(activity_labels[filtered_data_set[i,2], 2])
}

# write the tidy data to file "step4_data_set.txt"
write.table(filtered_data_set, "step4_data_set.txt", row.name = FALSE)

## STEP 5 ##
tidy_data <- aggregate(select(filtered_data_set, -c(1, 2)),
             list(subject = filtered_data_set$subject,
             activity = filtered_data_set$activity), mean)

# sort by subject & activity
tidy_data <- arrange(tidy_data, subject, activity)

write.table(tidy_data, "final_data.txt", row.name = FALSE)
