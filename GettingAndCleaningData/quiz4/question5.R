# You can use the quantmod (http://www.quantmod.com/) package to get historical 
# stock prices for publicly traded companies on the NASDAQ and NYSE. Use the 
# following code to download data on Amazon's stock price and get the times the 
# data was sampled.

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

# How many values were collected in 2012? How many values were collected on 
# Mondays in 2012?

library(lubridate)
beginPOSIX <- mdy("12/31/2011") # Ops.POSIXt
beginDate <- as.Date(beginPOSIX)
endPOSIX <- mdy("01/01/2013")
endDate <- as.Date(endPOSIX)

t <-  (beginDate < sampleTimes) & (sampleTimes < endDate)
tt <- sampleTimes[t]
print(sprintf("number of values collected in 2012 == %f", length(tt)))
msg <- sprintf("number values collected on monday 2012 == %f", length(tt[weekdays(tt) == "Monday"]))
print(msg)