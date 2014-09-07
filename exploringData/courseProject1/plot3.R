
#
# Andy@SantaCruzIntegration.com
# course project 1, plot 3
#

source("loadData.R")

#
# graph the data
#

png("plot3.png", width = 480, height = 480, bg="grey")

par(bg="grey")
plot(plotData$timeStamp, plotData$sub_metering, type='n', xlab="", ylab="Energy sub metering")
lines(plotData$timeStamp[plotData$meterNum == "s1"], plotData$sub_meter[plotData$meterNum == "s1"], type = "l", col = "black")
lines(plotData$timeStamp[plotData$meterNum == "s2"], plotData$sub_meter[plotData$meterNum == "s2"], type = "l", col = "red")
lines(plotData$timeStamp[plotData$meterNum == "s3"], plotData$sub_meter[plotData$meterNum == "s3"], type = "l", col = "blue")

legend("topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lwd=1, col=c("black", "red", "blue"))

dev.off() # flush and close file
