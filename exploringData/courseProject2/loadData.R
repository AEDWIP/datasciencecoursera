#
# Exploring Data
# course project 2
# Andy@SantaCruzIntegration.com
#

#
# download data 
#
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
dataDir <- "data/"
dataFile <- sprintf("%s%s", dataDir, "Dataset.zip")
if (!file.exists(dataDir)) { 
  dir.create(dataDir)
}

if (!file.exists(dataFile)) {
  download.file(fileURL, destfile=dataFile, method="curl")
  unzip(dataFile, exdir=dataDir)
  dateDownLoaded <- date()
  write(dateDownLoaded, file=sprintf("%s%s", dataDir, "dateDownLoaded.txt"))
}

NEIFile <- sprintf("%s%s", dataDir, "summarySCC_PM25.rds")
NEI <- readRDS(NEIFile)
SCCFile <- sprintf("%s%s", dataDir, "Source_Classification_Code.rds")
SCC <- readRDS(SCCFile )
