# Get path
if (!exists("baseDir")) {
  print("baseDir does not exist, set to current directory")
  baseDir <- getwd()
} else {
  print(paste("baseDir is", baseDir))
}

# Get features and activities
features <- read.table(paste(baseDir,"UCI HAR Dataset/features.txt",sep='/'))
activities <- read.table(paste(baseDir,"UCI HAR Dataset/activity_labels.txt",sep="/"), 
                     col.names=c("activity_id","activity"))

# Merge train and test
library(plyr)

y_train <- read.table(paste(baseDir,"UCI HAR Dataset/train/y_train.txt",sep='/'), col.names=c("activity_id"))
y_test <- read.table(paste(baseDir,"UCI HAR Dataset/test/y_test.txt",sep='/'), col.names=c("activity_id"))
y_all <- ldply(c("y_train", "y_test"), 
               function(dn) data.frame(get(dn)))

X_train = read.table(paste(baseDir,"UCI HAR Dataset/train/X_train.txt",sep='/'), col.names=features[,2])
X_test = read.table(paste(baseDir,"UCI HAR Dataset/test/X_test.txt",sep='/'), col.names=features[,2])
X_all <- ldply(c("X_train", "X_test"), 
               function(dn) data.frame(get(dn)))

subject_train = read.table(paste(baseDir,"UCI HAR Dataset/train/subject_train.txt",sep='/'), 
                           col.names=c("subject"))
subject_test = read.table(paste(baseDir,"UCI HAR Dataset/test/subject_test.txt",sep='/'), 
                          col.names=c("subject"))
subject_all <- ldply(c("subject_train", "subject_test"), 
               function(dn) data.frame(get(dn)))


# Get mean and std columns
mean_std_columns <- features[grepl("mean\\(\\)",features[,2]) | grepl("std\\(\\)",features[,2]),]
X_all_info <- X_all[, mean_std_columns[,1]] 

# Merge X_all_info with y and subject
X_all_info$y <- y_all[,]
X_all_info$subject <- subject_all[,]

# Get descriptive activity names 
X_with_activity <- merge(X_all_info, activities, by.x="y", by.y="activity_id") 

# Remove y column
X_with_activity <- X_with_activity[ , -which(names(X_with_activity) %in% c("y"))]

# Export dataset
write.table(X_with_activity,file=paste(baseDir,"complete_mean_and_std.csv",sep='/'),sep=",",row.names=F)

# Aggregate on subject and activity (mean)
activities = sort(unique(X_with_activity$activity))
subjects = sort(unique(X_with_activity$subject))

# Init result
meanList <- NULL
activity <- c()
subject <- c()

# Add mean rows per activity and subject
for (act in activities) {
  for (sub in subjects) {
    hits <- X_with_activity[X_with_activity$activity==act & X_with_activity$subject==sub, ]
    hits <- hits[ , -which(names(hits) %in% c("activity","subject"))]
    res <- apply(hits,2,mean)
    
    meanList <- rbind(meanList, res)
    activity <- append(activity, act)
    subject <- append(subject, sub)
  }
}

# Generate result
result <- cbind(meanList,subject,activity)
write.table(result,file=paste(baseDir,"mean_per_activity_and_subject.csv",sep='/'),sep=",",row.names=F)


