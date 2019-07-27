---
title: pwd
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-pwd.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

If you ever get lost in your computer, then `pwd` is for you.
This command stands for "print working directory" or "pathway directory."
It prints your current location.
For example, if you're located in a shared `insert_PI_here_group` folder and
used `pwd`, it'd look like:
\begin{lstlisting}[style=P1]
$ pwd
/storage/scratch/share/insert_PI_here_group/
\end{lstlisting}
This location can be copied from the command line and pasted into various
locations where it is needed (like code input lines).
Paths are important for programs, copying files, creating new files; many
commands are path-dependent.
Think of the path as the computer's Google Maps.
Without it, you wouldn't get anywhere.
Similarly, you can think of an [alias](/UNIXguide-aliases.html) as the routes
you use so often, you have them memorized.

{% include links.html %}
