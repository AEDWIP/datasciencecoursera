
#
# Andy@SantaCruzIntegration.com
# course project 1, plot 2
#

source("loadData.R")
png("plot2.png", width = 480, height = 480, bg="grey")

par(bg="grey")

# add the data but do not plot it yet
plot(febData$timeStamp, febData$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n") 

# take the data  and joining the corresponding points with line segments.
lines(febData$timeStamp, febData$Global_active_power)

dev.off() # flush and close file
