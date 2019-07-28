---
title: Interactive EDA Submission
sidebar: Analysis_sidebar
permalink: Analysisguide-interactive-EDA.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

Instead of using a script, the EDA program can be run through the PBS
scheduler interactively.
First, request a node for interactive submission with:
```bash
$ qsub -I -q my_cpu_alloc -N name-of-job-for-queue
```
After requesting a node, you can essentially follow through the start of the
EDA script.
```bash
$ module load intel/17.0
$ cd /home/euid123/path/to/files
$ ifort Residue_E_Decomp_07_15.f90 -o Residue_E_Decomp_07_15.x
$ ./Residue_E_Decomp_07_15.x
	Answer prompt 1 [Name of input file?]
	Answer prompt 2 [Name of prmtop?]
	Cntrl + Z
$ bg
$ top
```
The last three steps (`Cntrl + Z` through `top`) ensures that any ssh session
used to run the program won't terminate due to a broken pipe.
The job is temporarily suspended, forced to run in the background, and `top`,
which refreshes every 5 seconds, is used to keep the connection alive.
When the program is no longer listed on `top`, then you can exit the node/ssh 
connection.

Like [before](Analysisguide-EDA-PBS.html), Intel's ifort compiler doesn't
need to be used; gcc's gfortran can be used instead.

{% include links.html %}
