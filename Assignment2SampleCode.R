#
# Assignment 2 sample code
# '<<-' operator used to assign value to another environment

#
# to clear the console 
#   cat(\014")
#

#
# makeVector a like a java pojo
# When we create one of these we can pass the 'constructor' a numeric vector
# we can use set and get to get the numeric vector
#
# there are accessors getmean and setmean, and a mean data member how ever
# makeVector does not know how to calculate the mean
#
# cachemean know how to store/cache makeVector objects.
# it also know how to calculate the mean. It first checks to see if
# the makeVector object has already calculated the mean. if not it will calculate it
#
# example of use
#
# 0) cause this file to be loaded
#   SrcFile = connections.file("Assignment2SampleCode.R")
#   source(SrcFile verbose = TRUE)
#
# 1) create a numeric vector
#   myVector <- 1:3
# 
# 2) use makeVector to create a vector that can be cached
#   mv1 <- makeVector(v1)
#
# 3) use the following syntax to call one of the functions
# (makeVector is implemented as a list of function)
# call get
#   mv1$get()
#
# 4) create a cachemean object. It will calc the mean as call setmean for us
#   cachemean(mv1)
#
# 5) now we can get the mean
#   mv1$getmean()
#
makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}


