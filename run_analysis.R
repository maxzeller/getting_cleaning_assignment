library(plyr)
setwd("C:/Users/MZ/Documents/COURSERA/getting_cleaning_assignment")
# Step 1
# Merge the training and test sets to create one data set
#========================================================
x_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")

x_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")

# create x_data set
x_data <- rbind(x_train, x_test)
# create y_data set
y_data <- rbind(y_train, y_test)
# create subject_data set
subject_data <- rbind(subject_train, subject_test)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
#======================================================================================
features <- read.table("UCI HAR Dataset/features.txt")
# get only columns with "mean()" or "std()" in their names
mean_and_std<- grep("-(mean|std)\\(\\)", features[, 2])
# subset the desired columns
x_data <- x_data[,mean_and_std]

# Step 3
# Use descriptive activity names to name the activities in the data set
#=====================================================================
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt")
# put fullnames for activities
y_data[, 1] <- activity_label[y_data[, 1], 2]

# Step 4
# Appropriately label the data set with descriptive variable names
#=================================================================
# put corresponding column names
names(x_data) <- features[mean_and_std, 2]
names(subject_data) <- "subject"
names(y_data) <- "full_name_activity"

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
#============================================================================
# bind all the data in a single data set
complete_set <- cbind(x_data, y_data, subject_data)
average_data <- ddply(complete_set, .(subject, full_name_activity), function(x) colMeans(x[, 1:66]))
# 66=68 columns excepted the two last(activity & subject)
write.table(average_data,file="average_data.txt",row.names=F,sep="\t")
