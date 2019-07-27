---
title: scp
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-scp.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

Secure copy, or `scp`, is a primary means (along with
    [rsync](UNIXguide-rsync.html)) of copying files between
    computers/clusters/etc.
It works in a similar way to `cp`, but with some of the information of
`ssh` thrown in.
```bash
$ scp current_name.txt euid123@talon3.hpc.unt.edu:~/testingR/copy.txt
```
In this example, the item `current_name.txt` is being copied from the local
computer (or wherever you're currently located) to the user `euid123` on the
device `talon3.hpc. unt.edu`.
The file is being copied to the the folder `testingR` off the home directory
(remember the tilde) of user `euid123`.
Since the file name was changed (it doesn't have to be; if it isn't, then the
`copy.txt` portion is either left off or also `current_name.txt`),
it was included in the path.
After this command is run, a password prompt will appear, asking for the
password of `euid123@talon3.hpc.unt.edu`.
After that is input, then the copying begins.
Another use for `scp` is to copy entire directories, and not just files, and
it is thus very useful.
For copying an entire directory, the `-r` (recursion) flag must be used.
```bash
$ scp -r directory/ place@to.go.to:~/location/
```

{% include links.html %}
