---
title: "Using gnuplot's Multiplot Feature with Standard Deviations"
sidebar: Analysis_sidebar
permalink: Analysisguide-EDA-multiplot.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

You can use the `multiplot` feature to make stacked graphs.
The files generated with R contain information for standard deviation, so it is
possible to add error bars as well.

```Gnuplot
reset
dx=1.
n=2
total_box_width_relative=1.
gap_width_relative=0
d_width=(gap_width_relative+total_box_width_relative)*dx/2.
reset

set encoding iso_8859_1
set term pngcairo enhanced color font "Arial,30" size 1500,1050;
#set term postscript enhanced color font "Arial,24";

## Let's use gray colors, standard for each plot
# "Sys A" lc rgb "gray40"
# "Sys B" lc rgb "gray80"

#### STACKED PLOTS ######

set output "../total_interaction_systemA-systemB_yoff.png";
set tmargin 0
set bmargin 0
set lmargin 1
set rmargin 1
unset xlabel
set ylabel "Energy (kcal/mol)" offset 0,-4

unset arrow 1
unset arrow 2
unset arrow 3
unset label

set multiplot layout 2,1 margins 0.12,0.94,0.15,0.88 spacing 0,0

unset xtics
set yrange[-80:60]
set xrange[0:455]
set ytics ("" -80,-60,-40,-20,0,20,40,60) nomirror

set key autotitle column nobox samplen 1 noenhanced
set style data boxes
set x2tics border nomirror in out ("GS Linker" 334, "" 346,"DNA" 431, "" 451)

# System A
## Column 0 is the row number
## Toggle the commenting for the first 3 lines to have standard deviations
#plot "/absolute/path/to/the/analysis/files/for/WT-System-A/systemA_EDA_tot_avg.txt" u ($0):($3) w points t "System A" lw 4 pt 0 lc "black", \
#"/absolute/path/to/the/analysis/files/for/WT-System-A/systemA_EDA_tot_avg.txt" u ($0):($3):($3-$4):($3+$4):($3) w candlesticks  fs solid 0.15 t "Avg. Std. Dev." lc rgb "gray40", \
#"/absolute/path/to/the/analysis/files/for/WT-System-A/systemA_EDA_tot_avg.txt" u ($0):($3) w points notitle ls 1 pt 0 lc "black" lw 4;
plot "/absolute/path/to/the/analysis/files/for/WT-System-A/systemA_EDA_tot_avg.txt" u ($0):($3) w boxes t "System A" lc rgb "gray40"

unset ylabel
unset x2tics
set x2tics border nomirror in out ("" 334, "" 346,"" 431, "" 451) #"" 334, "" 346,
set xlabel "Residue number"
set xtics ("1130" 0, "1180" 50, "1230" 100, "1280" 150, "1330" 200, "1380" 250, "1430" 300, \
     "1845" 350, "1895" 400) border nomirror out; #"" 334, "" 346, "" 431
set ytics (-80, -60,-40,-20,0,20,40, "" 60) nomirror

#System B
## Column 0 is the row number
## Toggle the commenting for the first 3 lines to have standard deviations
#plot "//absolute/path/to/the/analysis/files/for/WT-System-B/systemB_EDA_tot_avg.txt" u ($0):($3) w points t "System B" lw 4 pt 0 lc "black", \
#"/absolute/path/to/the/analysis/files/for/WT-System-B/systemB_EDA_tot_avg.txt" u ($0):($3):($3-$4):($3+$4):($3) w candlesticks  fs solid 0.15 t "Avg. Std. Dev." lc rgb "gray40", \
#"/absolute/path/to/the/analysis/files/for/WT-System-B/systemB_EDA_tot_avg.txt" u ($0):($3) w points notitle ls 1 pt 0 lc "black" lw 4;
plot "/absolute/path/to/the/analysis/files/for/WT-System-B/systemB_EDA_tot_avg.txt" u ($0):($3) w boxes t "System B" lc rgb "gray40"

unset multiplot
```

{% include links.html %}
