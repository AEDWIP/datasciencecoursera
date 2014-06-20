
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

# Create a logical vector that identifies the households on greater than 10 acres who 
# sold more than $10,000 worth of agriculture products. Assign that logical vector to the 
# variable agricultureLogical. Apply the which() function like this to identify the rows 
# of the data frame where the logical vector is TRUE. which(agricultureLogical) What are 
# the first 3 values that result?


# ACR 1
# Lot size
# b .N/A (GQ/not a one-family house or mobile home)
# 1 .House on less than one acre
# 2 .House on one to less than ten acres
# 3 .House on ten or more acres

# AGS 1
# Sales of Agriculture Products
# b .N/A (less than 1 acre/GQ/vacant/
#           .2 or more units in structure)
# 1 .None
# 2 .$ 1 - $ 999
# 3 .$ 1000 - $ 2499
# 4 .$ 2500 - $ 4999
# 5 .$ 5000 - $ 9999
# 6 .$10000+

tmp <- which(acs$ACR == 3 & acs$AGS == 6)
print(tmp[1:3])
# [1] 125 238 262
