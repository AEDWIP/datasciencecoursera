# 
# The data linked to from the course website represent data collected from the accelerometers from the Samsung 
# Galaxy S smartphone. A full description is available at the site where the data was obtained: 
#   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
#


# download data 
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataDir <- "data/"
dataFile <- sprintf("%s%s", dataDir, "Dataset.zip")
if (!file.exists(dataDir)) { dir.create(dataDir)}
if (!file.exists(dataFile)) {download.file(fileURL, destfile=dataFile, method="curl")}