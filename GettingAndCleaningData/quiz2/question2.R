
# The sqldf package allows for execution of SQL commands on R data frames. We will use the sqldf package to practice 
# the queries we might send with the dbSendQuery command in RMySQL. Download the American Community Survey data and
# load it into an R object called acs

#
# install.packages("sqldf")
library(sqldf)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
dataDir <- "data/"
dataFile <- paste(dataDir, "americanCommunitServey.csv", "") # paste is really string concatenation
if (!file.exists(dataDir)) { dir.create(dataDir)}
if (!file.exists(dataFile)) {download.file(fileURL, destfile=dataFile, method="curl")}

# data.frames are slower than data.tables. say use data.frame. Lets see if table work
library(data.table)
acsDF <- read.csv(dataFile)
acs <- data.table(acsDF)

# Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?
sqldf("select pwgtp1 from acs where AGEP < 50")

# question 3
# Using the same data frame you created in the previous problem, what is the equivalent function to unique(acs$AGEP)
# sqldf("select distinct AGEP from acs")