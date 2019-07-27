---
title: ping
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-ping.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

One way to check that computers are online (or responsive) is through `ping`.
This command demonstrates how much information (packets) is transmitted and how
many are received.
If both transmitted and received have the same number, then the computer is
online and accessible.
```bash
euid123@computer1:~$ ping computer2
PING computer2 (10.144.120.1) 56(84) bytes of data.
64 bytes from computer2 (10.144.120.1): icmp_seq=1 ttl=64 time=0.457 ms
64 bytes from computer2 (10.144.120.1): icmp_seq=2 ttl=64 time=0.486 ms
64 bytes from computer2 (10.144.120.1): icmp_seq=3 ttl=64 time=0.380 ms
^C
--- computer2 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 1998ms
rtt min/avg/max/mdev = 0.380/0.441/0.486/0.044 ms
```
To get out of `ping`, [Cntrl+C](UNIXguide-cntrl-c.html) must be used.
If the computer isn't on the same network, then a hostname issue will be
returned.
If the computer is offline, an "unreachable" message will be returned.

{% include links.html %}
