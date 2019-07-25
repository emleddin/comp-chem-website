---
title: reboot
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-reboot.html
folder: UNIX_guide
---

Occasionally, you'll need to reboot (restart) a computer through the command
line.
Believe it or not, there are multiple death screens before the blue screen of
death (*cough* the black screen with white underscore *cough*), which make it
difficult to safely reboot a computer.
Thus, through a Terminal via [ssh](UNIXguide-ssh.html), you can use
```bash
$ sudo reboot
```
and enter the sudo password.
The connection will automatically disconnect, which makes sense because it is
restarting.
It is always a good idea to use [top](UNIXguide-top.html) and
[nvidia-smi](UNIXguide-nvidia-smi.html) (if there's a graphics card) to ensure
that other users are not in the middle of important jobs or processes. 
The polite thing in that situation would be to ask if you can reboot, and then
proceed with rebooting.

{% include links.html %}
