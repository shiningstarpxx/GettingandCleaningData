# Code Book
## describe the variables, data and transformations that used in the script.

## Script
The script "run_analysis.R" steps:

1. Download zip file and unzip it
2. First Merge training data
 1. subject is the first column
 2. activity is the second column
 3. the followins from X_train.txt
 4. merge to "train"
3. Do test as the test, merge to "test"
4. Merge "train" and "test" into "data
5. get vector of descriptive variable names in "features.txt"
6. Append "subject" and "activity" to colnames_vector fit merged data"
7. set data column names with colnames_vector
8. extract only the measurements on the mean and standard deviation.
9. make.unique to eliminate column names are duplicated
10. Name the activity: replace indices withactivity names
in the activity_labels.txt
11. Loop over rows of filtered_data_set to replace the items
in the second column, the data now is required by step 4.
12. sort by subject & activity to generate step 5.

## Resulting data
use the script the load the data:
> data = read.table("final_data.txt", header = TRUE)

the meaning in the data are followings:
+ "1" "subject"
+ "2" "activity"
+ "3" "tBodyACC.mean...X"
+ "4" "tBodyACC.mean...Y"
+ "5" "tBodyACC.mean...Z"
+ "6" "tGravityACC.mean...X"
+ "7" "tGravityACC.mean...Y"
+ "8" "tGravityACC.mean...Z"
+ "9" "tBodyACCJerK.mean...X"
+ "10" "tBodyACCJerK.mean...Y"
+ "11" "tBodyACCJerK.mean...Z"
+ "12" "tBodyGyro.mean...X"
+ "13" "tBodyGyro.mean...Y"
+ "14" "tBodyGyro.mean...Z"
+ "15" "tBodyGyroJerk.mean...X"
+ "16" "tBodyGyroJerk.mean...Y"
+ "17" "tBodyGyroJerk.mean...Z"
+ "18" "tBodyAccMag.mean.."
+ "19" "tGravityAccMag.mean.."
+ "20" "tBodyAccJerkMag.mean.."
+ "21" "tBodyGyroMag.mean.."
+ "22" "tBodyGyroJerkMag.mean.."
+ "23" "fBodyACC.mean...X"
+ "24" "fBodyACC.mean...Y"
+ "25" "fBodyACC.mean...Z"
+ "26" "fBodyACCJerK.mean...X"
+ "27" "fBodyACCJerK.mean...Y"
+ "28" "fBodyACCJerK.mean...Z"
+ "29" "fBodyGyro.mean...X"
+ "30" "fBodyGyro.mean...Y"
+ "31" "fBodyGyro.mean...Z"
+ "32" "fBodyAccMag.mean.."
+ "33" "fBodyBodyAccJerkMag.mean.."
+ "34" "fBodyBodyGyroMag.mean.."
+ "35" "fBodyBodyGyroJerkMag.mean.."
+ "36" "tBodyAcc.std...X"
+ "37" "tBodyAcc.std...Y"
+ "38" "tBodyAcc.std...Z"
+ "39" "tGravityAcc.std...X"
+ "40" "tGravityAcc.std...Y"
+ "41" "tGravityAcc.std...Z"
+ "42" "tBodyAccJerk.std...X"
+ "43" "tBodyAccJerk.std...Y"
+ "44" "tBodyAccJerk.std...Z"
+ "45" "tBodyGyro.std...X"
+ "46" "tBodyGyro.std...Y"
+ "47" "tBodyGyro.std...Z"
+ "48" "tBodyGyroJerk.std...X"
+ "49" "tBodyGyroJerk.std...Y"
+ "50" "tBodyGyroJerk.std...Z"
+ "51" "tBodyAccMag.std.."
+ "52" "tGravityAccMag.std.."
+ "53" "tBodyAccJerkMag.std.."
+ "54" "tBodyGyroMag.std.."
+ "55" "tBodyGyroJerkMag.std.."
+ "56" "fBodyAcc.std...X"
+ "57" "fBodyAcc.std...Y"
+ "58" "fBodyAcc.std...Z"
+ "59" "fBodyAccJerk.std...X"
+ "60" "fBodyAccJerk.std...Y"
+ "61" "fBodyAccJerk.std...Z"
+ "62" "fBodyGyro.std...X"
+ "63" "fBodyGyro.std...Y"
+ "64" "fBodyGyro.std...Z"
+ "65" "fBodyAccMag.std.."
+ "66" "fBodyBodyAccJerkMag.std.."
+ "67" "fBodyBodyGyroMag.std.."
+ "68" "fBodyBodyGyroJerkMag.std.."

the explaination could be find in "features_info.txt"
