---
title: ssh with Graphical Forwarding (X11)
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-ssh-with-graphical.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

There is a way to set up graphical forwarding (known as X11 forwarding).
Basically, this means that visual windows opened through the Terminal are
forwarded to your screen.
X11 capability is available through
[PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
and [MobaXterm](https://mobaxterm.mobatek.net/) on Windows, XQuartz on Mac,
and the regular Terminal on Linux.
Sending computers (where you've accessed via `ssh`), and receiving Unix-like
machines need to have two options located in `/etc/ssh/sshd_config` enabled.
These are `X11Forwarding yes` and `X11UseForwarding yes`.

Once these things have been configured, you can start an `ssh` session with
X11 forwarding through
```bash
$ ssh -Y euid123@location
```
The `-Y` uses a secure connection.
Otherwise, a `-X` flag can be used if security isn't a major concern.
To check the X11 forwarding, the commands `xclock` or `xeyes` can be used.

{% include image.html file="UNIXguide/xclockeyes.png" alt="xclock and xeyes"
caption="Use of `xclock` (left) and `xeyes` (right) to test X11 forwarding." %}

{% include links.html %}
