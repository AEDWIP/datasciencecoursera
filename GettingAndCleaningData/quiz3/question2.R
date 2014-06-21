
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


# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the 
# resulting data? (some Linux systems may produce an answer 638 different for the 
# 30th quantile)

# If native is TRUE then an object of the class nativeRaster is returned instead. 
img <- readJPEG(dataFile, native=TRUE)
print(quantile(img, probs=c(0.3, 0.8)))
# 30%       80% 
#   -15259150 -10575416 
# > 