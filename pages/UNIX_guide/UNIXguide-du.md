---
title: du
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-du.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

The `du` command allows you to check how much storage space is available on the
computer.
There are two flags that make `du` much more managable: `-h`
(for human-readable) and `-s` for summary.
Human-readable format translates the number of bytes into bigger sizes
(like KB, MB, GB, TB, etc.).
Summary totals the amount of space for a folder.
Running without the summary will provide individual file sizes.

\begin{lstlisting}[style=P1]
[euid123@talon3 ~]$ du
4	./.mozilla/plugins
4	./.mozilla/extensions
12	./.mozilla
4	./.nv/ComputeCache
8	./.nv
8	./.ssh
52777464	./A/A/A
52777468	./A/A/B
4267968	./A/B
50819328	./A/D/A
52509684	./A/D/B
50339308	./A/D/C
----MORE-----
379862560	.
[euid123@cruntch3 ~]$ du -h
4.0K	./.mozilla/plugins
4.0K	./.mozilla/extensions
12K	./.mozilla
4.0K	./.nv/ComputeCache
8.0K	./.nv
8.0K	./.ssh
51G	./A/A/A
51G	./A/A/B
4.1G	./A/B
49G	./A/D/A
51G	./A/D/B
49G	./A/D/C
----MORE-----
363G	.
[euid123@talon3 ~]$ du -sh
363G
\end{lstlisting}

{% include links.html %}
