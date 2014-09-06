q1Data <- read.csv("hw1_data.csv")

# 11) what are the column names
names(q1Data)

# 12) Extract the first 2 rows of the data frame and print 
# them to the console. What does the output look like?
x <- q1Data[1:2,]
print(x)


# 13)
# How many observations (i.e. rows) are in this data frame
nrow(q1Data)

# 14)
# Extract the last 2 rows of the data frame and print them 
# to the console. What does the output look like?

x <- q1Data[152:153, ]
# this also works q1Data[c(152, 153), ]
print(x)

# 15)
# What is the value of Ozone in the 47th row?
q1Data[47,]

# 16) 
# How many missing values are in the Ozone column of this data frame?
ozoneColVec <- q1Data[, "Ozone"]
is.na(ozoneColVec)
table(is.na(ozoneColVec))

# 17)
# What is the mean of the Ozone column in this dataset?
# Exclude missing values (coded as NA) from this calculation
goodLogical <- ! is.na(ozoneColVec)
good <- ozoneColVec[goodLogical]
summary(good)


# 18)
# Extract the subset of rows of the data frame where Ozone values are above 31 
# and Temp values are above 90. What is the mean of Solar.R in this subset?
aboveOz <- q1Data[q1Data$Ozone > 31 ,] # 95 observations
aboveTmp <- aboveOz[aboveOz$Temp > 90, ] # 42 observations
summary( aboveTmp$Solar.R)

# here is how to do it in one line, should use less memory
above <- q1Data[(q1Data$Ozone > 31) & (q1Data$Temp > 90),]
summary(above$Solar.R)


# 19)
# 
