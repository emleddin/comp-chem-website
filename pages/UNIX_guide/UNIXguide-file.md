---
title: file
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-file.html
folder: UNIX_guide
---

The `file` command can be used to print the format of the data within a file.
In this example, the data is a binary NetCDF file.
Using [cat](UNIXguide-cat.html) to print the file would make it look like a
monster trying to escape the terminal.
```bash
$ file trajectory_info.nc
trajectory_info.nc: data
```
For this one, the file is a text file that is easily printed using
[cat](UNIXguide-cat.html).
```bash
$ file trajectory_info.mdcrd
trajectory_info.mdcrd: ASCII text
```

{% include links.html %}
