
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

# read data
fgdp <- read.csv(dataFile)

# Load the Gross Domestic Product data for the 190 ranked countries 
# in this data set: 
# Remove the commas from the GDP numbers in millions of dollars and average them. 
# What is the average? 

# t is a factor with 207 levels
# rows 5 through 194 contain the 190 countries that are ranged
t <- fgdp$X.3[5:194]


# l is chr [1:207]
#l <- levels(t)

#> str(numberStr)
# chr [1:207] "" " 1008 " " 1129 " " 1129598 " " 1134 " " 1178126 " ...
#numberStr <- gsub(",", "", l[5:194])
numberStr <- gsub(",", "", t)

gdp <- as.numeric(numberStr)
gdbAverage <- mean(gdp, na.rm = TRUE)

print(sprintf("AEDWIP questions 1 gdbAverage %f", gdbAverage))


#
# 3) 

#country names is a factor with 230 levels
countryNames <- fgdp$X.2
cnl <- levels(countryNames)
g <- grep("United", cnl)
# > g
# [1] 217 218 219
# > cnl[g]
# [1] "United Arab Emirates" "United Kingdom"       "United States"       
# > 

print(sprintf("AEDWIP question 3) %s", cnl[g]))
