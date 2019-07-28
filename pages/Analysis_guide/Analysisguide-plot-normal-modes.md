---
title: Plotting Normal Modes with gnuplot
sidebar: Analysis_sidebar
permalink: Analysisguide-plot-normal-modes.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

[Gnuplot](http://www.gnuplot.info/) is a freely available plotting utility.

The following (`normalmodeplot.gnu`) is an example gnuplot script that can be
used to generate graphs of the first three normal modes for a specific system.
This script would be in a directory that contained the directories of the 
individual systems (4 plots are being generated with this one script
as-written), which are then accessed individually in the plot command.
The individual .dat files are the ones that were created using
[NMWiz and ProDy](Analysisguide-loading-protein.html).
The number of residues should be changed in the `set xrange [0:500]` line to
reflect the number of residues of the protein, and the `set x2tics` line should
have __"DNA"  400__ reflect the residue number where DNA actually begins
(if there is any; otherwise delete it or comment it out).
```Gnuplot
set encoding iso_8859_1
set term postscript eps enhanced color font "Helvetica, 20";

unset ytics
set xlabel "Residue Number"
set ylabel "PCA Square Fluctuations"
set xrange [1:500]
set xtics border nomirror out
set x2tics border nomirror out rotate by 25 ("DNA" 400)
set boxwidth 0.25
set style fill solid

set output "WT_protein_system_modes.eps";
plot "WT-system/WT-system_mode1.dat" u 1:2 w boxes t "Mode 1" lw 3, \
"WT-system/WT-system_mode2.dat" u 1:2 w boxes t "Mode 2" lw 3, \
"WT-system/WT-system_mode3.dat" u 1:2 w boxes t "Mode 3" lw 3;

set output "MUT-A-system_modes.eps";
plot "MUT-A-system/MUT-A-system_mode1.dat" u 1:2 w boxes t "Mode 1" lw 3, \
"MUT-A-system/MUT-A-system_mode2.dat" u 1:2 w boxes t "Mode 2" lw 3, \
"MUT-A-system/MUT-A-system_mode3.dat" u 1:2 w boxes t "Mode 3" lw 3;

set output "MUT-B-system_modes.eps";
plot "MUT-B-system/MUT-B-system_mode1.dat" u 1:2 w boxes t "Mode 1" lw 3, \
"MUT-B-system/MUT-B-system_mode2.dat" u 1:2 w boxes t "Mode 2" lw 3, \
"MUT-B-system/MUT-B-system_mode3.dat" u 1:2 w boxes t "Mode 3" lw 3;

set output "MUT-C-system_modes.eps";
plot "MUT-C-system/MUT-C-system_mode1.dat" u 1:2 w boxes t "Mode 1" lw 3, \
"MUT-C-system/MUT-C-system_mode2.dat" u 1:2 w boxes t "Mode 2" lw 3, \
"MUT-C-system/MUT-C-system_mode3.dat" u 1:2 w boxes t "Mode 3" lw 3;
```

{% include links.html %}
