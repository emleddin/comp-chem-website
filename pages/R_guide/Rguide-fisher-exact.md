---
title: Fisher's Exact Test
sidebar: Rguide_sidebar
permalink: Rguide-fisher-exact.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

Using our fake data, we'll run Fisher's exact test.
This test is typically used in place of the chi-square on small samples,
but it is valid for all sample sizes.

<u> Hypotheses </u>
* *H<sub>0</sub> = in HWE*
* *H<sub>a</sub> = not in HWE*

```R
>fisher.test(Matrix)

	Fisher's Exact Test for Count Data

data:  Matrix
p-value = 0.0009992
alternative hypothesis: two.sided
```
Since the p-value is less than &alpha; (0.05 at the 95% level), we reject the
(*H<sub>0</sub>*) null hypothesis in favor of the alternative (*H<sub>a</sub>*).
There is enough evidence to say that the fake data is not in HWE.

{% include links.html %}
