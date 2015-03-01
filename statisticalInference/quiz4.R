

# 1?
# A pharmaceutical company is interested in testing a potential blood pressure lowering #medication. Their first examination considers only subjects that received the medicatio#n at baseline then two weeks later. The data are as follows (SBP in mmHg)

# Subject  Baseline	Week 2
# 1	140	132
# 2	138	135
# 3	150	151
# 4	148	146
# 5	135	130

b <- c(140, 138, 150, 148, 135)
w2 <- c(132, 135, 151, 146, 130)

#t.test(b, w2, paired = TRUE, var.equal = TRUE)$conf
s <- t.test(b, w2, paired = TRUE, var.equal = TRUE, alternative=c("two.sided"))
s$conf
s$p.value


# Question 2
# A sample of 9 men yielded a sample average brain volume of 1,100cc and 
# a standard  deviation of 30cc. What is the complete set of values of μ0 that
# a test of H0:μ=μ0 #would fail to reject the null hypothesis in a two sided 5%
# Students t-test?
# http://www.cyclismo.org/tutorial/R/confidence.html#calculating-a-confidence-interval-from-a-t-distribution
#

abv <- 1100
sd <- 30
n <- 9
error <- qt(p=(1.0 - 0.05/2.0), df=n-1) * sd/sqrt(n)
c(-1,1) * error + abv
