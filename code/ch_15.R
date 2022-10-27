###################################################################
###  ch_15.r                                                    ###
###                                                             ###
###  This is an R script for producing examples in              ###
###  chapter 15 of                                              ###
###  Snijders, Tom A.B., and Bosker, Roel J.                    ###
###  Multilevel Analysis:                                       ###
###  An Introduction to Basic and Advanced Multilevel Modeling, ###
###  second edition.                                            ###
###  London etc.: Sage Publishers, 2012                         ###
###                                                             ###
###  version June 9, 2012                                       ###
###                                                             ###
###################################################################

soep5560 <- read.table("data/soep_5560_21.dat", header=TRUE)
names(soep5560)
table(soep5560$age)

library(lme4)

# Table 15.1.
# Model 1
(mod1 <- lmer(lifeSat ~ (1|id), data = soep5560, REML=FALSE))

# Model 2
(mod2 <- lmer(lifeSat ~ -1 + as.factor(age) + (1|id), 
              data = soep5560, REML=FALSE))
deviance(mod2)

# Calculate birth year; centered at 1940, measured in decades
birthyear <-  (soep5560$j - soep5560$age -1940)/10
hist(birthyear)

# Table 15.2
age.t0 <- soep5560$age - 55
(mod3 <- lmer(lifeSat ~ -1 + as.factor(age) + (age.t0|id), 
              data = soep5560, REML=FALSE))
deviance(mod3)

age.byear <- age.t0 * birthyear
(mod4 <- lmer(lifeSat ~ -1 + as.factor(age) + birthyear + age.byear 
              + (age.t0|id), data = soep5560, REML=FALSE))
deviance(mod4)

# Table 15.4
# Change the library used
library(nlme)

age.t1 <- age.t0 + 1
(mod5 <- gls(lifeSat ~  -1 + as.factor(age),
             correlation = corSymm(form= ~ 1 | id), weights = varIdent(form = ~ 1 | age.t1),
             data = soep5560, method="ML"))
-2*logLik(mod5)
# For this model specification, also see Pinheiro & Bates p. 251.

