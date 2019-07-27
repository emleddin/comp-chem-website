---
title: Run Programs
sidebar: AMBER_sidebar
permalink: AMBERguide-run-programs.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

There are a few programs that run AMBER simulations, and their input
files/functionality varies slightly. First, there's *sander*
(<b>S</b>imulated <b>A</b>nnealing with <b>N</b>MR-<b>D</b>erived <b>E</b>nergy
<b>R</b>estraints). Then there's *pmemd* (<b>P</b>article <b>M</b>esh
<b>E</b>wald <b>M</b>olecular <b>D</b>ynamics), which builds upon *sander*.
Finally, exists *pmemd.cuda*, which allows for GPU-acceleration of molecular
dynamics (CUDA because it runs on NVIDIA graphics cards. Amazing). 
Both *sander* and *pmemd* are fairly input-compatible, but check the manual
before switching between the two.
I've most often used *pmemd*, because the groups I've been in tend to run
production steps using *pmemd.cuda*.

{% include links.html %}
