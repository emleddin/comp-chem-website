---
title: ls (and an intro to permissions and flags)
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-ls.html
folder: UNIX_guide
---

To list items in directories, the command `ls` is employed.
The "s" specifies that it is a short list, as opposed to `ll`, which is a long
list.
If you're unfamiliar with how the computer lists things the long way, `ls`
arranges the information in a more common way.
```bash
[euid123@computer ~]$ ls
bin        chm5710        lib        chm5660        dropbox        mdinputs        test-R
[euid123@computer ~]$ ll
total 28
drwxrwxr-x 12 euid123 eagle12 4096 Apr 22 14:31 bin
drwxrwxr-x   7 euid123 eagle12 4096 Dec 13 13:38 chm5660
drwxrwxr-x   3 euid123 eagle12 4096 Apr 12 11:08 chm5710
drwxrwxr-x   2 euid123 eagle12 4096 Aug 17     2018 dropbox
drwxr-xr-x   4 euid123 eagle12 4096 Apr 22 14:17 lib
drwxrwxr-x   5 euid123 eagle12 4096 Nov    5   2018 mdinputs
drwxrwxr-x   2 euid123 eagle12 4096 May 22 09:55 test-R
[euid123@computer ~]$ ls -lthr
total 28K
drwxrwxr-x   2 euid123 eagle12 4.0K Aug 17     2018 dropbox
drwxrwxr-x   5 euid123 eagle12 4.0K Nov    5   2018 mdinputs
drwxrwxr-x   7 euid123 eagle12 4.0K Dec 13 13:38 chm5660
drwxrwxr-x   3 euid123 eagle12 4.0K Apr 12 11:08 chm5710
drwxr-xr-x   4 euid123 eagle12 4.0K Apr 22 14:17 lib
drwxrwxr-x 12 euid123 eagle12 4.0K Apr 22 14:31 bin
drwxrwxr-x   2 euid123 eagle12 4.0K May 22 09:55 test-R
[euid123@computer ~]$
```
The above example shows several different listing options and what they produce.
Some of these have flags, denoted by their `-`, that place conditions or remove
restrictions on the command's use.
The flag in `ls -lthr` is actually a combination of 4 different flag types.
The `l` shows the long list formatting, the `t` displays newest files first
(based on their timestamp), the `h` puts file sizes in "human readable format",
and the `r` reverses their listing (so now the newer files are at the bottom).
Including an `a` flag (`ls -a`) for the short list lists everything in the
folder, including hidden files (explained further in
    [aliases](UNIXguide-aliases.html)).

In the long format, you can see different information blocks.
The `drwxr-xr-x` group shows the permissions associated with the files.
The first `d` tells you if the item is a directory (d) or not (-).
The next three letters, `rwx` show the user's permissions, which in this case
are given and include "__R__ ead," "__W__ rite," and "e __X__ ecute."
If these were not given, there would be more dashes.
The next three are the permissions for the user's group, and the final three
are for all users of the computer or cluster.
They follow the same rwx/rwx/rwx format.
Changing permissions is possible with the
[chmod](UNIXguide-local-jobs.html#chmod) command, which is discussed later on.

The next group tells you how many items are in the directory (2, 6, and 7,
    respectively).
The next group lists the owner (`euid123`).
After that is the group the permissions are assigned to (`eagle12`).
The final groups are the file size, the date and time modified, and the name
of the file or directory.
Note the difference in how file size is given based on the `-h` flag.

{% include links.html %}
