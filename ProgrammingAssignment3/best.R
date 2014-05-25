
#
# args:
#   state: 
#       a 2 char abrivation for each state
#   outcome:
#       "heart attack", "heart failure", or "pneumonia".
#
# returns:
#   a character vector with the name of the hospital that has the best 
#   (i.e. lowest) 30-day mortality for the specified outcome in that state.
#
#   Hospitals that do not have data on a particular
#   outcome should be excluded from the set of hospitals when deciding the rankings.
#
#   if several hospitals are tied for best, return the hospital that comes first alphabetically
#
best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  listOfStates <- unique(data$State)
  validState <- any(listOfStates == state)
  if (!validState) {
    emsg <- sprintf("Error: argument state = %s is invalid", state) 
    stop(emsg)
  }
  
  # outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  # outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  # outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  colIndex <- 0;
  if ("heart attack" == outcome) {
    colIndex <- which (colnames(outcome) == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")
  }
  else if ("heart failure" == outcome) {
    colIndex <- which (colnames(outcome) == "outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")
  } else if ("pneumonia" == outcome) {
    colIndex <- which (colnames(outcome) == "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  }
  else {
    emsg <- sprintf("Error: argument outcome = %s is invalid must be {heart failure, heart attack, pneumonia}", outcome) 
    stop(emsg)
  }
  
 
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
}
