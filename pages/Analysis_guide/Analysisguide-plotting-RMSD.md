---
title: "Plotting RMSD, RMSF, and Total Number of Hydrogen Bonds with gnuplot"
sidebar: Analysis_sidebar
permalink: Analysisguide-plotting-RMSD.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

[Gnuplot](http://www.gnuplot.info/) is a freely available plotting utility that
can be used to make publication-worthy images.
The utility is command line operated, and can be used with a scripted input.

Gnuplot scripts end with the `.gnu` extension.
To use gnuplot with a script, you would use a command like:
```bash
$ gnuplot scriptname.gnu
```

In the following script, `set encoding iso_8859_1` makes it so that the &#8491;
symbol can be encoded by using `{\305}`.
The script also assumes that this is in a general directory, with additional
system directories contained inside (think they're folder B, but you're in
folder A), which is why the path to the data files is set as such.
Another note to make is that the `$1/500` converts the frames to your
nanosecond timescale--you'll need to change it based on what your simulation's
conversion is.
Additional details about gnuplot scripts can be found on the
[gnuplot documentation](http://www.gnuplot.info/documentation.html)
and in the [gnuplot section](Analysisguide-gnuplot.html) later in this guide.

## `rmsd-etc.gnu` {#rmsd-etc}

(Thank's Alice!)
```Gnuplot
set encoding iso_8859_1
set term postscript enhanced color font "Arial,24";

set xlabel "Time (ns)"
set ylabel "RMSD ({\305})"
set key left bottom Left reverse
#set yrange [1.5:4]

set output "rmsds.eps";
plot "WT-system/WT_protein_system_total_bb_rms.dat" u ($1/500):($2) w lines s bezier t "Wild Type" lw 4, \
"MUT-A-system/MUT_A_system_total_bb_rms.dat" u ($1/500):($2) w lines s bezier t "Mutation A" lw 4, \
"MUT-B-system/MUT_B_system_RNA_total_bb_rms.dat" u ($1/500):($2) w lines s bezier t "Mutation B" lw 4, \
"MUT-C-system/MUT_C_system_total_bb_rms.dat" u ($1/500):($2) w lines s bezier t "Mutation C" lw 4;

set xlabel "Time (ns)"
set ylabel "Number of hydrogen bonds"

set output "hbonds.eps";
plot "WT-system/WT_protein_system_hbond.dat" u ($1/500):($2) w lines s bezier t "Wild Type" lw 4, \
"MUT-A-system/MUT_A_system_hbond.dat" u ($1/500):($2) w lines s bezier t "Mutation A" lw 4, \
"MUT-B-system/MUT_B_system_hbond.dat" u ($1/500):($2) w lines s bezier t "Mutation B" lw 4, \
"MUT-C-system/MUT_C_system_hbond.dat" u ($1/500):($2) w lines s bezier t "Mutation C" lw 4;

set xlabel "Residue number"
set ylabel "RMSF ({\305})"
set key top left Left reverse
set xrange [0:455]
#set yrange [0:7]

set output "rmsf.eps";
plot "WT-system/WT_protein_system_rmsf_byres.dat" u 1:2 w lines t  "Wild Type" lw 4, \
"MUT-A-system/MUT_A_system_rmsf_byres.dat" u 1:2 w lines t  "Mutation A" lw 4, \
"MUT-B-system/MUT_B_system_rmsf_byres.dat" u 1:2 w lines t "Mutation B" lw 4, \
"MUT-C-system/MUT_C_system_rmsf_byres.dat" u 1:2 w lines t "Mutation C" lw 4;
```

{% include links.html %}
