---
title: Histograms
sidebar: Rguide_sidebar
permalink: Rguide-histograms.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

A histogram provides a visual depiction of a dataset's distribution.
This example uses the dataset USArrests, which contains information on the
violent crime rates by US state.
```R
> setwd("~/Desktop")
> png(filename="hist_murder.png")
> hist(USArrests$Murder,main="Histogram for US Murders",xlab="Murders (per capita)",border="gray",col="red",xlim=c(0,20))
> dev.off()
null device
          1
```

{% include image.html file="Rguide/hist_murder.png"
alt="The x-axis is murders per capita. The y-axis is frequency. The title is
Histogram for US Murders. The data are right-skewed." 
caption="A histogram of the Murder column from the USArrests dataset." %}


Because there were multiple columns of information, the `Data$Column` option
was used to specify which column the histogram should be created from.
The title was set using `main=`, colors for the border (`border="gray"`) and
columns (`col="red"`) were set, and the x-axis boundries were chosen as 0-20
(`xlim=c(0,20)`).
None of the options were necessary, except the initial `Data\$Column`
specification.
There are also more options for histograms found in the documentation,
including adding breaks (which can organize how data is grouped) or
density curves.

{% include links.html %}
