---
title: "Cntrl+R: History's Pal"
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-cntrl-r.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

While [history](UNIXguide-history.html) will bring up a log of past commands,
using `Cntrl+R` will allow you to search through old commands.
When I search for "qsub" on insert_computer_cluster, my most recent submission
involving "qsub" appears.
I can continue going through previous options using `Cntrl+R` again.
```bash
(reverse-i-search)\`qsub\': qsub basher.sh
```
Pressing an arrow key will bring you out of the search and back to the command
prompt, so you can edit the command before executing.
As always, [Cntrl+C](UNIXguide-cntrl-c.html) will end the search.

{% include links.html %}
