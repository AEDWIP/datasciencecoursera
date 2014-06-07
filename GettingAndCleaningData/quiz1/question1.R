
#
# Question 1:
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 
# microdata survey about housing for the state of Idaho using download.file() from here: 
# 
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
# 
# and load the data into R. The code book, describing the variable names is here: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
# 
# How many housing units in this survey were worth more than $1,000,000?
#

# fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
# download.file(fileURL, destfile="./data/microDataHousingServeyIdaho.csv", method="curl")
# list.files("./data")

## record down load date and time
# > dateDownLoaded <- date()
# > dateDownLoaded
# [1] "Sat Jun  7 11:01:52 2014"

# data frames are slow trying using a data.table instead
#
#
# to install data.table package:
# install.packages("data.table")
#
library(data.table)
#
# could we use read.table ? in data.table
housingDataDF <- read.csv("./data/microDataHousingServeyIdaho.csv")
housingDataDT <- data.table(housingDataDF)

#
# delete the data frame to save memory
#
remove(housingDataDF)

# col "VAL" = 24 means house value was greater than 1,000,000
# sub setting cols with data.tables does not work the same way as data.frame

# by=VAL is similar to sql "group by"
# .N is similar to sql count
# we get back a data.table with two cols, val and N, N will be the number of rows where val = 
housingDataDT[, .N, by=VAL]


