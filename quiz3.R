
# library(datasets)
# data(iris)
# ?iris

#1) what is the mean of Sepal.Length for species virginica?

# There are three species in the data set under the label Species
# setosa, versicolor, virginica
#
data <- split(iris, iris$Species)

# we get back a list 
# > split(iris, iris$Species)
# $setosa
# Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1           5.1         3.5          1.4         0.2  setosa
# 2           4.9         3.0          1.4         0.2  setosa
# 3    
# ...
# 50          5.0         3.3          1.4         0.2  setosa
# 
# $versicolor
# Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
# 51           7.0         3.2          4.7         1.4 versicolor
# 52           6.4         3.2          4.5         1.5 versicolor
# 53 
# 
# ...
# 
# 99           5.1         2.5          3.0         1.1 versicolor
# 100          5.7         2.8          4.1         1.3 versicolor
# 
# $virginica
# Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
# 101          6.3         3.3          6.0         2.5 virginica
# 102          5.8         2.7          5.1         1.9 virginica
# 10

# 
# now calculate the mean
#
colData <- data$virginica[,1]
mean(colData)
#
# 2) what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
# apply assume the data is an array, can be multi demensional
apply(iris[, 1:4], 2, mean)
# > apply(iris[, 1:4], 2, mean)
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
# 5.843333     3.057333     3.758000     1.199333 
# > 


#
# 3) How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
# library(datasets)
# data(mtcars)
# ?mtcars

# > tapply(mtcars$mpg, mtcars$cyl, mean)
# 4        6        8 
# 26.66364 19.74286 15.10000 
# > 

#
# 4) what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder 
# 
> data <- tapply(mtcars$hp, mtcars$cyl, mean)
> data
4         6         8 
82.63636 122.28571 209.21429 
> data[3] - data[1]
8 
126.5779 
> 
  > attributes(data)
$dim
[1] 3

$dimnames
$dimnames[[1]]
[1] "4" "6" "8"

> data["8"] - data["4"]
8 
126.5779 
> 
  
  