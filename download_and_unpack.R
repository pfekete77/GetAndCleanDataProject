fileUrl <- "http://d396qusza40orc.cloudfront.net/"
fileName <- "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataDir <- "./data/"
if (!file.exists(dataDir)) {
  file.create(dataDir)
}
download.file(paste(fileUrl,fileName,sep=""),
              destfile=paste(dataDir,fileName,sep=""),
              method="auto")

unzip(paste("./data/",fileName,sep=""),
      overwrite = TRUE)
