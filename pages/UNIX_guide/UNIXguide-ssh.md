---
title: ssh
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-ssh.html
folder: UNIX_guide
---

Connecting to other computers (or clusters, etc.) involves a command called
`ssh`.
It stands for "secure shell," and allows for secure remote access to other
devices. This is helpful.

Oftentimes, there are people much smarter than me that want to heavily protect 
their computers.
Universities are one example.
They create strong firewalls to protect information, which means that a special
way to remote access computers must be used, and that way is through VPN.
VPN stands for "virtual private network," and extends the private network over
the public sphere for those allowed access.
For those affiliated with the University of North Texas (UNT), the easiest
thing is to download Cisco AnyConnect.
More information on how to download Cisco AnyConnect for UNT students is
available at:
[UNT ITS](https://itservices.cas.unt.edu/services/server/network/cisco-anyconnect-mobility-client-vpn)

Once installed and connected, accessing computers, clusters, and systems on the
UNT network is possible.
The VPN address for UNT is `vpn.unt.edu`, and the login is the same as your
UNT email login.

After connection, the command
```bash
$ ssh username@ipaddress.or.title
```
is used to access the device.
For instance, if someone regularly logs in as `euid123` and the computer's
network address is `talon3.hpc.unt.edu`, then their ssh line would be:
```bash
$ ssh euid123@talon3.hpc.unt.edu
```

{% include links.html %}
