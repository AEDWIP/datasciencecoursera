
# Download the Excel spreadsheet on Natural Gas Aquisition Program here: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 
# 
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
#   dat 
# 
# What is the value of:
#   sum(dat$Zip*dat$Ext,na.rm=T) 


# fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
# download.file(fileURL, destfile="./data/GasAquisitionProgData.xlsx", method="curl")
# list.files("./data")
## record down load date and time
# > dateDownLoaded <- date()
# > dateDownLoaded
# [1] "Sat Jun  7 11:01:52 2014"


# install.packages("xlsx")
library(xlsx)
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("./data/GasAquisitionProgData.xlsx", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)
answer <- sum(dat$Zip*dat$Ext,na.rm=T) 
