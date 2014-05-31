
#
# Write a function that reads a directory full of files and reports the number of completely observed cases
# in each data file. The function should return a data frame where the first column is the name of the file and the
# second column is the number of complete cases. 
#

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # create an empty data frame we'll add rows to
  ret <- data.frame( "id" =  character(0), "nobs" = numeric(0))
  
  #fileList <- list.files(directory)
  for (i in id) {
    data <- getData(directory, i)
    good <- complete.cases(data) # returns logic vector, true if row is complete
    goodData <- data[good, ] # return only the complete rows
    l <- nrow(goodData)
    newRowDF <- data.frame('id' = c(i), 'nobs' = c(l))
    ret <- rbind(ret, newRowDF)
    
    #print(sprintf("i: %s l: %s newRow %s ", i, l, newRow))
  }
  
  return(ret)
}

getData <- function (directory, i) {
  baseName <- sprintf("%03d", i)     # make sure the id is of the format 001.csv
  fileName <- paste( directory, "/", baseName, ".csv", sep="" )
  #print( fileName )
  data <- read.csv( fileName, colClasses = "character" )
  return(data)
}