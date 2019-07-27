---
title: ifconfig
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-ifconfig.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

Let's start with definitions: IP and MAC.
IP stands for Internet Protocol, and is the numeric number assigned to a
computer network access the internet.
MAC stands for Media Access Control, and the address is the device's unique
identifier for the network adapter.
Determining IP and MAC addresses can be accomplished through visiting
`/sbin/ifconfig`.
You don't even need [cd](UNIXguide-cd.html) to do it!
```bash
euid123@comp:~$ /sbin/ifconfig
enp0s31f6 Link encap:Ethernet  HWaddr 4c:cc:6a:30:f9:c6  
          inet addr:10.144.120.1  Bcast:10.144.120.255  Mask:255.255.255.0
          inet6 addr: fe80::9d22:8f52:cb14:fb7f/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:40194 errors:0 dropped:0 overruns:0 frame:0
          TX packets:31924 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:21634036 (21.6 MB)  TX bytes:22810381 (22.8 MB)
          Interrupt:16 Memory:df200000-df220000

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:774 errors:0 dropped:0 overruns:0 frame:0
          TX packets:774 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1
          RX bytes:69303 (69.3 KB)  TX bytes:69303 (69.3 KB)
```
The initial text block `enp0s31f6` contains information referring to the
computer's Ethernet port.
The MAC address is listed under `HWaddr`, and the IP address is listed under
`inet addr`.

{% include links.html %}
