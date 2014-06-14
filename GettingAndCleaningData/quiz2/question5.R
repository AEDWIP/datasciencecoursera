
# Read this data set into R and report the sum of the numbers in the fourth column. 
# 
# https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for 
# 
# Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for 

# (Hint this is a fixed width file format)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
dataDir <- "data/"
dataFile <- paste(dataDir, "data.for", "") # paste is really string concatenation
if (!file.exists(dataDir)) { dir.create(dataDir)}
if (!file.exists(dataFile)) {download.file(fileURL, destfile=dataFile, method="curl")}

# file appears to be tab delimited
#widths <- c(10, 8, 8, 8, 8) # I used $ less to view the file
widths=c(12, 7,4, 9,4, 9,4, 9,4) # http://stackoverflow.com/questions/14383710/read-fixed-width-text-file
data <- read.fwf(dataFile, widths, skip=4) # , header=TRUE, skip=2
answer <- sum(data[,4])