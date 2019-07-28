---
title: Directing Output to a File
sidebar: Rguide_sidebar
permalink: Rguide-direct-output.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

The `sink()` command is used direct output from an R job to a new file. 
Having nothing in the parentheses will return the output to the terminal.
Using something like
```R
> sink("myfile.txt", append=TRUE, split=TRUE)
```
will direct the output to a file titled `myfile.txt`,
the append option will allow the output to be added to the existing file as
opposed to overwriting it, and the split option will send the data to the
screen and the output file.

{% include links.html %}
