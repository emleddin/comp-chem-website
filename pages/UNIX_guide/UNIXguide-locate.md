---
title: locate
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-locate.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

Like [find](UNIXguide-find.html), `locate` can be used to search for files by
name.
With `locate`, however, you need not have to include the entire file name; it
will search for parts of names.
Using `locate` will search your entire computer system, so it can take a
significant amount of time depending on specificity and number of files.
The general syntax is `locate [options] name`, where options like the `-i`
flag will make the search case insensitive.

{% include links.html %}
