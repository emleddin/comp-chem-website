---
title: Locally Running EDA
sidebar: Analysis_sidebar
permalink: Analysisguide-run-EDA.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

The EDA program can be compiled and run locally at your workstation.
To achieve this with a program edition titled `Residue_E_Decomp_07_15.f90`,
perform:
```bash
$ gfortran Residue_E_Decomp_07_15.f90 -o Residue_E_Decomp_07_15.x
$ ./Residue_E_Decomp_07_15.x
```
The program will look for an input file
(ex: [here](Analysisguide-EDA-input.html)) and whatever prmtop file should be
used with your specified mdcrd.
If you use a strip command in your *cpptraj* ASCII generation, then you'll need
a stripped prmtop (either made with the `outprefix` option of the strip command
or generated through the [<i>parmed</i>](Analysisguide-parmed.html) program
in AmberTools).

{% include links.html %}
