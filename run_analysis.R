source(file.path("create_file_names_vars.R"))
source("data_readers.R")

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
means <- lapply(merged_test_and_train[,1:561],mean)
std_devs <- lapply(merged_test_and_train[,1:561],sd)

# 3. Uses descriptive activity names to name the 
#    activities in the data set
colnames(test_and_train_data)[563] <- "activity_id"
test_and_train <- merge(test_and_train_data,
                        activity_labels,
                        by.x="activity_id",
                        by.y="V1")
test_and_train_data <- test_and_train_data[,2:564]

# 4. Appropriately labels the data set with 
#    descriptive variable names. 


colnames(test_and_train_data) <- make.names(features[,2],unique=TRUE)
colnames(test_and_train_data)[562] <- "subject"
colnames(test_and_train_data)[563] <- "activity"

# 5. From the data set in step 4, creates a second, 
#    independent tidy data set with the average of 
#    each variable for each activity and each subject.
TTgrouped <- group_by(test_and_train_data,subject,activity)
data_averages <- summarise_each(TTgrouped,funs(mean))
