#
# quiz week 1
#

#
# question 1
# Give the value of μ that minimizes the least squares equation ∑wi(xi−μ)2
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
# mean(x) is wrong
#One way you can convert this problem to the problem solved in the lectures is consider the weight vector as the number of times each x value is repeated.
y <- x * w # weighted sum
 sum(y) / sum(w) 

#
# question 2
#
# Fit the regression through the origin and get the slope treating y as the outcome and x as the regressor. (Hint, do not center the data since we want regression through the origin, not through the means of the data.)

#
# https://class.coursera.org/regmods-014/lecture/177
# question ask us for regresion through the origin. I.E. force line through origin
# beta0 = 0. In general bad idea, good for explain things
#
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
# wrong coef(lm(y ~ x))[2] -1.713
# https://stat.ethz.ch/pipermail/r-help/2006-May/106221.html
lm(y ~ x - 1)


#
# question 3
#
# Do data(mtcars) from the datasets package and fit the regression model with mpg as the outcome and weight as the predictor. Give the slope coefficient.
data(mtcars)
coef(lm(mtcars$mpg ~ mtcars$wt))[2]

#
# question 4
#
# Consider data with an outcome (Y) and a predictor (X). The standard deviation of the predictor is one half that of the outcome. The correlation between the two variables is .5. What value would the slope coefficient for the regression model with Y as the outcome and X as the predictor?

rho <- 0.5
beta1 <- rho * 2; # sd(y) / sd(x) == 2
beta1

#
# question 5
# 
# Students were given two hard tests and scores were normalized to have empirical mean 0 and variance 1. The correlation between the scores on the two tests was 0.4. What would be the expected score on Quiz 2 for a student who had a normalized score of 1.5 on Quiz 1?
0.4 * 1.5


#
# questions 6
# Consider the data given by the following
# What is the value of the first measurement if x were normalized (to have mean 0 and variance 1)?
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
xs <- (x - mean(x)) / sd(x)
xs[1]

#
# question 7
#
# Consider the following data set (used above as well). What is the intercept for fitting the model with x as the predictor and y as the outcome?

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
coef(lm(y ~ x))[1]

#
# question 9
#
# What value minimizes the sum of the squared distances between these points and itself?
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mean(x)

#
# question 10
# Let the slope having fit Y as the outcome and X as the predictor be denoted as β1. Let the slope from fitting X as the outcome and Y as the predictor be denoted as γ1. Suppose that you divide β1 by γ1; in other words consider β1/γ1. What is this ratio always equal to?

# do algebra
# beta1 = cor(y,x)*sd(y)/sd(x)
# gama1 = cor(x,y)*sd(x)/sd(y)

#answer var(y)/var(x)
