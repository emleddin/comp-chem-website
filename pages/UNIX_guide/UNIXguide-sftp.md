---
title: sftp
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-sftp.html
folder: UNIX_guide
---

<link rel="stylesheet" href="css/theme-blue.css">

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
```bash
$ sftp person@computer.location.org:/home/person/path/to/folder/
Password:
Connected to computer.location.org.
Changing to: /home/person/path/to/folder/
sftp>
```

You can create new directories in the receiving end normally with `mkdir`, and
use `cd` as normal.
To send information, use `put` and to receive use `get`.
```bash
sftp> put filename
sftp> get filename
```

[Filezilla](https://filezilla-project.org/) is a helpful program for doing
`sftp` through a graphical interface. When using Filezilla, you enter your
username and password for where you're trying to connect.
Typically, you will use port 22 for connections.

{% include image.html file="UNIXguide/filezilla_sftp.png"
alt="Space for username, password, and port in the Filezilla QuickConnect 
window." caption="Setting up Filezilla." %}


{% include links.html %}
