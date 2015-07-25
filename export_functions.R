export_codebook <- function(outputFile,data_averages) {
  fileConn<-file(outputFile)
  output <- c()
  for (i in 1:length(colnames(data_averages))) {
    colName <- colnames(data_averages[,i])
    output <- c(output,colName,"\r\n","\t")
    if (colName=="subject") {
      output <- c(output,"Number identifying unique subject in trials.")
    } else if (colName=="activity") {
      output <- c(output,"Name of activity")
    } else if (substr(colName,start=1,stop=4)=="AVG_") {
      output <- c(output,
                  "Average of '",
                  substr(colName,start=5,stop=100),
                  "' variable in original data set.")
    } else {
      output <- c(output,"Average of measured variable")
    }
    output <- c(output,"\r\n")
    output <- c(output,"\r\n")
    cat(output,file=outputFile,sep="")
  }
  #writeLines(colnames(data_averages), fileConn)
  close(fileConn)
}

export_data_set <- function(outputFile,data_set) {
  write.table(data_set, 
              file = outputFile,
              row.names=FALSE)
}