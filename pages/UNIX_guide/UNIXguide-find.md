---
title: find
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-find.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

If you're like most people, using Cntrl+F is the way you live your life.
While Cntrl+F isn't something you can use through the command line, you can use
`find`. In general, the command syntax is `find [path] expression`.
So, to find something with "README" anywhere in the filename from the folder
you're using the command in, you would use something like:
```bash
$ find . -name *README*
```
There are many other options, all of which are readily Google-able or found
through the [man](UNIXguide-man-pages.html) page.

{% include links.html %}
