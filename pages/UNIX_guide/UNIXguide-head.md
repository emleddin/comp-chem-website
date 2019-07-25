---
title: head
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-head.html
folder: UNIX_guide
---

The command `head` can be used to print the first few lines of a file.
The default use of head with print the first 10 lines of the file, but a flag
can be used to print more or fewer lines.
```bash
$ head -n 25 fake_data_file.txt
```
Use of `-n 25` will print the first 25 lines, as opposed to the original 10.
Otherwise, default use would be:
```bash
$ head fake_data_file.txt
```

{% include links.html %}
