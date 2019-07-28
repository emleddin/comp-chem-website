---
title: Printing and Setting the Working Directory
sidebar: Rguide_sidebar
permalink: Rguide-working-dir.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

The folder that you work through the terminal is known as the working
directory. To know what your current working directory is, use:
```R
> getwd()
```
which will return the path to where you are. To specify a working directory,
you need to put the path to that directory in, which is shown in the example
below.
```R
> setwd("/Users/Path/Through/The/Computer")
```
Similarly, if a directory called Land within Computer needed to be accessed,
then use:
```R
> setwd("Land")
```
to access it.

{% include links.html %}
