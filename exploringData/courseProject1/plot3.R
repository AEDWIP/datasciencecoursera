
#
# Andy@SantaCruzIntegration.com
# course project 1, plot 3
#

source("loadData.R")

#
# merge all the submetering data into a single col
# use a factor to identify meter 1, 2, and 3
#
levels <- c("s1", "s2", "s3")
name <- c("sub_metering", "timeStamp", "meterNum")
sm1 <- data.frame(febData$Sub_metering_1, febData$timeStamp, factor(rep("s1", nrow(febData)), levels))
names(sm1) <- name;

sm2 <- data.frame(febData$Sub_metering_2, febData$timeStamp, factor(rep("s2", nrow(febData)), levels))
names(sm2) <- name;

sm3 <- data.frame(febData$Sub_metering_3, febData$timeStamp, factor(rep("s3", nrow(febData)), levels))
names(sm3) <- name;

plotData <- rbind(sm1, sm2, sm3)

#
# graph the data
#

#png("plot3.png", width = 480, height = 480, bg="grey")

par(bg="grey")
plot(plotData$timeStamp, plotData$sub_metering, type='n', xlab="", ylab="Energy sub metering")
lines(plotData$timeStamp[plotData$meterNum == "s1"], plotData$sub_meter[plotData$meterNum == "s1"], type = "l", col = "black")
lines(plotData$timeStamp[plotData$meterNum == "s2"], plotData$sub_meter[plotData$meterNum == "s2"], type = "l", col = "red")
lines(plotData$timeStamp[plotData$meterNum == "s3"], plotData$sub_meter[plotData$meterNum == "s3"], type = "l", col = "blue")

# with(plotData, plot(plotData$Sub_metering, plotData$timeStamp, xlab="", ylab="Energy sub metering", type="n")) # do not plot yet
# 
# with(subset(plotData, meterNum == "s1"), points(plotData$timeStamp, plotData$Sub_metering, col="black")) 
# with(subset(plotData, meterNum == "s2"), points(plotData$timeStamp, plotData$Sub_metering, col="red")) 
# with(subset(plotData, meterNum == "s3"), points(plotData$timeStamp, plotData$Sub_metering, col="blue")) 
# 
legend("topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lwd=1, col=c("black", "red", "blue"))

#dev.off() # flush and close file
