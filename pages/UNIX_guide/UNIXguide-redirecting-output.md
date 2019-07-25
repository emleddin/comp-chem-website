---
title: "> and >>: redirecting output"
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-redirecting-output.html
folder: UNIX_guide
---

For many commands (or even programs), the standard response when they are run
is to print the output to the Terminal.
Instead of this, putting the greater than sign (`>`) in your command can force
the output to go to a new file.
There are two choices for this.
The first is a single `>`, which will redirect to a file and overwrite the
output.
The second is having two (`>>`), which will redirect output to a file, but
append the redirected output (i.e. it'll just attach the new to the end of the
old).
```bash
$ echo "ECHOOOOOOOOOOOOOOOO"
ECHOOOOOOOOOOOOOOOO
$ echo "ECHOOOOOOOOOOOOOOOO" > call_and_response.txt
$ cat call_and_response.txt
ECHOOOOOOOOOOOOOOOO
```
And, what's that, a [cat](UNIXguide-cat.html)? What an intro to the next
section!

{% include links.html %}
