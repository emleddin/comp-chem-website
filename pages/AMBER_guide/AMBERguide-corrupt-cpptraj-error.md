---
title: Corrupt <i>cpptraj</i> Warning
sidebar: AMBER_sidebar
permalink: AMBERguide-corrupt-cpptraj-error.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

Have you ever been trying to analyze a simulation that you KNOW worked,
but for some reason the analysis script that worked on every other replicate
isn't working for one of them?
And then you go to look at it and there are frames that are missing?
No? Just me? Fine. If you did, though, your *cpptraj* log (or error file or
wherever you get the *cpptraj* information printed to) may have this message:
```
Warning: Frame XXXX coords 1 & 2 overlap at origin; may be corrupt.
```

This can mean a few things, including but not limited to, a corrupted
simulation (the horror).
If you had rewritten the trajectory, though, it could just mean that the
rewrite was corrupted.
Corruption can happen for all sorts of reasons, like input/output errors,
problems with the computer just because it's a computer, random losses of
power... you get the idea.

Here's two things that *may* fix the problem.
1. Try rewriting the trajectory again.
2. Rerun *cpptraj* with the `check skipbadframes` option.
(You may be shocked that this skips frames that aren't good.)

{% include links.html %}
