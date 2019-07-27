---
title: tar
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-tar.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

A common way of packaging up files into a single combined file is to use the
`tar` command to create a tarball.
Oftentimes, the source code for a program is downloadable as a tarball file,
since it's easier to distribute and receive.
The following command shows the basic syntax, where a folder (or folders) or a
bunch of files can be made into a tarball.
It is common to just put the files into a single folder and `tar` that folder.
```bash
$ tar [options] tarball.tar folder/files
```
The `tar` command is used to both package and unpackage tarballs.
Thus, the options used are important. Using the `-z` flag will zip the folder
(and thus compress its contents), and yield the `.tgz` extension.
The `-v` flag stands for verbose and prints as much information as possible
while using the command.
The `-f` flag specifies that the contents should be put into an archive file.
Finally, the `-c` flag specifies that the tarball will be created.
```bash
$ tar -zcvf tarball.tgz folder/
```
To unpack a tarball, use the `-x` flag (for extract) instead of the `-c`
(creation) flag.
```bash
$ tar -zxvf tarball.tgz
```
If the tarball extension was `.tar` instead of `.tgz`, then you wouldn't need
to include the `-z` flag, since the file wasn't compressed through
[gzip](UNIXguide-gzip.html) during creation.
[Note: if you wish to compress the file using [bzip2](UNIXguide-bzip2.html),
use a `-j` flag instead of the `-z` flag.]

{% include links.html %}
