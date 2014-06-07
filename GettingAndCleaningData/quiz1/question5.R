

# fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
# download.file(fileURL, destfile="./data/2006CommunitServey.csv", method="curl")
# list.files("./data")

library(data.table)
DT <- fread("./data/2006CommunitServey.csv")

print(system.time(DT[,mean(pwgtp15),by=SEX]))
print(system.time(mean(DT$pwgtp15,by=DT$SEX)))
print(system.time(tapply(DT$pwgtp15,DT$SEX,mean)))
#system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
#system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
#system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
