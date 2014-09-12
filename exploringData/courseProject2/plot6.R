#
# Exploring Data
# course project 2
# Andy@SantaCruzIntegration.com
#

# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == 06037).
# Which city has seen greater changes over time in motor vehicle emissions?

#setwd("~/workSpace/datasciencecoursera/johnsHopkinsUniv/datasciencecoursera.git/exploringData/courseProject2")


if (!exists("NEI")) {
  source("loadData.R") # this can take while
}

la <- "06037"
ba <- "24510"

data <- NEI[NEI$fips == la | NEI$fips == ba ,]
data$fips <- as.factor(data$fips)
#data$fips <- as.factor(data$fips, levels =c("L.A.", "Baltimore"))
#data$fips <- as.factor(data$fips, levels =  c("L.A.", "Baltimore"), labels = levels)
levels(data$fips) <- c("L.A.", "Baltimore")
pData <- ddply(data, c("year", "fips"), summarize, totalEmission = sum(Emissions))

library(ggplot2)
png("plot6.png", width = 480, height = 480)

p <- qplot(x = year,
           y = totalEmission,
           data = pData,
           color = fips,
           geom = "line"
)
p <- p + ggtitle("emissions from motor vehicle")
p + ylab("total emissions")


dev.off() # flush and close file
