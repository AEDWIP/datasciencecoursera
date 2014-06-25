
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

# read data
acsDF <- read.csv(dataFile)

# Apply strsplit() to split all the names of the data frame on the characters
# "wgtp". What is the value of the 123 element of the resulting list?

t <- strsplit(names(acsDF), "wgtp")

# > print(t[123])
# [[1]]
# [1] ""   "15"
# 
# > 