---
title: zip and unzip
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-zip.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

Finally, for the times you need to create a folder in the zip folder format,
then you can use `zip`, which puts things in the `.zip` format.
```bash
$ zip zipfoldername.zip file1 file2 file3
```
To zip a directory, use the `-r` flag.
```bash
$ zip -r zipfoldername.zip dir
```
To unzip the folder, use
```bash
$ unzip zipfoldername.zip
```

{% include links.html %}
