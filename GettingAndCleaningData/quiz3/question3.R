
# download data

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
dataDir <- "data/"
dataFile <- sprintf("%s%s", dataDir, "FGDP.csv")
if (!file.exists(dataDir)) { dir.create(dataDir)}
if (!file.exists(dataFile)) {
  download.file(fileURL, destfile=dataFile, method="curl")
  dateDownLoaded <- date()
  write(dateDownLoaded, file=sprintf("%s%s", dataDir, "dateDownLoaded.txt"))
}
