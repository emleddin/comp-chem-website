---
title: w
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-w.html
folder: UNIX_guide
---

The {\fontfamily{pcr}\selectfont\textbf{w}} command combines the {\fontfamily{pcr}\selectfont\textbf{{\hyperref[sec:uptime]{uptime}}}} and {\fontfamily{pcr}\selectfont\textbf{{\hyperref[sec:who]{who}}}} commands into
a single letter.
It also shows what users are currently doing, and where they are logged in from.
```bash
$ w
 09:05:19 up 5 days, 17:59,  1 user,  load average: 0.00, 0.00, 0.00
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
euid123  pts/8    10.144.120.74    09:05    1.00s  0.04s  0.00s w
```
The load averages in this example look a lot better, since this command was run
on a Linux system. :smiley:

{% include links.html %}
