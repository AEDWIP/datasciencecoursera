#
# Andy@SantaCruzIntegration.com
# course project 1
#

#
# down load data if needed
#

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

dataDir <- "data/"
zipDataFile <- sprintf("%s%s", dataDir, "household_power_consumption.zip")
dataFileName <- "household_power_consumption.txt"
dataFilePath <- sprintf("%s%s", dataDir, dataFileName)

if (!file.exists(dataDir)) { dir.create(dataDir)}
if (!file.exists(zipDataFile)) {
  download.file(fileURL, destfile=zipDataFile, method="curl")
  unzip(zipDataFile, exdir=dataDir)
  dateDownLoaded <- date()
  # record when data was down loaded
  write(dateDownLoaded, file=sprintf("%s%s", dataDir, "dateDownLoaded.txt"))
}

#
# read all the data
#
allData <- read.table(dataFilePath, header = TRUE, sep = ";", na.strings="?")

#
# by default allData$Date and allData$Time are treated like factor
# we only want data from  2007-02-01 and 2007-02-02
#  we do not care about $Time
# create a 'timeStamp' column. so we can select the date range we are interested in 
#

# allData$Date <- as.Date(allData$Date)

timeStamp <- paste(allData$Date, allData$Time)
allData$timeStamp <- strptime(timeStamp, format="%d/%m/%Y %H:%M:%S")

#
# select data for days 2/1/07 and 2/2/07
#

#y <- strptime(x, format="%d/%m/%Y %H:%M:%S")
#begin <- strptime("16/12/2006 17:48:00", format="%d/%m/%Y %H:%M:%S") # index 25
#end <- strptime("16/12/2006 18:16:00", format="%d/%m/%Y %H:%M:%S") # index 53
#z <- y[ (y <= begin) & (y <= end) ] 

begin <- strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
end <- strptime("03/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S") 
febData <- allData[(allData$timeStamp >= begin) & (allData$timeStamp < end) ,]

# 
# some one posted this solution much simpler
# hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", 
#                 stringsAsFactors=FALSE)
# hpc2 <- hpc[min(which(hpc$Date == "1/2/2007")):max(which(hpc$Date == "2/2/2007")),]
#

rm(allData, timeStamp, begin, end) # clean up memory

#
# merge all the sub-metering data into a single col
# use a factor to identify meter 1, 2, and 3
# we'll need this in plot 3 and 4
#

levels <- c("s1", "s2", "s3")
name <- c("sub_metering", "timeStamp", "meterNum")

sm1 <- data.frame(febData$Sub_metering_1, febData$timeStamp, factor(rep("s1", nrow(febData)), levels))
names(sm1) <- name;

sm2 <- data.frame(febData$Sub_metering_2, febData$timeStamp, factor(rep("s2", nrow(febData)), levels))
names(sm2) <- name;

sm3 <- data.frame(febData$Sub_metering_3, febData$timeStamp, factor(rep("s3", nrow(febData)), levels))
names(sm3) <- name;

plotData <- rbind(sm1, sm2, sm3)

