# Getting-and-Cleaning-Data-Course-Project

The run_analysis.R includes 3 functions that covers these parts of the assignment:

### complete.dataset() :
* 1) Merges the training and the test sets to create one data set.
* 3) Uses descriptive activity names to name the activities in the data set
* 4) Appropriately labels the data set with descriptive variable names.

### justmeanstd() :
* 2) Extracts only the measurements on the mean and standard deviation for each measurement.

### splitmean() :
* 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The final output of splitmean() is a matrix with this structure:

``` str(data.split)
 num [1:79, 1:180] 0.2773 -0.0174 -0.1111 -0.2837 0.1145 ...
 - attr(*, "dimnames")=List of 2
  ..$ : chr [1:79] "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" "tBodyAcc-std()-X" ...
  ..$ : chr [1:180] "WALKING.1" "WALKING_UPSTAIRS.1" "WALKING_DOWNSTAIRS.1" "SITTING.1" ...
```
Where the first dimnames are the variables and the second one are the labels and subjects used as factors to calculate the mean of the variables. For example, in "WALKING.1", "WALKING" is the label factor and "1" the subject factor (I didn't find a qualitative variable for the subject).
