GettingCleaningDataProject
==========================

Per request, this README.md serves the purpose of describing how the script run_analysis.R works.  Given this project requires five tasks to be completed, I will discuss how this particular script can accomplish each one by one.

Task 1: Merges the train and the test sets to create one data set.
-------------------------------------------------------------------

Step 1: 
I first read into memory the subjects lists for both train as well as test data set: subject_train contains 21 subject's IDs;  subject_test contains 9 subject's IDS.  

subject_train<-read.table("./project/UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table("./project/UCI HAR Dataset/test/subject_test.txt")

Given I need to combine train and test dataset together later in task 5, I assigned same name "subjectID" to subject lists across trian and test dataset.  

names(subject_train)="subjectID"
names(subject_test)="subjectID"


Step 2: 
I then read into memory the y data for both train and test dataset. For the same reason described above, I gave them the same name.

y_train<-read.table("./project/UCI HAR Dataset/train/y_train.txt")
y_test<-read.table("./project/UCI HAR Dataset/test/y_test.txt")
names(y_train)="activities"
names(y_test)="activities"

Step 3.
I read into memory x data for both train and test dataset. I also read into memory feature.txt so that I can assign names to x_train and x_test. 

features<-read.table("./project/UCI HAR Dataset/features.txt")
x_train<-read.table("./project/UCI HAR Dataset/train/x_train.txt")
x_test<-read.table("./project/UCI HAR Dataset/test/x_test.txt")
names(x_train)=features$V2
names(x_test)=features$V2

Step 4. 
I create train data and test data and combine these two datasets together. The final raw dataset is named "datafull" to remind others it is a combination of train and test data.  

traindata<-cbind(subject_train, y_train, x_train)
testdata<-cbind(subject_test, y_test, x_test)
datafull<-rbind(traindata, testdata)

Task 2: Extracts only the measurements on the mean and standard deviation for each measurement.
-------------------------------------------------------------------------------------------------

I first created a logical varaible returning TRUE for those variable names containing mean or standard deviation, and FALSE otherwise. I then use this logical variable to subset datafull.

cond<-grepl("mean|std", names(datafull)) 
MeanStdExtracted<-datafull[,cond]

Task 3: Uses descriptive activity names to name the activities in the data set.
-------------------------------------------------------------------------------
For this task, I use "activity_labels" as a guidance to replace values "1" with "WALKING", "2" with "WALKING_UPSTAIRS", "3" with "WALKING_DOWNSTAIRS", "4" with "SITTING", "5" with "STANDING", "6" with "LAYING". 

datafull$activities[datafull$activities==1] <- "WALKING"
datafull$activities[datafull$activities==2] <- "WALKING_UPSTAIRS"
datafull$activities[datafull$activities==3] <- "WALKING_DOWNSTAIRS"
datafull$activities[datafull$activities==4] <- "SITTING"
datafull$activities[datafull$activities==5] <- "STANDING"
datafull$activities[datafull$activities==6] <- "LAYING"

Task 4: Appropriately labels the data set with descriptive variable names. 
---------------------------------------------------------------------------
Given all 563 variable names are currently descriptive, I did clean up work to remove dashes and parenthesis. 

# remove "-" in column variables
datafullRemovingDash<-gsub("-", "", names(datafull))
names(datafull)=datafullRemovingDash

# remove "()" in column variables.
datafullRemovingPar<-gsub("\\()", "", names(datafull))
names(datafull)=datafullRemovingPar

Task 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
----------------------------------------------------------------------------------------------------------------------------
To complete this task, I first splitted data into 180 groups, a group per subject per activity (180=30 subjects * 6 activities). I then use sapply to calculate the column average for each feature varaible. The resultant dataset is labeled "TidyDataTemp". I transposed this temp data to make sure the column variables represent measurement. At the end, I write Tidy Data into a txt file without row names, per request. 

# split data into 30*6=180 groups; each group describes one subjectID and one activity only.
Splitinto180Groups<-split(datafull[,c(3:563)], datafull[,c(1:2)])

# for each combination (subjectID*activities), calculate the column average for each feature/variable.
TidyDataTemp<-sapply(Splitinto180Groups, colMeans) # The dimension is 561*180

# Transpose the TidyData to ensure column variables represent measurements. 
TidyData<-t(TidyDataTemp) 

# write the tidydata into txt file
write.table(TidyData, "C:/Users/qli/Desktop/GettingAndCleaningData20140927/project/TidyData.txt", sep="\t", row.name=FALSE)







