
#
# week 1 regression notes
#

x <- rnorm(10)
y <- rnorm(10)

rho <- cor(y,x)

# calculate the interecept and slope of lest squares fit linear model
# x is the predictor, y is the outcome
coef(lm(y ~ x)) 

# beta0 = interecept 
# beta1 = slope
beta1 <- rho * sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)
beta0; beta1
