
rankAllBest <- function(dataForState, num, outComeColName) {
  # find the number of rows have data
  bad <- is.na(dataForState[outComeColName])
  numRows <- length(bad[bad == FALSE])
  
  if (is.numeric(num) && (num > numRows)) {
    return(NA)
  } else if (is.numeric(num) && (num <= numRows)) {
    hospital <- dataForState[num,]
  } else if ("best" == num) {
    hospital <- dataForState[1,]    
  } else if ("worst" == num) {
    worst <- numRows
    hospital <- dataForState[worst,]    
  } else {
    emsg <- sprintf("Error in rankAllBest(\"%s\") : invalid num", num)
    stop(emsg)
  }
  
  c(hospital$Hospital.Name, hospital$State)
}

#rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outComeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that  outcome are valid
  if ("heart attack" == outcome) {
    outComeColName <- 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack'
    outComeColIndex <- which (colnames(outComeData) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")
    # the values might have strings like "not avalible" we need to convert. 
    # generates warning: NAs introduced by coercion 
    outComeData[, outComeColIndex] <- as.numeric(outComeData[, outComeColIndex])
    
    data <- outComeData[, c('State', 'Hospital.Name', outComeColName)]
    orderedData <- data[ with(data, order( State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, Hospital.Name)) ,]

  } else if ("heart failure" == outcome) {
    outComeColName <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    outComeColIndex <- which (colnames(outComeData) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")
    # the values might have strings like "not avalible" we need to convert. 
    # generates warning: NAs introduced by coercion 
    outComeData[, outComeColIndex] <- as.numeric(outComeData[, outComeColIndex])
    
    data <- outComeData[, c('State', 'Hospital.Name', outComeColName)]
    orderedData <- data[ with(data, order( State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Hospital.Name)) ,]
   
  } else if ("pneumonia" == outcome) {
    outComeColName <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    outComeColIndex <- which (colnames(outComeData) == "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    # the values might have strings like "not avalible" we need to convert. 
    # generates warning: NAs introduced by coercion 
    outComeData[, outComeColIndex] <- as.numeric(outComeData[, outComeColIndex])
    
    data <- outComeData[, c('State', 'Hospital.Name', outComeColName)]
    orderedData <- data[ with(data, order( State, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, Hospital.Name)) ,]
  } else {
    emsg <- sprintf("Error in rankall(\"%s\", \"%s\") : invalid outcome", outcome, num)
    stop(emsg)
  }
  
 
  
  ## For each state, find the hospital of the given rank
  groupedByState <- split(orderedData, orderedData$State)
  ret <- sapply(groupedByState, rankAllBest, num, outComeColName)
  
  # strange we need to transpose ret to get the output formated as row vectors
  t(ret)
#}
  
