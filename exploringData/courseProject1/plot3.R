
#
# Andy@SantaCruzIntegration.com
# course project 1, plot 3
#

source("loadData.R")
#png("plot3.png", width = 480, height = 480, bg="grey")

par(bg="grey")


# add the data but do not plot it yet
plot(febData$timeStamp, febData$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n") 

legend("topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lwd=1, col=c("black", "red", "blue"))

# take the data  and joining the corresponding points with line segments.
lines(febData$timeStamp, febData$Global_active_power)

#dev.off() # flush and close file
