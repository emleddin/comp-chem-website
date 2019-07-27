---
title: "*: Wildcards"
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-wildcards.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

No, we're not playing UNO.
Wildcards are what asterisks are called, because they have many functions,
including making lives easier.
Say you want to copy every file that has the same extension (like `.txt`) from
a folder.
To do that, you can do something like
```bash
$ cp *.txt /path/to/other/directory/
```
Each file will have the same name as it did in the original directory.
Similarly, all the `.txt` files from a folder can be permanently deleted with
```bash
$ rm *.txt
```
If you wanted to list everything that had the `.txt` extension, then you would use
```bash
$ ls *.txt
```
I'm sure you can see how wildcards are helpful.
The only other useful thing that I'll mention here is that if you had things
that were the same at the beginning and end, you can use a wildcard for their
point of difference.
So something like `All_These_<sup>\*</sup>Files.txt` would pertain to anything
under those conditions, such as `All_These_Bloody_Files.txt` or
`All_These_Silly_Files.txt`.

{% include links.html %}
