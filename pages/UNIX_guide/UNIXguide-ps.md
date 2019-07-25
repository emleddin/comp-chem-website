---
title: ps
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-ps.html
folder: UNIX_guide
---

Another way to see what processes are running, but only for what is in your
current shell or window, is with `ps`.
With `ps`, the `PID` is the process identifier, `TTY` shows the Terminal window
running the process, and `CMD` is the command that is running.
```bash
[euid123@cruntch3 ~]$ ps
   PID TTY          TIME CMD
 60966 pts/12   00:00:00 bash
 61012 pts/12   00:00:00 ps
```
Because the example was run in a `bash` environment, that appears as a line.
If it were run in a C shell script, `csh` would appear.

{% include links.html %}
