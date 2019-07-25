---
title: sftp
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-sftp.html
folder: UNIX_guide
---

For transferring files between two remote systems (aka through an `ssh`
    connection), you can use `sftp` (Secure File Transfer Protocol).  
First, navigate to the folder that you would like to send or receive
information from.
Once `sftp` is initiated, the folder for the origin computer cannot be changed.
Then, start the protocol with
```bash
$ sftp username@place
```
You can specify the folder to navigate to, if you want, but do not use the `~`
in place of `/home/username` (it will return an error).
You can create new directories in the receiving end normally with `mkdir`, and
use `cd` as normal.
To send information, use `put` and to receive use `get`.
```bash
sftp> put filename
sftp> get filename
```

{% include links.html %}
