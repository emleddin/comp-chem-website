---
title: Hypothesis Testing Overview
sidebar: Rguide_sidebar
permalink: Rguide-hypoth-overview.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

What would a statistics software be without hypothesis testing?
Answer: Not a statistics software.
Anyway, there are several options for hypothesis testing,
which are all better explained in a stats class.
So let's get on with the examples.
First, we'll create our fake data set
(which would be something we'd eventually want to test for
Hardy-Weinberg equilibrium).

```R
>Input =("
Genotype Observed Expected
AA            200          160
Aa            400          360
aa            400          480
")

>Matrix = as.matrix(read.table(textConnection(Input),
                   header=TRUE,
                   row.names=1))
> Matrix
   Observed Expected
AA      200      160
Aa      400      360
aa      400      480
```


{% include links.html %}
