#
# Exploring Data
# course project 2
# Andy@SantaCruzIntegration.com
#

#
# How have emissions from motor vehicle sources changed from 1999–2008 in
# Baltimore City?
#

#
# http://www.epa.gov/ttn/chief/net/2008inventory.html#inventorydoc 
# The NEI OnRoad and NonRoad data categories contain mobile sources which are estimated
# for the 2008 NEI v3 via the MOVES2010b and NONROAD models, respectively.
# NONROAD was run within the National Mobile Inventory Model (NMIM). Note that
# emissions data for aircraft, locomotives, and commercial marine vessels are
# NOT included in the NonRoad data category
#
setwd("~/workSpace/datasciencecoursera/johnsHopkinsUniv/datasciencecoursera.git/exploringData/courseProject2")

if (!exists("NEI")) {
  source("loadData.R") # this can take while
}

#
# select data for Baltimore City
#
# > unique(data$type)
# [1] "POINT"    "NONPOINT" "ON-ROAD"  "NON-ROAD"

data <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", c('Emissions', 'year')]

library(plyr)
totals <- ddply(data, c("year"), summarize, totalEmission = sum(Emissions))

library(ggplot2)
png("plot5.png", width = 480, height = 480)

p <- qplot(x = year,
           y = totalEmission,
           data = totals,
           geom = "line"
)
p <- p + ggtitle("emissions from motor vehicle in Baltimore")
p + ylab("total emissions")


dev.off() # flush and close file
