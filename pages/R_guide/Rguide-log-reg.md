---
title: Logistic Regression
sidebar: Rguide_sidebar
permalink: Rguide-log-reg.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

Logistic regression is a statistical model where the independent variable is
continuous and the dependent variable is binary.
Some binary variables of interest would be health/sick, pass/fail, win/lose, or
alive/dead.

R has a function to use the general linearized model to perform logistic
regression. You're not going to need that fake data set here, but you will need
a data set with several rows of individual data, specified by columns.
Perhaps something like this:
```R
StudentID Passing Age Tutor TotalCredits Gender matched_sets
1234       1       32   1        178       0        100
1235       0       12   0        12        1        300
1236       1       25   0        0         2        200
1237       1       24   1        123       0        200
1238	   1       34   0        293       0        100
1239       0       15   1        25        1        300
```

In the future example, `Passing` will be referred to as `STATUS`
(where 1 = yes, 0 = no), and the columns to the right of `Passing` refer to the
dummy variables A through D.
Similarly, the data is stratified into the `matched_sets` strata.
There can be more columns in the data, and the columns can be in any order;
any formulas will reference columns by their header.

In the following example, the result of the test for the general linearized
model is saved under `logistical`.
The syntax for the `glm` command is thoroughly explained through using
`help(glm)`.
A quick summary is that it tests a formula of specified data columns against a
specific distribution model, such as binomial or Gaussian (`family =`).
```R
> data = read.table("/path/to/text/file/with/data", header=TRUE, na.strings = "NA")
> logistical <- glm(data$STATUS ~ data$VariableA + data$VariableB + data$VariableC + data$VariableD, family = binomial)
> summary(logistical)
Call:
glm(formula = data$STATUS ~ data$VariableA + data$VariableB + data$VariableC +
    data$VariableD, family = binomial)

Deviance Residuals:
    Min       1Q   Median       3Q      Max
-1.6684  -0.8207  -0.5998   1.1268   2.0336

Coefficients:
                 Estimate Std. Error z value Pr(>|z|)
(Intercept)    -2.5341507  0.5566591  -4.552 5.30e-06 ***
data$VariableA  0.0041581  0.0008622   4.823 1.42e-06 ***
data$VariableB -0.0190579  0.0252128  -0.756  0.44972
data$VariableC  0.3291734  0.2707949   1.216  0.22414
data$VariableD  0.8224185  0.2691547   3.056  0.00225 **
---
Signif. codes:  0 `***' 0.001 `**' 0.01 `*' 0.05 `.' 0.1 ` ' 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 366.95  on 293  degrees of freedom
Residual deviance: 330.86  on 289  degrees of freedom
  (1 observation deleted due to missingness)
AIC: 340.86

Number of Fisher Scoring iterations: 3
```

The level of significance for the *p*-value is given by the number of asterisks.
Three asterisks means that the *p*-value for that result is below 0.001,
but larger than 0.
Significant results allow the null hypothesis to be rejected,
and the significance code specifies whether this is done at the
90% (.), 95% (\*) , 99% (\*\*), or 99.9% (\*\*\*) level.

{% include links.html %}
