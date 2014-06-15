setwd("C:/Users/Fredrik/Documents/Getting and Cleaning Data/Getting-and-Cleaning-Data-Project")

install.packages("plyr")

features = read.table("UCI HAR Dataset/features.txt")
head(features)
tail(features)
nrow(features) # 561
ncol(features) # 2

labels = read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("label_id","label"))
head(labels)
nrow(labels) # 6
ncol(labels) # 2


# train

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
head(y_train)
nrow(y_train) # 7352
ncol(y_train) # 1
min(y_train) # 1
max(y_train) # 6

X_train = read.table("UCI HAR Dataset/train/X_train.txt", col.names=features[,2])
head(X_train,1)
nrow(X_train) # 7352
ncol(X_train) # 561

subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
head(subject_train)
tail(subject_train)
nrow(subject_train) # 7352
ncol(subject_train) # 1
min(subject_train) # 1
max(subject_train) # 30

y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
head(y_test)
nrow(y_test) # 2947
ncol(y_test) # 1
min(y_test) # 1
max(y_test) # 6

X_test = read.table("UCI HAR Dataset/test/X_test.txt", col.names=features[,2])
head(X_test,1)
nrow(X_test) # 2947
ncol(X_test) # 561

subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
head(subject_test)
tail(subject_test)
nrow(subject_test) # 2947
ncol(subject_test) # 1
min(subject_test) # 1
max(subject_test) # 24

mean_std_columns <- features[grepl("mean\\(\\)",features[,2]) | grepl("std\\(\\)",features[,2]),]

X_train_info <- X_train[, mean_std_columns[,1]] 
head(X_train_info,1)

X_train_info$y <- y_train[,]
head(X_train_info,1)
nrow(X_train_info)

X_test_info <- X_test[, mean_std_columns[,1]] 
head(X_test_info,1)

X_test_info$y <- y_test[,]
head(X_test_info,1)
nrow(X_test_info)

# Add datasets

m <- merge(X_train_info, labels, by.x="y", by.y="label_id")
head(m,5)
nrow(m) # 7352


X_train$subject <- subject_train


grepl("mean()",c("tBodyAcc-mean()-X","ghjghj"))
features[,2]

features[grepl("mean\\(\\)",features[,2]) | grepl("std\\(\\)",features[,2]),]
grepl("mean()",features[,2])






# Get features and labels
features = read.table("UCI HAR Dataset/features.txt")
labels = read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("label_id","label"))

# Merge train and test
install.packages("plyr")
library(plyr)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_all <- ldply(c("y_train", "y_test"), 
               function(dn) data.frame(get(dn)))

X_train = read.table("UCI HAR Dataset/train/X_train.txt", col.names=features[,2])
X_test = read.table("UCI HAR Dataset/test/X_test.txt", col.names=features[,2])
X_all <- ldply(c("X_train", "X_test"), 
               function(dn) data.frame(get(dn)))

# Get mean and std columns
mean_std_columns <- features[grepl("mean\\(\\)",features[,2]) | grepl("std\\(\\)",features[,2]),]
X_all_info <- X_all[, mean_std_columns[,1]] 

# Merge X_all_info with y
X_all_info$y <- y_all[,]
head(X_all_info, 1)

# Get descriptive activity names 
m <- merge(X_all_info, labels, by.x="y", by.y="label_id")
head(m)


