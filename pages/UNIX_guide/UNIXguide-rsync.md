---
title: rsync
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-rsync.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

A way to copy files to protect against newer files being overwritten by those
being transferred is using rsync.
This is not recommended between personal computers and UNT computer clusters,
as it takes a lot of time due to the fact-checking nature of the command.
Essentially, if folder A has files 1-23, and folder B has files 20-35, then
files 1-19 will be copied just fine.
Files 20-23 will only be copied if the files in B have an older "last updated"
stamp.

For this example, navigate to the folder that you want things to be copied from.
The `*` (asterisk) specifies "from here."
```bash
$ rsync -azvp --progress * euid123@talon3.hpc.unt.edu:/home/euid123/directory
```
The flags in the order of `azvp` stand for archive, compress, verbosity, and
permissions.
Essentially, the files will be compressed to cut down on transfer time and the
permissions won't change on the synced files.
Additionally, the `--progress` portion will show completion information for
each file being transferred.

For this example, navigate to the folder that you want things to be copied into.
The last bit (`* .`) basically says "from there to here."
```bash
$ rsync -azvp --progress euid123@talon3.hpc.unt.edu:/home/euid123/directory/* .
```
This will copy the files from Talon3 to the local computer.
The reason both types are specified for rsync is because sometimes the way the
computer systems you work with will only allow one or the other (because they
    hate you).
So, it is helpful to be able to work both ways.

{% include links.html %}
