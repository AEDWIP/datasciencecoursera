#
# Andy@SantaCruzIntegration.com
# course project 1, plot 4
#

source("loadData.R")

#
# graph the data
#

png("plot4.png", width = 480, height = 480, bg="grey")

par(bg="grey")
par(mfrow = c(2, 2))

#
# add plot 2 in to upper left
#
# add the data but do not plot it yet
plot(febData$timeStamp, febData$Global_active_power, xlab="", ylab="Global Active Power", type="n") 

# take the data  and joining the corresponding points with line segments.
lines(febData$timeStamp, febData$Global_active_power)

#
# add voltage graph in upper left
#
plot(febData$timeStamp,febData$Voltage, xlab="datetime", ylab="Voltage", type="n")
lines(febData$timeStamp,febData$Voltage, pch="24")

#
# add plot 3 in lower left
#
plot(plotData$timeStamp, plotData$sub_metering, type='n', xlab="", ylab="Energy sub metering")
lines(plotData$timeStamp[plotData$meterNum == "s1"], plotData$sub_meter[plotData$meterNum == "s1"], type = "l", col = "black")
lines(plotData$timeStamp[plotData$meterNum == "s2"], plotData$sub_meter[plotData$meterNum == "s2"], type = "l", col = "red")
lines(plotData$timeStamp[plotData$meterNum == "s3"], plotData$sub_meter[plotData$meterNum == "s3"], type = "l", col = "blue")

legend("topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lwd=1, col=c("black", "red", "blue"))


#
# add global_reactive_power graph in lower right
#
#hist(febData$Global_reactive_power, breaks=100)
plot(febData$timeStamp,febData$Global_reactive_power, xlab="timestamp", ylab="Global_reactive_power", type="n")
lines(febData$timeStamp, febData$Global_reactive_power)
     
dev.off() # flush and close file
