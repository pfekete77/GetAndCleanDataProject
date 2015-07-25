source("create_file_names_vars.R")
source("data_readers.R")
source("download_and_unpack.R")

activity_labels <- read.fwf(activity_labels_file,widths=c(2,20))
features <- read.csv(features_file,sep=" ",header=FALSE)

# Load the data from the files
subject_train <- get_subject_train(subject_train_file)
train_data_X <- get_x_train(train_data_X_file)
train_data_Y <- get_y_train(train_data_Y_file)

subject_test <- get_subject_test(subject_test_file)
test_data_X <- get_x_test(test_data_X_file)
test_data_Y <- get_y_test(test_data_Y_file)

# 1. Merges the training and the test sets to 
#    create one data set.

tmp1 <- cbind(test_data_X,subject_test)
tmp1 <- cbind(tmp1,test_data_Y)

tmp2 <- cbind(train_data_X,subject_train)
tmp2 <- cbind(tmp2,train_data_Y)

test_and_train_data <- rbind(tmp2,tmp1)


# 2. Extracts only the measurements on the mean 
#    and standard deviation for each measurement. 
means_columns <- grep("mean",features[,2])
sd_columns <- grep("std",features[,2])

desired_columns <- sort(c(means_columns,sd_columns,562,563))

test_and_train_data <- test_and_train_data[,desired_columns]



# 3. Uses descriptive activity names to name the 
#    activities in the data set
colnames(test_and_train_data)[length(desired_columns)] <- "activity_id"
test_and_train_data <- merge(test_and_train_data,
                        activity_labels,
                        by.x="activity_id",
                        by.y="V1")
test_and_train_data <- test_and_train_data[,2:(length(desired_columns)+1)]

# 4. Appropriately labels the data set with 
#    descriptive variable names. 


colnames(test_and_train_data) <- make.names(features[desired_columns,2],unique=TRUE)
colnames(test_and_train_data)[length(desired_columns)-1] <- "subject"
colnames(test_and_train_data)[length(desired_columns)] <- "activity"

# 5. From the data set in step 4, creates a second, 
#    independent tidy data set with the average of 
#    each variable for each activity and each subject.
TTgrouped <- group_by(test_and_train_data,subject,activity)
data_averages <- summarise_each(TTgrouped,funs(mean))

colCount <- length(colnames(data_averages))
for (i in 3:colCount) {
  colnames(data_averages)[i] <-
    paste("AVG_",colnames(data_averages[i]),sep="")
}

outputFile <- "CodeBook.md"
source("export_functions.R")
export_codebook(outputFile,data_averages)
export_data_set("data_averages.txt",data_averages)
