---
title: "sudo: Administrator Rights and Installations"
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-sudo.html
folder: UNIX_guide
---

If you have administrator privileges, but are not the complete admin of
everything (i.e. the root user), then you are likely able to use `sudo`.
If you run into issues where you cannot use a command because permission has
been denied, like in this example,
```bash
[euid123@talon3 local]$ mkdir folder_of_doom
mkdir: cannot create directory \`folder_of_doom\': Permission denied
```
then you can try the command with `sudo` in front of it.
```bash
[euid123@talon3 local]$ sudo mkdir folder_of_doom
```
You will then be prompted for the `sudo` password.
You get 3 tries to get it right (like any use of a password except
    [su](UNIXguide-su.html)), and if not, then the instance "is reported to the
    root user."
This is the same as when you try to use `sudo` without the correct privileges.

{% include note.html content="Instances are reported in `/var/log/auth.log` for
Ubuntu systems." %}

Why mention this at all, then, if you probably can't use it?
Because on your own personal computer, or other systems where you are an
administrator, you can use `sudo` to install certain programs from the Terminal
on machines with the
[pip package management system](https://packaging.python.org/tutorials/installing-packages/)
of Python installed.

{% include image.html file="sudo_comic.png"
url="https://imgs.xkcd.com/comics/incident.png" alt="First panel: robm is not
in the sudoers file. The incident will be reported. Panel 2: Rob asks 'Hey--who
does sudo report these incidents to?' Person replies 'You know, I'ver never
checked.' Panel 3: Santa Claus marking someone on the naughty list."
caption="*The Incident* from XKCD." %}

{% include links.html %}
