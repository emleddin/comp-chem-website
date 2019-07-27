---
title: wc
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-wc.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

The `wc` command will find the word count of a file.
It has several different flags that make it helpful for determining how big
files are.
These include
* `wc -w`: gives the word count
* `wc -l`: gives the line count (the last line won't be counted if `\n` isn't
included)
* `wc -m`: gives the character count
* `wc -c`: gives number of bytes

{% include links.html %}
