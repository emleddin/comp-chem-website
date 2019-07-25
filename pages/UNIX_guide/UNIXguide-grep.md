---
title: grep
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-grep.html
folder: UNIX_guide
---

The command line program `grep` recognizes matching patterns.
An example what `grep` can do is shown through the following line.
In the line, the `-e` flag tells the program to search for patterns starting
with special characters, the `\|`  (which is a [pipe](UNIXguide-pipe.html)...
more on that later) allows multiple things to be found (essentially an "or"
feature), and the `>` directs the output to a new file.
The whole slew of what you're looking for should be in open quotes.
```bash
$ grep -e '^ATOM\|^HETATM\|^TER\|^END' 1A31_cleanup_o.pdb > 1A31_cleanup_o2.pdb
```
If you used something like
```bash
$ grep 'word*' *.txt
```
then all of the matching lines starting with "word" found in text files would
be printed to the Terminal.

{% include links.html %}
