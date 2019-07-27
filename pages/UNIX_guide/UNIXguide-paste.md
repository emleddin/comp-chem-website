---
title: paste
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-paste.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

You can combine multiple files together using the `paste` command.
If you have a file named `numbers.txt` (that's literally just a list of
numbers) and a file you'd like numbered (say `greatcities.txt`), then you can
use the below to give you the list printed to the terminal.
```bash
$ paste numbers.txt greatcities.txt
1	Heidelberg
2	Chicago
3	New Lenox
4	Denton
5	Kirksville
```
Obviously, you can use [>](UNIXguide-redirecting-output.html) to direct the
output to a new file.
It is also good to note that default `paste` use will create the output with a
tab delimiter.
Changing delimiters can be done through the `-d` flag.

{% include links.html %}
