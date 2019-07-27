---
title: top
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-top.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

To see what processes (aka, what's taking up all of your CPUs) are running on
your computer, use `top`.

{% include image.html file="top.png" alt="different process IDs and general
information for all running tasks" caption="Use of `top` to show different
processes." %}

The way to exit `top` is by hitting `q`.
To the very left is the process ID (PID). That number can be used to kill
processes with [kill](UNIXguide-kill.html).

{% include links.html %}
