---
title: touch
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-touch.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

The `touch` program will create empty files.
While empty files seem overly useless, it can be critical for installing and
compiling programs.
Creating files follows the syntax
```bash
$ touch [options] filename
```
Using the `-m` flag will allow you to update the timestamp on the file.
Some clusters or supercomputers will auto-delete files that have been
unmodified in a previous timespan, so using `touch -m` to modify the timestamp
can be used to prevent those deletions.
[Note: some clusters/supercomputers specifically ban doing this, so if that's
the case... don't.]

{% include links.html %}
