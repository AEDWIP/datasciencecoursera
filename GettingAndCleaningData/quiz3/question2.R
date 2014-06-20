
library(jpeg)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
dataDir <- "data/"
dataFile <- sprintf("%s%s", dataDir, "FJeff.jpg")
if (!file.exists(dataDir)) { dir.create(dataDir)}
if (!file.exists(dataFile)) {
  #download.file(link, ..., mode = 'wb')
  download.file(fileURL, destfile=dataFile, mode='wb', method="curl")
  dateDownLoaded <- date()
  write(dateDownLoaded, file=sprintf("%s%s", dataDir, "dateDownLoaded.txt"))
}
