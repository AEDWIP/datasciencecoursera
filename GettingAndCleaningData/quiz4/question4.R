
# download data
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
dataDir <- "data/"
dataFile <- sprintf("%s%s", dataDir, "FGDP.csv")
if (!file.exists(dataDir)) { dir.create(dataDir)}
if (!file.exists(dataFile)) {
  download.file(fileURL, destfile=dataFile, method="curl")
  dateDownLoaded <- date()
  write(dateDownLoaded, file=sprintf("%s%s", dataDir, "dateDownLoaded.txt"))
}

# read data
fgdp <- read.csv(dataFile)


 
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
dataDir <- "data/"
dataFile <- sprintf("%s%s", dataDir, "getdata-data-EDSTATS_Country.csv")
if (!file.exists(dataDir)) { dir.create(dataDir)}
if (!file.exists(dataFile)) {
  download.file(fileURL, destfile=dataFile, method="curl")
  dateDownLoaded <- date()
  write(dateDownLoaded, file=sprintf("%s%s", dataDir, "dateDownLoaded.txt"))
}

# read data
fsstatscountry <- read.csv(dataFile)


#
# Match the data based on the country shortcode. Of the countries for which 
# the end of the fiscal year is available, how many end in June? 
# 

mergedData <- merge(fgdp, fsstatscountry, by.x="X", by.y="CountryCode")

# > grep("Fiscal year end: June", mergedData$Special.Notes)
# [1]  11  18  31  58  74 102 109 157 164 179 189 206 224
# > length(grep("Fiscal year end: June", mergedData$Special.Notes))
# [1] 13
# > 

print("13 countries have fiscal year end in June")
