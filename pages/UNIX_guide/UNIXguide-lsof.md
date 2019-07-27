---
title:
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-lsof.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

`lsof` stands for "list of open files."
Using this command, thus, gives a list of all the open files.
Often crazy, ridiculously-named things are being used by programs and show up
in [top](UNIXguide-top.html), so using `lsof` can show where those files
originate.
```bash
$ lsof
lsof   5982    root  mem     REG      8,18    2981280   50856367 /usr/lib/locale/locale-archive
lsof   5982    root  mem     REG      8,18     138696    4981417 /lib/x86_64-linux-gnu/libpthread-2.23.so
lsof   5982    root  mem     REG      8,18      14608    4981420 /lib/x86_64-linux-gnu/libdl-2.23.so
```
You can also specify usernames with `lsof -u username`.

{% include links.html %}
