get_subject_train<-function(filename) {
  result <- read.table(filename,
                       sep=" ",
                       header=FALSE)
}

get_x_train<-function(filename) {
  library(LaF)
  cols <- rep(16,561)
  laf <- laf_open_fwf(filename, 
                      column_widths = cols, 
                      column_types=rep("numeric", length(cols)))
  result <- laf[,]
}

get_y_train<-function(filename) {
  result <- read.table(filename,
                       sep=" ",
                       header=FALSE)
}

get_subject_test<-function(filename) {
  result <- read.table(filename,
                       sep=" ",
                       header=FALSE)
}

get_x_test<-function(filename) {
  library(LaF)
  cols <- rep(16,561)
  laf <- laf_open_fwf(filename, 
                      column_widths = cols, 
                      column_types=rep("numeric", length(cols)))
  result <- laf[,]
}

get_y_test<-function(filename) {
  result <- read.table(filename,
                       sep=" ",
                       header=FALSE)
}