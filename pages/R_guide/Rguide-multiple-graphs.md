---
title: Multiple Graphs
sidebar: Rguide_sidebar
permalink: Rguide-multiple-graphs.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

R lets you graph multiple data sets in one composed figure.
This is done through the `par` command.
Using `par`, you can specify a matrix (in the examples case, 2x2), where images
are added from top left to top right, bottom left to bottom right.
Each one can be formatted as previously described.
The example used three different sets of pre-loaded data,
and the very first graph is the only one without a specified title.
```R
> setwd("~/Desktop")
> png(filename="random_data_R.png")
> par(mfrow=c(2,2))
> plot(Theoph$Time, Theoph$conc, xlab="Time (min)", ylab="Concentration (M)", pch=16)
> plot(Theoph$Wt, Theoph$Dose, xlab="Weight (kg)", ylab="Dose (mM/L)", pch=2, main="Theoph Dosing")
> plot(Formaldehyde, xlab="Carb", ylab="optden", pch=16, main="Formaldehyde Data")
> hist(AirPassengers)
> dev.off()
quartz
     2
```

{% include image.html file="Rguide/random_data_R.png"
alt="The top left is time vs concentration. The data start at (0,0), before
rising between concentration of 6 and 10. They slowly fall until about the 13
minute mark. There are then points around 23 minutes close to 2 M.
The top right is titled 'Theoph Dosing' with x-axis of weight in kilograms
and y-axis of dose in millimolar per liter. Data are a decreasing linearly.
The bottom left is titled 'Formaldehyde Data.' Data are increasing linearly.
The x-axis is carb and the y-axis is optden.
The bottom right is titled 'Histogram of AirPassengers.' The x-axis
is air passengers and the y-axis is frequency. Data are right-skewed."
caption="A random dataset, created using `par`." %}

{% include links.html %}
