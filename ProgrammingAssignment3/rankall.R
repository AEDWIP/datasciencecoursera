
#rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outComeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data <- outComeData[, c('State', 'Hospital.Name', outComeColName)]
  
  ## Check that  outcome are valid
  if ("heart attack" == outcome) {
    outComeColName <- 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack'
    outComeColIndex <- which (colnames(outComeData) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")
    # the values might have strings like "not avalible" we need to convert. 
    # generates warning: NAs introduced by coercion 
    outComeData[, outComeColIndex] <- as.numeric(outComeData[, outComeColIndex])
    orderedData <- data[ with(data, order( State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, Hospital.Name)) ,]

  } else if ("heart failure" == outcome) {
    outComeColName <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    outComeColIndex <- which (colnames(outComeData) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")
    orderedData <- data[ with(data, order( State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Hospital.Name)) ,]
    # the values might have strings like "not avalible" we need to convert. 
    # generates warning: NAs introduced by coercion 
    outComeData[, outComeColIndex] <- as.numeric(outComeData[, outComeColIndex])
  } else if ("pneumonia" == outcome) {
    outComeColName <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    outComeColIndex <- which (colnames(outComeData) == "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    # the values might have strings like "not avalible" we need to convert. 
    # generates warning: NAs introduced by coercion 
    outComeData[, outComeColIndex] <- as.numeric(outComeData[, outComeColIndex])
    orderedData <- data[ with(data, order( State, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, Hospital.Name)) ,]
  } else {
    emsg <- sprintf("Error in rankall(\"%s\", \"%s\") : invalid outcome", outcome, num)
    stop(emsg)
  }
  
 
  
  ## For each state, find the hospital of the given rank
  groupedByState <- split(orderedData, orderedData$State)
  #numStates <- length(groupedByState)
  #for (i = 1; i < numStates; i++)
  
  
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
#}
