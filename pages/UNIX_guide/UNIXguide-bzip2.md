---
title: bzip2 and bunzip2
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-bzip2.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

The less common way of compressing files is using `bzip2`.
Like with `gzip`, the syntax is
```bash
$ bzip2 fileA fileB...
```
Using `bzip2` adds the extension `.bz2`.
To uncompress a `.bz2` file, you can use the `bunzip2` command.
```bash
$ bzip2 fileA.bz2 fileB.bz2...
```
If you want to use this command to zip or unzip every `.bz2` file in your
directory, use a wildcard.
```bash
$ bzip2 *
$ bunzip2 *
```

{% include links.html %}
