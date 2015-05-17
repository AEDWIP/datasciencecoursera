
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
