---
title: Stem Plot
sidebar: Rguide_sidebar
permalink: Rguide-stem-plot.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

One way to visualize your data is with a stem and leaf plot, which gives a
visual representation of where your data lie. The command to create a stem plot
is `stem(variable)`.
```R
> stem(spidersconsumed)

  The decimal point is 1 digit(s) to the right of the |

  0 | 000000000
  1 |
  2 |
  3 | 0
```
Wow, Spiders Meorg really does look like an outlier now!

{% include links.html %}
