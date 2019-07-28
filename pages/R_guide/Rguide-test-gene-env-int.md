---
title: Testing for Gene-Environment Interaction
sidebar: Rguide_sidebar
permalink: Rguide-test-gene-env-int.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

Gene-environment interaction is when different genotypes have different
responses to variation in the environment.
To test for this, the data set needs genotypic and phenotypic information to be
combined, which can be done using R's `cbind` function.
If you're the type of person that like combining data in Excel, however,
then you can get started once your input file looks clean.

## Logistic Regression GxE {#logreg-ge}
The only difference when performing logistic regression for gene by environment
with the original is the addition of the terms of interest multiplied by the
environment variable that you're testing.

The example tests the environmental `VariableD` on variables A through C
(sometimes shortened like `VA`).
```R
> data = read.table("/path/to/text/file/with/data", header=TRUE, na.strings = "NA")
> logisticalGE <- glm(data$STATUS ~ data$VariableA + data$VariableB + data$VariableC + data$VariableD + data$VariableA*data$VariableD + data$VariableB*data$VariableD + data$VariableC*data$VariableD, family = binomial)
> summary(logisticalGE)

Call:
glm(formula = data$STATUS ~ data$VariableA + data$VariableB + data$VariableC +
    data$VariableD + data$VariableA * data$VariableD + data$VariableB *
    data$VariableD + data$VariableC * data$VariableD, family = binomial)

Deviance Residuals:
    Min       1Q   Median       3Q      Max
-1.7205  -0.8537  -0.5189   1.0470   2.5061

Coefficients:
                            Estimate Std. Error z value Pr(>|z|)
(Intercept)               -4.5268619  1.0737534  -4.216 2.49e-05 ***
data$VariableA        0.1690201  0.0530564   3.186 0.001444 **
data$VariableB        0.5921538  0.5478683   1.081 0.279772
data$VariableC        0.5843189  0.5787536   1.010 0.312679
data$VariableD        0.0136132  0.0038047   3.578 0.000346 ***
data$VA:data$VD      -0.0007583  0.0001849  -4.101 4.12e-05 ***
data$VB:data$VD      -0.0012611  0.0018368  -0.687 0.492361
data$VC:data$VD      -0.0003966  0.0018996  -0.209 0.834636
---
Signif. codes:  0 `***' 0.001 `**' 0.01 `*' 0.05 `.' 0.1 ` ' 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 366.95  on 293  degrees of freedom
Residual deviance: 311.15  on 286  degrees of freedom
  (1 observation deleted due to missingness)
AIC: 327.15

Number of Fisher Scoring iterations: 5
```

The level of significance for the *p*-value is given by the number of asterisks.
Three asterisks means that the *p*-value for that result is below 0.001,
but larger than 0.
Significant results allow the null hypothesis to be rejected,
and the significance code specifies whether this is done at the 90% (.),
95% (\*) , 99% (\*\*), or 99.9% (\*\*\*) level.

## Conditional Logistic Regression GxE {#cond-logreg-ge}
Again, like logistic regression's gene by environment interaction,
the only change for conditional logistic regression is the addition of the
terms of interest multiplied by the environment variable being tested.

The example tests the environmental `VariableD` on variables A through C (sometimes shortened like `VA`).
```R
> survival.clogitGE <- clogit(formula = STATUS ~ VariableA+ VariableB + VariableC + totalanth + VariableA*VariableD + VariableB*VariableD + VariableC*VariableD + strata(matched_sets),data)
> summary(survival.clogitGE)
Call:
coxph(formula = Surv(rep(1, 295L), STATUS) ~ VariableA + VariableB + VariableC +
   VariableD + VariableA * VariableD + VariableB * VariableD + VariableC *
    VariableD + strata(matched_sets), data = data, method = "exact")

  n= 294, number of events= 93
   (1 observation deleted due to missingness)

                      coef  exp(coef)   se(coef)      z Pr(>|z|)
VariableA        1.776e-01  1.194e+00  5.938e-02  2.991 0.002781 **
VariableB        2.608e-01  1.298e+00  7.080e-01  0.368 0.712598
VariableC        1.764e-01  1.193e+00  5.686e-01  0.310 0.756433
VariableD        1.230e-02  1.012e+00  4.091e-03  3.005 0.002652 **
VA:VD           -7.187e-04  9.993e-01  1.988e-04 -3.616 0.000299 ***
VB:VD           -6.979e-05  9.999e-01  2.076e-03 -0.034 0.973181
VC:VD           -7.048e-04  9.993e-01  1.976e-03 -0.357 0.721264
---
Signif. codes:  0 `***' 0.001 `**' 0.01 `*' 0.05 `.' 0.1 ` ' 1

             exp(coef) exp(-coef) lower .95 upper .95
VariableA      1.1943     0.8373    1.0631    1.3418
VariableB      1.2980     0.7704    0.3240    5.1991
VariableC      1.1929     0.8383    0.3914    3.6356
VariableD      1.0124     0.9878    1.0043    1.0205
VA:VD          0.9993     1.0007    0.9989    0.9997
VB:VD          0.9999     1.0001    0.9959    1.0040
VC:VD          0.9993     1.0007    0.9954    1.0032

Rsquare= 0.133   (max possible= 0.494 )
Likelihood ratio test= 41.97  on 7 df,   p=5e-07
Wald test            = 27.16  on 7 df,   p=3e-04
Score (logrank) test = 36.31  on 7 df,   p=6e-06
```

The level of significance for the *p*-value is given by the number of asterisks.
Three asterisks means that the *p*-value for that result is below 0.001,
but larger than 0.
Significant results allow the null hypothesis to be rejected, and the
significance code specifies whether this is done at the 90% (.), 95% (\*) ,
99% (\*\*), or 99.9% (\*\*\*) level.

{% include links.html %}
