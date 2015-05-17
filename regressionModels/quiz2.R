
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
#
