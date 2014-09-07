
#
# Andy@SantaCruzIntegration.com
# course project 1, plot 1
#

source("loadData.R")
png("plot1.png", width = 480, height = 480, bg="grey")
hist(febData$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off() # flush and close file
