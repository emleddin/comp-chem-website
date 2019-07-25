---
title: ln: Symbolic Links
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-ln.html
folder: UNIX_guide
---

Symbolic links are redirects to a specific file location.
Instead of copying a file or folder, you can just provide a link to that in
your current working directory, which saves disk space.
They can also be used to make scripting easier.
The command to create a symbolic link is `ln`.
The general syntax is:
```bash
$ ln -s actual_file symbolic_link
```
In the following example, a symbolic link is created for the `example.txt` file
in the home directory to appear on the `Desktop`.
The entire file path for both the origin file and the file's symbolic link
location must be specified.
Then, from the Desktop, `ls -lthr` is used to demonstrate the link is indeed a
link, which is specified by the `->`}
```bash
$ ln -s ~/example.txt ~/Desktop
$ ls -lthr
lrwxrwxrwx 1 simon simon   24 Mar 21 11:03 example.txt -> /home/simon/example.txt
```
Symbolic links can be removed by using [rm](UNIXguide-rm.html) on the link.
Specifying that links are links in the link's name may be helpful if you
regularly get lost inside your Terminal.

{% include links.html %}
