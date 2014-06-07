# 
# fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
# download.file(fileURL, destfile="./data/Frestaurants.xml", method="curl")
# list.files("./data")

#install.packages('XML')
library(XML)
doc <- xmlTreeParse("./data/Frestaurants.xml", useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

#How many restaurants have zipcode 21231?
# xpathSApply(rootNode, "/response/row/row/zipcode", xmlValue)
# xpathSApply(rootNode, "//zipcode", xmlValue)
xpathSApply(rootNode, "//zipcode", xmlValue)

zipCodes[zipCodes == "21231"]
