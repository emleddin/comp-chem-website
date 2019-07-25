set encoding iso_8859_1
#set term postscript enhanced color font "Arial,24";
set terminal pngcairo enhanced color font "Arial,24" size 1000,750;

set xlabel "Time in Grad School (Months)"
set ylabel "Bad *nix Jokes"
set xrange [0:80]
set key box top left font "Arial,18" width -1 maxrows 6

set output "test-point.png";
plot "test-line.dat" u ($1):($2+40) w points t "pt 1" pt 1 lw 4, \
"test-line.dat" u ($1):($2+43) w points t "pt 2" pt 2 lw 4, \
"test-line.dat" u ($1):($2+46) w points t "pt 3" pt 3 lw 4, \
"test-line.dat" u ($1):($2+49) w points t "pt 4" pt 4 lw 4, \
"test-line.dat" u ($1):($2+52) w points t "pt 5" pt 5 lw 4, \
"test-line.dat" u ($1):($2+55) w points t "pt 6" pt 6 lw 4, \
"test-line.dat" u ($1):($2+58) w points t "pt 7" pt 7 lw 4, \
"test-line.dat" u ($1):($2+61) w points t "pt 8" pt 8 lw 4, \
"test-line.dat" u ($1):($2+64) w points t "pt 9" pt 9 lw 4, \
"test-line.dat" u ($1):($2+67) w points t "pt 10" pt 10 lw 4, \
"test-line.dat" u ($1):($2+70) w points t "pt 11" pt 11 lw 4, \
"test-line.dat" u ($1):($2+73) w points t "pt 12" pt 12 lw 4, \
"test-line.dat" u ($1):($2+76) w points t "pt 13" pt 13 lw 4, \
"test-line.dat" u ($1):($2+79) w points t "pt 14" pt 14 lw 4, \
"test-line.dat" u ($1):($2+82) w points t "pt 15" pt 15 lw 4, \
"test-line.dat" u ($1):($2+85) w points t "pt 16" pt 16 lw 4, \
"test-line.dat" u ($1):($2+88) w points t "pt 17" pt 17 lw 4, \
"test-line.dat" u ($1):($2+91) w points t "pt 18" pt 18 lw 4;