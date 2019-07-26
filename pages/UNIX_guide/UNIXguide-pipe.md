---
title: The Pipe
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-pipe.html
folder: UNIX_guide
---

There's something on the keyboard that looks like a straight line or a weird
colon that shares the key with `\`, and that thing is called a pipe (`|`).
Use of a pipe allows you to combine multiple commands into a single line, and
"piping" allows you to use the output of a command as the input of the
following command.
To use it in the command, hit `Shift+\`.
One of my most commonly used pipe commands is:
```bash
cat rmsd_all.dat | awk '{print 0.1*$1, $2}' > new_rmsd_protein.dat
```
That command prints out the information from the data file, then prints out
only the two columns I want and places it in a new file.

{% include image.html file="UNIXguide/pipe.png" alt="Location of the pipe on the
keyboard. It is the uppercase of the backslash key." caption="Gaze upon the
pipe (`|`)." %}

{% include links.html %}
