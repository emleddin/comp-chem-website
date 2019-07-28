---
title: Downloading VMD and ProDy
sidebar: Analysis_sidebar
permalink: Analysisguide-downloading-VMD.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

Visual Molecular Dynamics (VMD) has already been installed on the lab
computers, but you can also install it on a personal computer from
[here](http://www.ks.uiuc.edu/Research/vmd/) for free.

ProDy is a plugin compatible with VMD.
To install ProDy on a computer with pip installed, use `pip install -U ProDy`.
Otherwise, instructions are available from
[here](http://prody.csb.pitt.edu/downloads/).

To use ProDy, two Python dependencies are required (*biopython* and *numpy*).
If you have an Anaconda python installation, these can be installed with
`conda install biopython` and `conda install numpy`.
Otherwise, installing they can be installed the same way with pip.

{% include links.html %}
