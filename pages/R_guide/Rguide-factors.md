---
title: Factors
sidebar: Rguide_sidebar
permalink: Rguide-factors.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

Factors are a new vector comprised of integer values with a corresponding
character value. They are categorical variables.
A good way to describe this is when thinking of an Olympic roster.
There's hundreds of athlete names, and under "medal type" there would be a
factor with four levels: gold, silver, bronze, and none.
R can assign numbers to these factors when doing analysis
(so, in the case of alleles, AA=3, Aa=2, aa=1 could be an assignment).
To store a vector as a variable of a factor,
use `variable <- factor(vectorname)`.
Their integer assignments can be checked with `as.integer(variable)`,
and the levels can be checked with `levels(variable)`.
```R
> allele <- c( 'aa', 'Aa', 'AA', 'aa', 'aa', 'aa', 'aa', 'Aa', 'Aa')
> types <- factor(allele)
> print(types)
[1] aa Aa AA aa aa aa aa Aa Aa
Levels: aa Aa AA
> as.integer(types)
[1] 1 2 3 1 1 1 1 2 2
> levels(types)
[1] "aa" "Aa" "AA"
```

{% include links.html %}
