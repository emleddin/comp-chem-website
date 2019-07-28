---
title: "Custom Settings at Start-Up"
sidebar: Analysis_sidebar
permalink: Analysisguide-gnuplot-settings.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

A file titled `.gnuplot` can be created in your home directory
(`/home/username`) with settings for Gnuplot to use at startup.
If you're running on a non-Unix-like system (*cough* Windows), then this
file should be titled `GNUPLOT.INI`.

Gnuplot has 8 preset line types that it cycles through when generating graphs.
These 8 preset lines are made using colors that are shown to work well for
colorblind people.
If you regularly make plots with more than 8 lines, you may wish to define new
line types in the `.gnuplot` file.

An example `.gnuplot` file, based on the default but with two additional lines.
Line 9 is salmon-colored and line 10 is lightslategray.
```gnuplot
set linetype 1 lc rgb "dark-violet" lw 2 pt 0
set linetype 2 lc rgb "sea-green" lw 2 pt 7
set linetype 3 lc rgb "cyan" lw 2 pt 6 pi -1
set linetype 4 lc rgb "dark-red" lw 2 pt 5 pi -1
set linetype 5 lc rgb "blue" lw 2 pt 8
set linetype 6 lc rgb "dark-orange" lw 2 pt 3
set linetype 7 lc rgb "black" lw 2 pt 11
set linetype 8 lc rgb "goldenrod" lw 2
set linetype 9 lc rgb "#FA8072" lw 4 pt 1
set linetype 10 lc rgb "#778899" lw 4 pt 1
set linetype cycle 10
```

The first 8 colors in the default (and this example) are set based upon colors
that are readable for people with different types of color blindness.
Some good articles on picking contrasting colors can be found
[on the somersault18:24 blog](http://www.somersault1824.com/tips-for-designing-scientific-figures-for-color-blind-readers/) and [on J*Fly](http://jfly.iam.u-tokyo.ac.jp/color/index.html).

{% include links.html %}
