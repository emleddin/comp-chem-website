---
title: cp
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-cp.html
folder: UNIX_guide
---

Copying files locally can be achieved through `cp`.
This command can be used to copy a file in the same directory, or copy it from
a directory to another directory.
The following example demonstrates copying a file titled `current_name.txt` to
a file titled `copy.txt`.
```bash
$ cp current_name.txt copy.txt
```
That wasn't so bad!
Now, if I had a file in directory `A`, but I want it to have the same name in
directory `C`, I would follow:
```bash
A$ cp current_name.txt /path/to/dirC/copy.txt
```
where `/path/to/dirC/` would be based on whatever `pwd` says from inside
directory `C`.
Entire directories can be copied by making the copy recursive with the `-r` flag.
This means the folder, and its contents, will all be copied to the location you
specify.
```bash
$ cp -r Folder_A/ Folder_B/
```

{% include links.html %}
