---
title: Conditional Logistic Regression
sidebar: Rguide_sidebar
permalink: Rguide-cond-log-reg.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

Conditional logistic regression is like logistic regression,
but it can take stratification and matching into account.

One form of conditional logistic regression can be performed by loading the
[`Epi`](https://cran.r-project.org/web/packages/Epi/Epi.pdf) package.
An additional form can be performed by loading the
[`survival`](https://cran.r-project.org/web/packages/survival/survival.pdf)
package.

This example uses the `Epi` package.
The individual components of the `clogistic` command syntax have been shown
through the equals signs.
The  `data$` is not necessary because the data variable is specified in the
equation (which was an option for  `glm`).
Conditional logistic regression requires the use of stratified data, where the
column of the strata is specified (here as `matched_sets`).
Unlike before, the definition must be entered after defining the test;
summary will not work.
```R
> library(Epi)
> data = read.table("/path/to/text/file/with/data", header=TRUE, na.strings = "NA")
> EPI.clogistic <- clogistic(formula = STATUS ~ VariableA + VariableB + VariableC + VariableD, strata = matched_sets, data = data)
> EPI.clogistic

Call:
clogistic(formula = STATUS ~ VariableA + VariableB + VariableC + VariableD,
    strata = matched_sets, data = data)




                  coef exp(coef) se(coef)      z       p
VariableA     -0.01002      0.99  0.03261 -0.307 7.6e-01
VariableB      0.50098      1.65  0.36442  1.375 1.7e-01
VariableC      0.15458      1.17  0.27884  0.554 5.8e-01
VariableD      0.00486      1.00  0.00112  4.343 1.4e-05

Likelihood ratio test=26.5  on 4 df, p=2.51e-05, n=292
```

This example uses the `survival` package.
It has two distinct differences from Epi's `clogit`.
Firstly, `strata` are included into the formula, as opposed to being a second
parameter. Second, the summary function can be used.

```R
> library(survival)
> data = read.table("/path/to/text/file/with/data", header=TRUE, na.strings = "NA")
> survival.clogit <- clogit(formula = STATUS ~ VariableA + VariableB + VariableC + VariableD + strata(matched_sets) data = data)
> summary(survival.clogit)
Call:
coxph(formula = Surv(rep(1, 295L), STATUS) ~ VariableA + VariableB + VariableC +
   VariableD + strata(matched_sets), data = data, method = "exact")

  n= 294, number of events= 93
   (1 observation deleted due to missingness)

                   coef exp(coef)  se(coef)      z Pr(>|z|)
VariableA     -0.010025  0.990025  0.032612 -0.307    0.759
VariableB      0.500983  1.650342  0.364415  1.375    0.169
VariableC      0.154577  1.167164  0.278843  0.554    0.579
VariableD      0.004864  1.004876  0.001120  4.343 1.41e-05 ***
---
Signif. codes:  0 `***' 0.001 `**' 0.01 `*' 0.05 `.' 0.1 ` ' 1

          exp(coef) exp(-coef) lower .95 upper .95
VariableA     0.990     1.0101    0.9287     1.055
VariableB     1.650     0.6059    0.8079     3.371
VariableC     1.167     0.8568    0.6757     2.016
VariableD     1.005     0.9951    1.0027     1.007

Rsquare= 0.086   (max possible= 0.494 )
Likelihood ratio test= 26.5   on 4 df,   p=2.511e-05
Wald test            = 21.21  on 4 df,   p=0.0002873
Score (logrank) test = 24.77  on 4 df,   p=5.607e-05
```

The level of significance for the *p*-value is given by the number of asterisks.
Three asterisks means that the *p*-value for that result is below 0.001,
but larger than 0.
Significant results allow the null hypothesis to be rejected, and the
significance code specifies whether this is done at the 90% (.), 95% (\*) ,
99% (\*\*), or 99.9% (\*\*\*) level.

{% include links.html %}
