---
title: date, cal, and time
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-date-cal-time.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

# date {#date}

No, you're not asking the Terminal out with the `date` command.
You're simply asking what time and day it is.
```bash
$ date
Thu Mar  8 21:11:04 CST 2018
```

# cal {#cal}

Like date, you can print a calendar to the terminal with `cal`.
The current date is highlighted.
```bash
$ cal
     March 2018       
Su Mo Tu We Th Fr Sa  
              [1]  2  3  
 4   5  6  7   8  9 10  
11 12 13 14 15 16 17  
18 19 20 21 22 23 24  
25 26 27 28 29 30 31  
```

# time {#time}

The `time` command can be used to give information about the time a command or
process takes to run.
It has a man page, which is kind of elusive on bash systems, as `time` is a
builtin (within the shell) there.

If you want to figure out how long a command takes to execute (like
    [scp](UNIXguide-scp.html), for example), you can use the following (where
        `command` is the command you're testing).
Bash shell on Ubuntu:
```
$ /usr/bin/time -p command
0.00user 0.00system 0:00.00elapsed 0%CPU (0avgtext+0avgdata 2432maxresident)k
0inputs+0outputs (0major+103minor)pagefaults 0swaps
```
Bash shell on Mac OSX:
```bash
$ /usr/bin/time -p command
---
        0.00 real         0.00 user         0.00 sys
$ time command
real	0m0.017s
user	0m0.003s
sys	0m0.008s
```

{% include links.html %}
