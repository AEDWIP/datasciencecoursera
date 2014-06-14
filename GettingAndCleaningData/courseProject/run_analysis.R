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
if (!file.exists(dataFile)) {
  download.file(fileURL, destfile=dataFile, method="curl")
  unzip(dataFile, exdir=dataDir)
  dateDownLoaded <- date()
  write(dateDownLoaded, file=sprintf("%s%s", dataDir, "dateDownLoaded.txt"))
}
rawDataDir <- sprintf("%s/%s", dataDir, "UCI HAR Dataset")

#
# read the source / original data traing and test data files
#

#
# I got the numFeatures from UCI HAR Dataset/features.txt (It is also mentioned in README.txt)
#
numFeatures <- 561
featuresFile <- sprintf("%s/%s", rawDataDir, "features.txt")

features <- read.table(featuresFile, stringsAsFactors=FALSE)
colNames <- features[,2]

# read XTest
xTestFile <- sprintf("%s/%s", rawDataDir, "test/X_test.txt")
xTest <- read.table(xTestFile, col.names=colNames)

# read XTrain
xTrainFile <- sprintf("%s/%s", rawDataDir, "train/X_train.txt")
xTrain <- read.table(xTrainFile, col.names=colNames)

# read yTest
yTestFile <- sprintf("%s/%s", rawDataDir, "test/y_test.txt")
yTest <- read.table(yTestFile)

# read yTrain
yTrainFile <- sprintf("%s/%s", rawDataDir, "train/y_train.txt")
yTrain <- read.table(yTrainFile)


#
# combine the test and training data
#
allX <- rbind(xTrain, xTest)
allY <- rbind(yTrain, yTest)

#
# find all the features with either 'mean' or 'std' in their name
#
X <- allX[, grep("mean|std", colNames)]

#
# save X
#
xFileName <- sprintf("%s/%s", dataDir, "X.data.frame")
write.table(X, file=xFileName)
