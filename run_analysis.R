
library(dplyr)
# 1. Merges the training and the test sets to create one data set

tax <- read.table("train/X_train.txt")
tay <- read.table("train/y_train.txt")
tas <- read.table("train/subject_train.txt")

xte <- read.table("test/X_test.txt")
yte <- read.table("test/y_test.txt")
ste <- read.table("test/subject_test.txt")

features <- rbind(tax, xte)
activity <- rbind(tay, yte)
subject <- rbind(tas, ste)

Data <- cbind(features,activity, subject)
f <- read.table("features.txt")
a = read.table("activity_labels.txt")
colnames(features) <- f[,2] 
colnames(a) <- c('ai','at')

 colnames(Data) <- c( f[,2], 'activity', 'subject')


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
cn <- colnames(Data)
rmeanstd <- (grepl("activity" , cn) |grepl("subject" , cn) |grepl("mean.." , cn) |grepl("std.." , cn) 
)
DataMS <- Data [, rmeanstd]

# 3.Uses descriptive activity names to name the activities in the data set
DataMS2 <- DataMS

DataMS2$activity <- factor(DataMS2$activity, levels = a[,1], labels = a[,2])

# 4.Appropriately labels the data set with descriptive variable names.

names(DataMS2) <- gsub("\\()", "", names(DataMS2))
names(DataMS2) <- gsub("^t", "timeDomain", names(DataMS2))
names(DataMS2) <- gsub("^f", "frequenceDomain", names(DataMS2))
names(DataMS2) <- gsub("-mean", "Mean", names(DataMS2))
names(DataMS2) <- gsub("-std", "StandardDeviation", names(DataMS2))
names(DataMS2) <- gsub("Acc", "Accelerometer", names(DataMS2))
names(DataMS2) <- gsub("Gyro", "Gyroscope", names(DataMS2))
names(DataMS2) <- gsub("Mag", "Magnitude", names(DataMS2))
names(DataMS2) <- gsub("Freq", "Frequency", names(DataMS2))
names(DataMS2) <- gsub("BodyBody", "Body", names(DataMS2))
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


DataMS3 <- aggregate(. ~subject + activity, DataMS2, mean)
DataMS3 <- DataMS3[order(DataMS3$subject, DataMS3$activity),]
write.table(DataMS3, "DataMS3.txt", row.name=FALSE)

