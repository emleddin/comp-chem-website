---
title: Boxplots
sidebar: Rguide_sidebar
permalink: Rguide-boxplots.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

Boxplots are one way of graphically orienting information from the
[`summary(variable)`](Rguide-IQR.html) command.
```R
> setwd("~/Desktop")
> png("arrests_boxplot.png")
> boxplot(USArrests$Murder,USArrests$Assault,USArrests$Rape, names=c("Murder","Assault","Rape"),main="US Arrests (per capita)")
> dev.off()
null device
          1
```

{% include image.html file="Rguide/arrests_boxplot.png"
alt="The title is US arrests (per capita). 
The x-axis has murder, assault, and rape. Three boxplots are shown.
Murder and rape are both clustered toward the bottom of the page, with values
between 0 and 50. Assault has endpoints from about 50 to 340."
caption="A boxplot depicting the Murder, Assault, and Rape columns from the
USArrests dataset." %}

Because specific columns of data were selected, their individual names had to
be specified to create the image above.
Otherwise, the default names of 1, 2, and 3, would have been used.

{% include links.html %}
