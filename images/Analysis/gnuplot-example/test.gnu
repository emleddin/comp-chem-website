set encoding iso_8859_1
#set term postscript enhanced color font "Arial,24";
set terminal pngcairo enhanced color font "Arial,24" size 1000,750;

set xlabel "Value ({\260})"
set ylabel "Value ({\305})"
set xrange [1:80]
set key outside right Left reverse width 2 height 1 font "Arial,18" maxrows 3

set xtics ("Start" 0, 20, "Half" 40, 60, "End" 80) border nomirror out;
set x2tics border nomirror out rotate by 15 ("Etwas" 55)

set arrow 1 from first 50,400 to first 60,400 lw 2 heads
set label "Hi Mom" at 50,600 font ",18"

set output "test-image.png";
plot "test.dat" u ($1):($2) w boxes t "Boxes" lw 4, \
"test.dat" u ($1):($2) w points t "Points" lw 4, \
"test.dat" u ($1):($2) w lines s bezier t "Lines" lw 4;