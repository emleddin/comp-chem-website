---
title: uptime
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-uptime.html
folder: UNIX_guide
---

Computers (like humans) get finicky when they've been awake for a long time.
To check the amount of time that a computer has been online, use the `uptime` \
command.
```bash
$ uptime
 8:37  up 8 days, 17:19, 2 users, load averages: 1.75 1.98 2.10
```
The response displays how long the system has been running, how many users are
currently logged in, and the load average for 1, 5, and 15 minute intervals.
Load average should ideally stay around 0.70*(number of CPU cores) for Linux
systems.
A load average of 1.0 per core would essentially mean the system has a full
lane of traffic, and over 1.0 means there are cars stopped on the highway
on-ramp waiting for a chance into traffic.
It is important to know that macOS's load averages act differently, so a
completely idle system would show a load average of 1.0.
If things are amiss, check the Activity Monitor application.

{% include links.html %}
