set encoding iso_8859_1
#set term postscript enhanced color font "Arial,24";
set terminal pngcairo enhanced color font "Arial,24" size 1000,750;

set xlabel "Age of Spiders Georg (Months)"
set ylabel "Jeopardy Score"
set xrange [0:80]
set key bottom right font "Arial,18"

set output "test-line.png";
plot "test-line.dat" u ($1):($2-10) w lines s bezier t "dt 1 lw 1" lt 1 lw 1 dt 1, \
"test-line.dat" u ($1):($2-8) w lines s bezier t "dt 2 lw 2" lt 2 lw 2 dt 2, \
"test-line.dat" u ($1):($2-6) w lines s bezier t "dt 3 lw 3" lt 3 lw 3 dt 3, \
"test-line.dat" u ($1):($2-4) w lines s bezier t "dt 4 lw 4" lt 4 lw 4 dt 4, \
"test-line.dat" u ($1):($2-2) w lines s bezier t "dt 5 lw 5" lt 5 lw 5 dt 5, \
"test-line.dat" u ($1):($2) w lines s bezier t "dt 6 lw 6" lt 6 lw 6 dt 6, \
"test-line.dat" u ($1):($2+2) w lines s bezier t "dt 7 lw 7" lt 7 lw 7 dt 7, \
"test-line.dat" u ($1):($2+4) w lines s bezier t "dt 8 lw 8" lt 8 lw 8 dt 8, \
"test-line.dat" u ($1):($2+6) w lines s bezier t "dt 9 lw 9" lt 9 lw 9 dt 9, \
"test-line.dat" u ($1):($2+8) w lines s bezier t "dt 10 lw 10" lt 10 lw 10 dt 10, \
"test-line.dat" u ($1):($2+10) w lines s bezier t "dt 11 lw 11" lt 11 lw 11 dt 11;