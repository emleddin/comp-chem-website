---
title: gzip and gunzip
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-gzip.html
folder: UNIX_guide
summary: "Because data management is so essential to computational work, it is
important to know about compressing and expanding files. You're probably
familiar with .zip folders if you've ever downloaded anything remotely large
from the internet. Dealing with zipped (compressed) files is another thing
you can do with the command line."
---

<link rel="stylesheet" href="css/theme-blue.css">

The most common way to compress files in Unix is though `gzip`.
Zipping a file turns it into a binary file, which is no longer readable (until
    it is uncompressed).
To zip a file using this command, the syntax (for any number of files, or
    perhaps a directory) is
```bash
$ gzip fileA fileB...
```
If you use the `-9` flag, then the files will be compressed as much as possible
(`gzip -9 fileA....`).
Using `gzip` adds a `.gz` extension to the end of the filename.
To unzip a `.gz` file, the command is `gunzip`.
Unzipping returns them in their original state.
```bash
$ gunzip fileA.gz fileB.gz...
```
If you want to use this command to zip or unzip every file in your directory,
use a wildcard.
```bash
$ gzip -9 *
$ gunzip *
```

{% include links.html %}
