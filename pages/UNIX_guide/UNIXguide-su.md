---
title: "su: Switch User"
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-su.html
folder: UNIX_guide
---

Say you're helping someone on their computer, where you are also a user, and
want to access something like your `.bash_profile` in order to properly assist
them.
Logging them out to log you in would be ridiculously frustrating, and
unfortunately no other computers are around for you to access the system
through an `ssh` connection.
Never fear!
To access your files through the command line, without going through `sudo`
12 times, you can continue using the Terminal as yourself after switching users.
This is done through the `su` command.
```bash
alice@computer $ su bob
Password:
```
This time, you only get one attempt, before you get hit with "su: Sorry."

It is worth noting that the default use of `su` without a specified user is
to switch to the `root` user. (You can read more about that in
[UNIX systems](UNIXguide-UNIX-systems.html))

{% include links.html %}
