---
title: free
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-free.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

You aren't going to get a sample or anything with this command.
However, `free` will give you information on free, total and swap memory.
Using the `-t` flag shows the total memory used.
The default for `free` is in bytes, but the `-h` flag can put it in
human-readable format.
```bash
$ free -th
              total        used        free      shared  buff/cache   available
Mem:            15G        310M        4.3G         25M         11G         14G
Swap:           15G          0B         15G
Total:          31G        310M         20G
```

{% include links.html %}
