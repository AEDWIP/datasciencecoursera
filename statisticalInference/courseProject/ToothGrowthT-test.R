library(UsingR)
data(ToothGrowth)
head(ToothGrowth)

vc05 <- ToothGrowth$len[ToothGrowth$supp == "VC" & ToothGrowth$dose == 0.5]
vc1 <- ToothGrowth$len[ToothGrowth$supp == "VC" & ToothGrowth$dose == 1.0]
vc2 <- ToothGrowth$len[ToothGrowth$supp == "VC" & ToothGrowth$dose == 2.0]

oj05 <- ToothGrowth$len[ToothGrowth$supp == "OJ" & ToothGrowth$dose == 0.5]
oj1 <- ToothGrowth$len[ToothGrowth$supp == "OJ" & ToothGrowth$dose == 1.0]
oj2 <- ToothGrowth$len[ToothGrowth$supp == "OJ" & ToothGrowth$dose == 2.0]


m05 <- mean(vc05) - mean(oj05)
m05
t.test(vc05, oj05, paried=FALSE, var.equal=TRUE)


m1 <- mean(vc1) - mean(oj1)
m1
t.test(vc1, oj1, paried=FALSE, var.equal=TRUE)


m2 <- mean(vc2) - mean(oj2)
m2
t.test(vc2, oj2, paried=FALSE, var.equal=TRUE)
