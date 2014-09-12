
#
# Exploring Data
# course project 2
# Andy@SantaCruzIntegration.com
#

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
plot(
  x = names(emissionTotals), 
  y = as.vector(emissionTotals),
  xlab = "year",
  ylab = "emission total"
  )

AEDWIP, connect with a line, add main, how to deal with y scale? should we use log(y)



