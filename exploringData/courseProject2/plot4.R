#
# Exploring Data
# course project 2
# Andy@SantaCruzIntegration.com
#

#
#Across the United States, how have emissions from coal combustion-related
#sources changed from 1999–2008?
#

setwd("~/workSpace/datasciencecoursera/johnsHopkinsUniv/datasciencecoursera.git/exploringData/courseProject2")

if (!exists("NEI")) {
  source("loadData.R") # this can take while
}

#
# select data
#

#
# 1: find the SCC char strings that corespond to the coal combustion
#

# i <- grep(pattern = "coal", 
#           x = as.character(levels(SCC$EI.Sector)), 
#           ignore.case = TRUE,
#           value = FALSE
#           )

i <- grep (
  pattern = "coal",
  x = SCC$Short.Name,
  ignore.case = TRUE,
  value = TRUE
)

#
# find all the matches
#
l <- SCC$Short.Name == i
ll <- which(l) # get index for rows we want
SCCIndex <- SCC[ll, "SCC"]

match(x = SCCIndex, table=NEI)

#
# begin graph ggplot2 operations 
#
library(ggplot2)
# png("plot4.png", width = 480, height = 480)


# dev.off() # flush and close file
