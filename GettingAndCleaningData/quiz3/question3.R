
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

# data.frames are slower than data.tables. say use data.frame. Lets see if table work
#library(data.table)

# Gross.domestic.product.2012 has text in it. By default read.csv will turn this into a factor
# it is not going to sort correctly. Could use read.csv(stringsAsFactors=FALSE) then col will be
# a char,

#FGDB_DF <- read.csv(dataFile, stringsAsFactors=FALSE) #Gross.domestic.product.2012 is char not num
#as.numeric(FGDB_DF$Gross.domestic.product)
FGDB_DF <- read.csv(dataFile)
FGDB_DF$Gross.domestic.product.2012 <- as.numeric(as.character(FGDB_DF$Gross.domestic.product.2012))
#as.numeric(levels(FGDB_DF$Gross.domestic.product.2012))[as.integer(FGDB_DF$Gross.domestic.product.2012)]
#FGDB <- data.table(FGDB_DF)
#rm(FGDB_DF) # save space


fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
dataDir <- "data/"
dataFile <- sprintf("%s%s", dataDir, "getdata-data-EDSTATS_Country.csv")
if (!file.exists(dataDir)) { dir.create(dataDir)}
if (!file.exists(dataFile)) {
  download.file(fileURL, destfile=dataFile, method="curl")
  dateDownLoaded <- date()
  write(dateDownLoaded, file=sprintf("%s%s", dataDir, "dateDownLoaded.txt"))
}

country_DF <- read.csv(dataFile)
#country <- data.table(country_DF)
#rm(country_DF) # save space

# Match the data based on the country shortcode. How many of the IDs match? Sort 
# the data frame in descending order by GDP rank (so United States is last). What is 
# the 13th country in the resulting data frame? 

#country$CountryCode
#country_DF$Short.name

#FGDB_DF$X

# merge by.x and by.y does not work for tables (use data frame)
#mergedData <- merge(country_DF, FGDB_DF, by.x="Short.Name", by.y="X.2", all=TRUE)
mergedData <- merge(country_DF, FGDB_DF, by.x="Short.Name", by.y="X.2")
#answer <- mergedData[, c("Short.Name", "Gross.domestic.product.2012")]
#with(answer, order(answer, Gross.domestic.product.2012, decreasing=TRUE))

library(plyr)
arrangedMergedData <- arrange(mergedData, desc(Gross.domestic.product.2012))
answer <- arrangedMergedData[, c("Short.Name", "Gross.domestic.product.2012")]


#
# AEDWIP answer is 189, St. Kitts and Nevis

#
# question 4 
# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
#
# > str(mergedData$Income.Group)
# Factor w/ 6 levels "","High income: nonOECD",..: 4 6 6 6 2 5 6 6 5 2 ...
# > 
# tidyM <- ddply(M, c("subjectId", "activity"), colwise(mean))
t4 <- ddply(arrangedMergedData[, c("Gross.domestic.product.2012", "Income.Group")], c("Income.Group"), colwise(mean))


