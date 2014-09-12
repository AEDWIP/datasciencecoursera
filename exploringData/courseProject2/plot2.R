#
# Exploring Data
# course project 2
# Andy@SantaCruzIntegration.com
#

#
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == 24510) from 1999 to 2008? Use the base plotting system to make a plot
# answering this question. 
#

#setwd("~/workSpace/datasciencecoursera/johnsHopkinsUniv/datasciencecoursera.git/exploringData/courseProject2")

if (!exists("NEI")) {
  source("loadData.R") # this can take while
}

#
# select data for Baltimore City
#
data <- NEI[NEI$fips == "24510", ]
groupByYears <- split(data, data$year)
emissionTotals <- sapply(groupByYears, function(x){sum(x$Emissions)})
xData <- names(emissionTotals)
yData <- as.vector(emissionTotals)

# begin graph operations
png("plot2.png", width = 480, height = 480)
plot(
  x = xData, 
  y = yData,
  xlab = "year",
  ylab = "emission total", 
  type="n" # do not graph yet
)

# join the corresponding points with line segments.
lines(xData, yData)

title(main=" Baltimore City, Maryland")

dev.off() # flush and close file
