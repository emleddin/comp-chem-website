---
title: Sample Data
sidebar: Rguide_sidebar
permalink: Rguide-sample-data.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

R has several preloaded data packages that can be very helpful in learning R.
The available packages can be loaded by using the command `data()`, which will
then bring up a menu with options.
To exit that menu, type `q`. To list what data is currently loaded, use the
`ls()` command with empty parentheses. The following example loads the
Orange data set (regarding the growth of orange trees).
```R
> data(Orange)
```
The commands `head()`, `tail()`, and `rm()` can be used similarly to how they
would be in a Unix environment. 
To show the first line of the Orange dataset, the command would be
`head(Orange, n=1)`. If you wanted to unload the Orange dataset ,
use `rm(Orange)`.

{% include links.html %}
