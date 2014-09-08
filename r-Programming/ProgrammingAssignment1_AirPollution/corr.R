
# 
# Write a function that takes a directory of data files and a threshold for
# complete cases and calculates the correlation between sulfate and nitrate for
# monitor locations where the number of completely observed cases (on all
# variables) is greater than the threshold. The function should return a vector
# of correlations for the monitors that meet the threshold requirement. If no
# monitors meet the threshold requirement, then the function should return a
# numeric vector of length 0. A prototype of this function follows
# 

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  ret <- vector("numeric")
  
  fileList <- list.files(directory)
  for (fileName in fileList) {
    
    #fileName <- "001.csv"
    # read the file
    fullFileName <- paste( directory, fileName, sep="/" )
    #print(fullFileName)
    data <- read.csv( fullFileName, colClasses = "character" )
    
    # get only rows that have all the data 
    good <- complete.cases(data) # returns logic vector, true if row is complete
    goodData <- data[good , ] # return only the complete rows
    
    # if number of observations is above the threshold calculate the correlation
    if (nrow(goodData) > threshold){
      cr <- cor(as.numeric(goodData[,"sulfate"]), as.numeric(goodData[,"nitrate"]))
      ret <- append(ret, cr)
    }
    
  }
  
  return(ret)
}
