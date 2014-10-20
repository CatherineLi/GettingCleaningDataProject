# 1. Merges the training and the test sets to create one data set.
# 4. Appropriately labels the data set with descriptive variable names. 
#======================================================================

# read in subject data for both train and test; rename the columns


subject_train<-read.table("./project/UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table("./project/UCI HAR Dataset/test/subject_test.txt")
names(subject_train)="subjectID"
names(subject_test)="subjectID"

# read in y data for both train and test; renames the columns
y_train<-read.table("./project/UCI HAR Dataset/train/y_train.txt")
y_test<-read.table("./project/UCI HAR Dataset/test/y_test.txt")
names(y_train)="activities"
names(y_test)="activities"

# read in x data for both train and test; rename the columns
features<-read.table("./project/UCI HAR Dataset/features.txt")
x_train<-read.table("./project/UCI HAR Dataset/train/x_train.txt")
x_test<-read.table("./project/UCI HAR Dataset/test/x_test.txt")
names(x_train)=features$V2
names(x_test)=features$V2


# create train dataset and test dataset and combine these two datasets together.
traindata<-cbind(subject_train, y_train, x_train)
testdata<-cbind(subject_test, y_test, x_test)
datafull<-rbind(traindata, testdata)


#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#=====================================================================================
cond<-grepl("mean|std", names(datafull)) 
MeanStdExtracted<-datafull[,cond]

#3. Uses descriptive activity names to name the activities in the data set
#=========================================================================
datafull$activities[datafull$activities==1] <- "WALKING"
datafull$activities[datafull$activities==2] <- "WALKING_UPSTAIRS"
datafull$activities[datafull$activities==3] <- "WALKING_DOWNSTAIRS"
datafull$activities[datafull$activities==4] <- "SITTING"
datafull$activities[datafull$activities==5] <- "STANDING"
datafull$activities[datafull$activities==6] <- "LAYING"


# 4. Appropriately labels the data set with descriptive variable names. 
#=====================================================================+

# Answer: it is completed in 1. Currently, all varaibles in datafull are
# descriptive.


# 5. From the data set in step 4, creates a second, independent tidy data set
#  with the average of each variable for each activity and each subject.
#======================================================================
# understand the data
table(datafull$subjectID, datafull$activities)

# split data into 30*6=180 groups; each group describes one subjectID and one activity only.
Splitinto180Groups<-split(datafull[,c(3:563)], datafull[,c(1:2)])

# for each combination (subjectID*activities), calculate the column average for each feature/variable.
TidyData<-lapply(Splitinto180Groups, colMeans)
write.table(TidyData, "C:/Users/qli/Desktop/GettingAndCleaningData20140927/project/TidyData.txt", sep="\t", row.name=FALSE)
