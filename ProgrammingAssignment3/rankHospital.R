
#
# args:
#   state: 
#       a 2 char abrivation for each state
#   outcome:
#       "heart attack", "heart failure", or "pneumonia".
#   num:
#      ranking: a number, "best" or "worst"
#
# returns:
#     a character vector with the name of the hospital that has the ranking specifed 
#     by the num argument.
#


rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  outComeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  listOfStates <- unique(outComeData$State)
  validState <- any(listOfStates == state)
  if (!validState) {
    emsg <- sprintf("Error in rankhospital(\"%s\", \"%s\ \"%s\") : invalid state", state, outcome, num)
    stop(emsg)
  }
  
  #
  # select the state data frame
  #
  
  # the values might have strings like "not avalible" we need to convert. 
  #outComeData[, outComeColIndex] <- as.numeric(outComeData[, outComeColIndex])
  
  groupedByState <- split(outComeData, outComeData$State)
  stateIndex <- which(names(groupedByState) == state)
  dataForState <- groupedByState[[stateIndex]] # [[5]] returns the fith element from the list
  
  outComeColIndex <- 0;
  outComeColName <- "AEDWIP"
  if ("heart attack" == outcome) {
    outComeColName <- 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack'
    outComeColIndex <- which (colnames(outComeData) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")
    sortedDataForState <- dataForState[with(dataForState, order(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, Hospital.Name)),]
  } else if ("heart failure" == outcome) {
    outComeColName <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    outComeColIndex <- which (colnames(outComeData) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")
    sortedDataForState <- dataForState[with(dataForState, order(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Hospital.Name)),]
  } else if ("pneumonia" == outcome) {
    outComeColName <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    outComeColIndex <- which (colnames(outComeData) == "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    sortedDataForState <- dataForState[with(dataForState, order(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, Hospital.Name)),]
  } else {
    emsg <- sprintf("Error in rankhospital(\"%s\", \"%s\ \"%s\") : invalid outcome", state, outcome, num)
    stop(emsg)
  }
  
 
  ## Return hospital name in that state with the given rank
  if (is.numeric(num) && num > nrow(sortedDataForState)) {
    return(NaN)
  } else if (is.numeric(num) && num < nrow(sortedDataForState)) {
    hospital <- sortedDataForState[num,]
  } else if ("best" == num) {
    hospital <- sortedDataForState[1,]    
  } else if ("worst" == num) {
    worst <- nrow(sortedDataForState)
    hospital <- sortedDataForState[worst,]    
  } else {
    emsg <- sprintf("Error in rankhospital(\"%s\", \"%s\ \"%s\") : invalid num", state, outcome, num)
    stop(emsg)
  }
  
  ret <- hospital$Hospital.Name
  
  
#   > sortedDataForState[1:5 ,c('Hospital.Name', 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure')]
#   Hospital.Name Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
#   3996  HARRIS COUNTY HOSPITAL DISTRICT                                                       10.0
#   3964   PECOS COUNTY MEMORIAL HOSPITAL                                                       10.0
#   4190 ROLLINS BROOK COMMUNITY HOSPITAL                                                       10.0
#   4155        SETON  NORTHWEST HOSPITAL                                                       10.0
#   4096       EL CAMPO MEMORIAL HOSPITAL                                                       10.1
#   >   
  
  ## 30-day death rate
  
  ret
}