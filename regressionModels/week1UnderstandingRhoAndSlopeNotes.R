#
# if data is centered and scalled then rho == slope
#

x <- c(1:10)
y <- x * 3
cor(y, x)
coef(lm(y ~ x))

xc <- (x - mean(x)) / sd(x)
yc <- (y - mean(y)) / sd(y)

cor(yc, xc)
coef(lm(yc ~ xc))
