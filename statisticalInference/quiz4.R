

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

# Question 3
# Researchers conducted a blind taste test of Coke versus Pepsi. Each of four people was asked which of two blinded drinks given in random order that they preferred. The data was such that 3 of the 4 people chose Coke. Assuming that this sample is representative, report a P-value for a test of the hypothesis that Coke is preferred to Pepsi using a one sided exact test.

n <-4 
h0 <- 2.0/4.0 # expect no difference in preference
likeCoke <- 3.0/4.0
p <- pt(q=h0-likeCoke, df=n-1)
p
# [1] 0.4093646
p <- pt(q=likeCoke, df=n-1)
p
#[1] 0.7461427
I have no idea what the anser to 3 is

# The values our random variable could take are
# {0, 0.25, 0.5, 0.75, 1} . Lets assume their is no prefernce for either
# coke or pesi. i.e. the random variable is uniformally distrubted. We can 
# calculate the expected value which equals the population mean

p = 0.25
mean = 0 * p + 0.25 * p + 0.5 * p + 0.75 * p + 1 * p
#> mean
#[1] 0.625

# now we can calculate the confidence interval for quantile 0.75 - mean
pt(0.75 - mean, df=n-1)
# [1] 0.5457853

#variance = 1.0/12.0 #(1/12)sqrt((1-0))
# http://en.wikipedia.org/wiki/Uniform_distribution_%28discrete%29
variance = ((1-0 +1)^2 -1)/12
sd = sqrt(variance)
pt((0.75 - mean)/sd, df=n-1)

# Question 4
# Infection rates at a hospital above 1 infection per 100 person days at risk are believed to be too high and are used as a benchmark. A hospital that had previously been above the benchmark recently had 10 infections over the last 1,787 person days at risk. About what is the one sided P-value for the relevant test of whether the hospital is *below* the standard?



???

# question 5
# 18 subjects 9 got treatment 9 got plecbo
meanTreat = -3.0
meanPlecbo = 1.0
sTreatment = 1.5
sPlecbo = 1.8

# question 6
# Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc to 1,123 cc. Would you reject in a two sided 5% hypothesis test of H0:μ=1,078?
