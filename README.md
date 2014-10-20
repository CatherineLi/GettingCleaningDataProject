GettingCleaningDataProject
==========================

Per request, this README.md serves the purpose of describing how the script run_analysis.R works.  Given this project requires five tasks to be completed, I will discuss how this particular script can accomplish each one by one.

Task 1: Merges the train and the test sets to create one data set.
-------------------------------------------------------------------


Step 1: 
I first read into memory the subjects lists for both train dataset as well as test data set and created two datasets: one is called subject_train, which contains 21 subject's IDs. Another dataset is called test_train, which contains 9 subject's IDS.  

subject_train<-read.table("./project/UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table("./project/UCI HAR Dataset/test/subject_test.txt")

Given I need to combine the training dataset and test dataset together later, I first make sure both data sets have the exactly the same variable names, called "subjectID".

names(subject_train)="subjectID"
names(subject_test)="subjectID"


Step 2: 
I then read into memory the y data for both train and test dataset. For the same reason, I gave them exactly the same names.

y_train<-read.table("./project/UCI HAR Dataset/train/y_train.txt")
y_test<-read.table("./project/UCI HAR Dataset/test/y_test.txt")
names(y_train)="activities"
names(y_test)="activities"

Step 3.
I read into memory the x data for both train and test dataset. I also read into feature.txt so that I can assign names to each element of the vector.

features<-read.table("./project/UCI HAR Dataset/features.txt")
x_train<-read.table("./project/UCI HAR Dataset/train/x_train.txt")
x_test<-read.table("./project/UCI HAR Dataset/test/x_test.txt")
names(x_train)=features$V2
names(x_test)=features$V2

Step 4. 
I create train dataset and test dataset and combine these two datasets together. Please note at the end of this step, datafull is a full dataset with descriptive variables names already. In other words, the fourth task of "labeling the data set with descriptive variable names" is already completed. 

traindata<-cbind(subject_train, y_train, x_train)
testdata<-cbind(subject_test, y_test, x_test)
datafull<-rbind(traindata, testdata)


Task 2: Extracts only the measurements on the mean and standard deviation for each measurement.
-------------------------------------------------------------------------------------------------

I first created a logical varaible returning TRUE for those variable names containing mean or standard deviation, and FALSE otherwise. I then use this logical variable (named "cond") to subset the fulldata.

cond<-grepl("mean|std", names(datafull)) 
MeanStdExtracted<-datafull[,cond]

Task 3: Uses descriptive activity names to name the activities in the data set.
-------------------------------------------------------------------------------

For this task, I use "activity_labels" as a guidance to replace values "1" with "WALKING", "2" with "WALKING_UPSTAIRS" etc.

Task 4: Appropriately labels the data set with descriptive variable names. 
---------------------------------------------------------------------------

It is completed in 1. Currently, all varaibles in datafull are descriptive.

Task 5: From the data set in step 4, creates a second, independent tidy data setwith the average of each variable for each activity and each subject.
----------------------------------------------------------------------------------------------------------------------------

To complete this task, I first splitted data into 180 groups, a group per subject per activity (180=30 subjects * 6 activities). I then use lappy to calculate the column average for each varaible. The resultant dataset is labeled "SecondTidyData". At the end, I write "SecondTidyData" into a txt file. 

TidyData<-lapply(Splitinto180Groups, colMeans)
write.table(TidyData, "C:/Users/qli/Desktop/GettingAndCleaningData20140927/project/TidyData.txt", sep="\t", row.name=FALSE)










