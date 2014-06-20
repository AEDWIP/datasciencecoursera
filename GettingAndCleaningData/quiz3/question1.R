
# download data

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
dataDir <- "data/"
dataFile <- sprintf("%s%s", dataDir, "AmericanCommunitySurvey.csv")
if (!file.exists(dataDir)) { dir.create(dataDir)}
if (!file.exists(dataFile)) {
  download.file(fileURL, destfile=dataFile, method="curl")
  dateDownLoaded <- date()
  write(dateDownLoaded, file=sprintf("%s%s", dataDir, "dateDownLoaded.txt"))
}

#
# read the source / original data traing and test data files
#

# data.frames are slower than data.tables. say use data.frame. Lets see if table work
library(data.table)
acsDF <- read.csv(dataFile)
acs <- data.table(acsDF)
