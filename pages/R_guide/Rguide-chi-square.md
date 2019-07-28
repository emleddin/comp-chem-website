---
title: Chi-Square Test
sidebar: Rguide_sidebar
permalink: Rguide-chi-square.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

Using our fake data, we'll run a chi-square test.
This test is used to evaluate how likely there is to be an observed difference
between sets.

<u> Hypotheses </u>
* *H<sub>0</sub> = in HWE*
* *H<sub>a</sub> = not in HWE*

```R
> chisq.test(Matrix)

	Pearson's Chi-squared test

data:  Matrix
X-squared = 13.822, df = 2, p-value = 0.0009965
```
Since the p-value is less than &alpha; (0.05 at the 95% level), we reject the
(*H<sub>0</sub>*) null hypothesis in favor of the alternative (*H<sub>a</sub>*).
There is enough evidence to say that the fake data is not in HWE.

{% include links.html %}
