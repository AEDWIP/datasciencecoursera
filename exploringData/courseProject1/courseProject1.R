
# first just read the first 10 rows to see if read.table args are correct
# allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 100 )
allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

#
# by default allData$Date and allData$Time are treated like factor
# we only want data from  2007-02-01 and 2007-02-02
#  we do not care about $Time

#allData$Date <- as.Date(allData$Date)

timeStamp <- paste(allData$Date, allData$Time)
allData$timeStamp <- strptime(timeStamp, format="%d/%m/%Y %H:%M:%S")
#y <- strptime(x, format="%d/%m/%Y %H:%M:%S")
#begin <- strptime("16/12/2006 17:48:00", format="%d/%m/%Y %H:%M:%S") # index 25
#end <- strptime("16/12/2006 18:16:00", format="%d/%m/%Y %H:%M:%S") # index 53
#z <- y[ (y <= begin) & (y <= end) ] 

begin <- strptime("01/02/2006 00:00:00", format="%d/%m/%Y %H:%M:%S")
end <- strptime("01/03/2006 00:00:00", format="%d/%m/%Y %H:%M:%S") 
febData <- allData[(allData$timeStamp >= begin) & (allData$timeStamp < end) ,]
