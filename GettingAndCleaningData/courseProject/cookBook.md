Getting and Clean Data Course project cookbook
========================================================
The data linked to from the course website represent data collected from the accelerometers from the Samsung 
Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## reference:
https://class.coursera.org/getdata-004

## download:
https://github.com/AEDWIP/datasciencecoursera/tree/master/GettingAndCleaningData/courseProject

## running
You can use RStudio or R to run the run_analysis.R script. This script is well documented and describes how
each step of the script works. After the script runs you should have a data sub directory.

* data/UCI HAR Dataset 
  * contains the orignal data set fro UCI
  
* data/X.data.frame 
  * All the training and test samples
* data/y.data.frame
  *all the training and test labeled results

* data/tidy.data.frame
  * this file contains a cleaned up data set as described in assinment
  * Merges the training and the test sets to create one data set.
  * Extracts only the measurements on the mean and standard deviation for each measurement. 
  * Uses descriptive activity names to name the activities in the data set
  * Appropriately labels the data set with descriptive variable names. 
  * Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## General overview of run_analysis.R
See the comments in the file for more details
1. if the initial data set has not been downloaded yet, it fetches it from uci.edu and saves it to data/UCI HAR Dataset 
2. reads the sample test and traing data
3. reads the labeled resuls for the test and traing data
4. converts the labeled results into a factor and changes the level to match enumerated values from activity_labels.txt
5. creates a data.frame X that contains only the columns pertaining to mean or standard devivation values 
6. reads the subject id data
7. creates a data.frame M that combines X and the labeled results, and the subjectId
8. creates the final tidy data set. 


tidyM <- ddply(M, c("subjectId", "activity"), colwise(mean)) <br/>
tidyFileName <- sprintf("%s/%s", dataDir, "tidy.data.frame") <br />
write.table(tidyM, tidyFileName) <br />

## AEDWIP
This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **Help** toolbar button for more details on using R Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
summary(cars)
```

```
##      speed           dist    
##  Min.   : 4.0   Min.   :  2  
##  1st Qu.:12.0   1st Qu.: 26  
##  Median :15.0   Median : 36  
##  Mean   :15.4   Mean   : 43  
##  3rd Qu.:19.0   3rd Qu.: 56  
##  Max.   :25.0   Max.   :120
```

You can also embed plots, for example:


```r
plot(cars)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

