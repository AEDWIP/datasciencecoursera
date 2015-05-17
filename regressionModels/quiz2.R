
#
# q1
# Give a P-value for the two sided hypothesis test of whether β1 from a 
# linear regression model is 0 or not.
#
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y ~ x)
summary(fit)
coef(fit) # returns intercept and slope o
summary(fit)$coefficients # strange in Summary varriable name is Coefficients

# answer is 0.05296
s <- summary(fit)$coefficients
s[2,4]


#
# q2
# Consider the previous problem, give the estimate of the residual standard 
# deviation.
#
summary(fit)$sigma

# answer 0.223

#
# q3
# In the mtcars data set, fit a linear regression model of weight (predictor) 
# on mpg (outcome). Get a 95% confidence interval for the expected mpg at the 
# average weight. What is the lower endpoint?
#
y <- mtcars$mpg
x <- mtcars$wt
fit <- lm(y ~ x)
resd <- summary(fit)$sigma # residual error standard devation
newX <- mean(x)
# interval=("confidence") is interval around the regression line
newY <- predict(fit, newdata = data.frame(x=newX), interval=("confidence"))
newY
#> newY
#fit      lwr      upr
#1 20.09062 18.99098 21.19027
#> 
alpha = 0.05
newYValue = newY[1]
# this did not work? ci <- newYValue + c(-1, 1) * qt(1 - alpha/2, df=fit$df) * resd

# how I hacked the answer from given choices
# newY - 18.991
# newY + c(-1,1) *  1.099625
# answer = 18.99100

#
# q4
# Refer to the previous question. Read the help file for mtcars. What is the
# weight coefficient interpreted as?
#
# ?mtcars
# [, 6]  wt	Weight (lb/1000)
# The estimated expected change in mpg per 1,000 lb increase in weight.


#
# q5
# Consider again the mtcars data set and a linear regression model with mpg as 
# predicted by weight (1,000 lbs). A new car is coming weighing 3000 pounds. 
# Construct a 95% prediction interval for its mpg. What is the upper endpoint?
#
newX <- 3
# interval=("prediction") is the confidce interval around the predicted value of y
newY <- predict(fit, newdata = data.frame(x=newX), interval=("prediction"))
newY
newY[3]
#[1] 27.57355

#
# q6
# Consider again the mtcars data set and a linear regression model with mpg as
# predicted by weight (in 1,000 lbs). A “short” ton is defined as 2,000 lbs. 
# Construct a 95% confidence interval for the expected change in mpg per 1 
# short ton increase in weight. Give the lower endpoint.
#
# This is similar question 3, difference is we are creating a confidence
# interval for slope
#
y <- mtcars$mpg
x <- mtcars$wt / 2
fit <- lm(y ~ x)
sc <- summary(fit)$coefficients
standardError <- sc[2,2] # of slope
#t <- sc[2,3]
t <-  qt(1-alpha/2, df=fit$df)
beta1 <- coef(fit)[2]
alpha = 0.05
ci <- beta1 + c(-1,1) * t * standardError
ci
# [1] -12.97262 

#
# q7
# If my X from a linear regression is measured in centimeters and I convert it 
# to meters what would happen to the slope coefficient?
#

x <-c(1,2,3,4,5)
y <- x
fit <- lm(y ~ x)
coef(fit)[2]
# slope is 1
x <- x / 100
fit <- lm(y ~ x)
coef(fit)[2]
# slope is 100

#
# q8
# I have an outcome, Y, and a predictor, X and fit a linear regression model 
# with Y=β0+β1X+ϵ to obtain β^0 and β^1. What would be the consequence to the 
# subsequent slope and intercept if I were to refit the model with a new 
# regressor, X+c for some constant, c?
#

# The new intercept would be β^0−cβ^1

#
# q9
# Refer back to the mtcars data set with mpg as an outcome and weight (wt) 
# as the predictor. About what is the ratio of the the sum of the squared 
# errors, ∑ni=1(Yi−Y^i)2 when comparing a model with just an intercept 
# (denominator) to the model with the intercept and slope (numerator)?
#
y <- mtcars$mpg
x <- mtcars$wt 
fit <- lm(y ~ x)
numerator <- mean(y)
denominator <-sum(resid(fit)^2)
numerator / denominator
# [1] 0.07218484
