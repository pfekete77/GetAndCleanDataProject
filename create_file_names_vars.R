data_dir <- "./data/UCI-HAR-Dataset"
activity_labels_file <- stringi::stri_join(data_dir,"/activity_labels.txt")
features_file <- stringi::stri_join(data_dir,"/features.txt")

train_dir <- stringi::stri_join(data_dir,"/train")
test_dir <- stringi::stri_join(data_dir,"/test")

inertial_signals <- "Inertial Signals"

subject_train_file <- stringi::stri_join(train_dir,"/subject_train.txt")
train_data_X_file <- stringi::stri_join(train_dir,"/X_train.txt")
train_data_Y_file <- stringi::stri_join(train_dir,"/y_train.txt")

subject_test_file <- stringi::stri_join(test_dir,"/subject_test.txt")
test_data_X_file <- stringi::stri_join(test_dir,"/X_test.txt")
test_data_Y_file <- stringi::stri_join(test_dir,"/y_test.txt")
