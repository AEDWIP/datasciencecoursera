
#
# Exploring Data
# course project 2
# Andy@SantaCruzIntegration.com
#

#setwd("~/workSpace/datasciencecoursera/johnsHopkinsUniv/datasciencecoursera.git/exploringData/courseProject2")

#
# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008? Using the base plotting system, make a plot showing the total PM2.5
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#

# > unique(NEI$year)
# [1] 1999 2002 2005 2008
# > 

if (!exists("NEI")) {
  source("loadData.R") # this can take while
}

#
# calculate totals for each year and plot
#
groupByYears <- split(NEI, NEI$year)
emissionTotals <- sapply(groupByYears, function(x){sum(x$Emissions)})
xData <- names(emissionTotals)
yData <- as.vector(emissionTotals)

# begin graph operations
png("plot1.png", width = 480, height = 480)
plot(
  x = xData, 
  y = yData,
  xlab = "year",
  ylab = "emission total", 
  type="n" # do not graph yet
  )

# join the corresponding points with line segments.
lines(xData, yData)
dev.off() # flush and close file




