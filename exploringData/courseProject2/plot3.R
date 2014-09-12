#
# Exploring Data
# course project 2
# Andy@SantaCruzIntegration.com
#

#
# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999–2008 for Baltimore City? Which have seen increases in
# emissions from 1999–2008? Use the ggplot2 plotting system to make a plot
# answer this question.
#

#setwd("~/workSpace/datasciencecoursera/johnsHopkinsUniv/datasciencecoursera.git/exploringData/courseProject2")

if (!exists("NEI")) {
  source("loadData.R") # this can take while
}

#
# select data for Baltimore City
#
# > unique(data$type)
# [1] "POINT"    "NONPOINT" "ON-ROAD"  "NON-ROAD"

data <- NEI[NEI$fips == "24510", ]

library(plyr)
totals <- ddply(data, c("year", "type"), summarize, totalEmission = sum(Emissions))

#
# begin graph ggplot2 operations 
#
library(ggplot2)
png("plot3.png", width = 480, height = 480)
p <- qplot(x = year,
      y = totalEmission,
      data = totals,
      color = type,
      geom = "line"
      )

p <- p + ggtitle("Total emissions by type for Baltimore")
p + ylab("total emissions")

dev.off() # flush and close file

