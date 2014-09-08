

#
# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a 
# specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 
# 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the
# directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, 
# ignoring any missing values coded as NA. A prototype of the function is as follows
#
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  # create a list we use to accumlate the all the data we want to the mean of
  # it would be easier to just keep track of the running total and number if items
  # http://stackoverflow.com/questions/20689650/how-to-append-rows-to-an-r-data-frame  
  #n <- length(id)
  #df <- data.frame(x = numeric(1000), y = character(1000), stringsAsFactors = FALSE)
  total <- 0
  n <- 0
  for( i in id) {
    tmp <- getData(directory, i)
    tmp <- removeNa(tmp)
    #print(tmp)
    s <- sum(as.numeric(tmp[,pollutant])) # the pollutant data is "character"
    total <- total + s
    l <-  length(tmp[, pollutant])
    n <- n + l
    #print(sprintf("s: %s    ttotal: %s     l: %s     n: %s", s, total, l, n))
  }
  
  return( total / n )
}

getData <- function (directory, i) {
  baseName <- sprintf("%03d", i)     # make sure the id is of the format 001.csv
  fileName <- paste( directory, "/", baseName, ".csv", sep="" )
  #print( fileName )
  data <- read.csv( fileName, colClasses = "character" )
  return(data)
}

removeNa <- function(data, pollutant) {
  good <- complete.cases(data[pollutant]) # returns logic vector, true if row is complete
  data[good, ] # return only the complete rows
}

