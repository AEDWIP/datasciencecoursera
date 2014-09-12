#
# Exploring Data
# course project 2
# Andy@SantaCruzIntegration.com
#

#
#Across the United States, how have emissions from coal combustion-related
#sources changed from 1999–2008?
#

setwd("~/workSpace/datasciencecoursera/johnsHopkinsUniv/datasciencecoursera.git/exploringData/courseProject2")

if (!exists("NEI")) {
  source("loadData.R") # this can take while
}

#
# select data
#

#
# 1: find the SCC char strings that corespond to the coal combustion
#

i <- grep (
  pattern = "coal",
  x = SCC$Short.Name,
  ignore.case = TRUE,
  value = TRUE
)

#
# find all the matches
#
l <- SCC$Short.Name == i
ll <- which(l) # get index for rows we want
SCCIndex <- SCC[ll, "SCC"]

data <- NEI[NEI$SCC == as.character(SCCIndex), ]

groupByYears <- split(data, data$year)
emissionTotals <- sapply(groupByYears, function(x){sum(x$Emissions)})
#
# begin graph ggplot2 operations 
#
library(ggplot2)
png("plot4.png", width = 480, height = 480)

pData <- data.frame(year = as.numeric(names(groupByYears)), emissionTotals = emissionTotals)
p <- qplot(x = year,
           y = emissionTotals,
           data = pData,
           geom = "line"
)
#p <- p + geom_line(color="red")
p <- p + ggtitle("emissions from coal combustion-related")
p + ylab("total emissions")


dev.off() # flush and close file
